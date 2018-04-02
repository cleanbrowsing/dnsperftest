#!/bin/sh

PROVIDERS="
1.1.1.1#cloudflare 
8.8.8.8#google 
9.9.9.9#quad9 
208.67.222.123#opendns 
199.85.126.20#norton 
185.228.168.168#cleanbrowsing 
77.88.8.7#yandex 
176.103.130.132#adguard 
156.154.70.3#neustar 
8.26.56.26#comodo
"

# Domains to test. Duplicated domains are ok
DOMAINS2TEST="www.google.com amazon.com facebook.com www.youtube.com www.pornhub.com  wikipedia.org twitter.com gmail.com www.google.com whatsapp.com"


totaldomains=0
printf "%-15s" ""
for d in $DOMAINS2TEST; do
    totaldomains=`expr $totaldomains + 1`
    printf "%-8s" "test$totaldomains"
done
printf "%-8s" "Average"
echo ""


for p in $PROVIDERS; do
    pip=`echo $p| cut -d '#' -f 1`;
    pname=`echo $p| cut -d '#' -f 2`;
    ftime=0

    printf "%-15s" "$pname"
    for d in $DOMAINS2TEST; do
        ttime=`dig $d @$pip |grep "Query time:" | cut -d : -f 2- | cut -d " " -f 2`
        printf "%-8s" "$ttime ms"
        ftime=`expr $ftime + $ttime`
    done
    avg=`bc <<< "scale=2; $ftime/$totaldomains"`

    echo "  $avg"
done


exit 0;
