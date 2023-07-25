#!/usr/bin/env bash


command -v bc > /dev/null || { echo "error: bc was not found. Please install bc."; exit 1; }
{ command -v drill > /dev/null && dig=drill; } || { command -v dig > /dev/null && dig=dig; } || { echo "error: dig was not found. Please install dnsutils."; exit 1; }


NAMESERVERS=`cat /etc/resolv.conf | grep ^nameserver | cut -d " " -f 2 | sed 's/\(.*\)/&#&/'`

PROVIDERSV4="
1.1.1.1#cloudflare1
1.1.1.2#cloudflare2
8.8.8.8#google
9.9.9.9#quad9
208.67.222.123#opendns
176.103.130.132#adguard
4.2.2.1#level3-1
209.244.0.3#level3-2
80.80.80.80#freenom
84.200.69.80#DNS.Watch
199.85.126.20#norton
185.228.168.168#cleanbrowsing
77.88.8.7#yandex
156.154.70.3#neustar
8.26.56.26#comodo
45.90.28.202#nextdns
64.6.64.6#Verisign
223.5.5.5#alidns
195.46.39.39#SafeDNS
216.146.35.35#DynDNS
117.50.11.11#OneDNS
180.76.76.76#Baidu
74.82.42.42#HE.NET
"

PROVIDERSV6="
2606:4700:4700::1111#cloudflare-v6
2606:4700:4700::1112#cloudflare-v62
2001:4860:4860::8888#google-v6
2620:fe::fe#quad9-v6
2620:119:35::35#opendns-v6
2a0d:2a00:1::1#cleanbrowsing-v6
2a02:6b8::feed:0ff#yandex-v6
2a00:5a60::ad1:0ff#adguard-v6
2610:a1:1018::3#neustar-v6
2620:119:53::53#comodo-v6
"

# Testing for IPv6
$dig +short +tries=1 +time=2 +stats @2606:4700:4700::1111 alsyundawy.my.id | grep '172.67.134.149\|104.21.6.70' >/dev/null 2>&1
if [ $? = 0 ]; then
    hasipv6="true"
fi

providerstotest=$PROVIDERSV4

if [ "x$1" = "xipv6" ]; then
    if [ "x$hasipv6" = "x" ]; then
        echo "error: IPv6 support not found. Unable to do the ipv6 test."; exit 1;
    fi
    providerstotest=$PROVIDERSV6

elif [ "x$1" = "xipv4" ]; then
    providerstotest=$PROVIDERSV4

elif [ "x$1" = "xall" ]; then
    if [ "x$hasipv6" = "x" ]; then
        providerstotest=$PROVIDERSV4
    else
        providerstotest="$PROVIDERSV4 $PROVIDERSV6"
    fi
else
    providerstotest=$PROVIDERSV4
fi

    

# Domains to test. Duplicated domains are ok
DOMAINS2TEST="google.com telegram.org facebook.com youtube.com instagram.com wikipedia.org twitter.com www.tokopedia.com whatsapp.com tiktok.com"


totaldomains=0
printf "%-21s" ""
for d in $DOMAINS2TEST; do
    totaldomains=$((totaldomains + 1))
    printf "%-8s" "test$totaldomains"
done
printf "%-8s" "Average"
echo ""


for p in $NAMESERVERS $providerstotest; do
    pip=${p%%#*}
    pname=${p##*#}
    ftime=0

    printf "%-21s" "$pname"
    for d in $DOMAINS2TEST; do
        ttime=`$dig +tries=1 +time=2 +stats @$pip $d |grep "Query time:" | cut -d : -f 2- | cut -d " " -f 2`
        if [ -z "$ttime" ]; then
	        #let's have time out be 1s = 1000ms
	        ttime=1000
        elif [ "x$ttime" = "x0" ]; then
	        ttime=1
	    fi

        printf "%-8s" "$ttime ms"
        ftime=$((ftime + ttime))
    done
    avg=`bc -l <<< "scale=2; $ftime/$totaldomains"`

    echo "  $avg"
done


exit 0;
