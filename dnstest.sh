#!/usr/bin/env bash

command -v bc > /dev/null || { echo "bc was not found. Please install bc."; exit 1; }
{ command -v drill > /dev/null && dig=drill; } || { command -v dig > /dev/null && dig=dig; } || { echo "dig was not found. Please install dnsutils."; exit 1; }

TO_FILE=0
if [ $# -eq 1 ]
then
    TO_FILE=1
    OUTPUT_FILE=$1
    if [ ! -f "$OUTPUT_FILE" ]
    then
        touch "$OUTPUT_FILE"
    fi
elif [ $# -gt 1 ]
then
    echo "Usage: ./dnstest.sh [file_path]"
    exit 1;
fi


NAMESERVERS=`cat /etc/resolv.conf | grep ^nameserver | cut -d " " -f 2 | sed 's/\(.*\)/&#&/'`

PROVIDERS="
1.1.1.1#cloudflare 
4.2.2.1#level3 
8.8.8.8#google 
9.9.9.9#quad9 
80.80.80.80#freenom 
208.67.222.123#opendns 
199.85.126.20#norton 
185.228.168.168#cleanbrowsing 
77.88.8.7#yandex 
176.103.130.132#adguard 
156.154.70.3#neustar 
8.26.56.26#comodo
"

# Domains to test. Duplicated domains are ok
DOMAINS2TEST="www.google.com amazon.com facebook.com www.youtube.com www.reddit.com  wikipedia.org twitter.com gmail.com www.google.com whatsapp.com"

totaldomains=0
if [ $TO_FILE -eq 0 ]
then
    printf "%-18s" ""
    for d in $DOMAINS2TEST; do
        totaldomains=$((totaldomains + 1))
        printf "%-8s" "test$totaldomains"
    done
    printf "%-8s" "Average"
    echo ""
else
    for d in $DOMAINS2TEST; do
        totaldomains=$((totaldomains + 1))
        printf "test%i," $totaldomains >> "$OUTPUT_FILE"
    done
    printf "Average,\n" >> "$OUTPUT_FILE"
fi



for p in $NAMESERVERS $PROVIDERS; do
    pip=${p%%#*}
    pname=${p##*#}
    ftime=0

    if [ $TO_FILE -eq 0 ]
    then
        printf "%-18s" "$pname"
    else
        printf "$pname" >> "$OUTPUT_FILE"
    fi

    for d in $DOMAINS2TEST; do
        ttime=`$dig +tries=1 +time=2 +stats @$pip $d |grep "Query time:" | cut -d : -f 2- | cut -d " " -f 2`
        if [ -z "$ttime" ]; then
	        #let's have time out be 1s = 1000ms
	        ttime=1000
        elif [ "x$ttime" = "x0" ]; then
	        ttime=1
	    fi

        if [ $TO_FILE -eq 0 ]
        then
            printf "%-8s" "$ttime ms"
        else
            printf "%i," $ttime >> "$OUTPUT_FILE"
        fi

        ftime=$((ftime + ttime))
    done
    avg=`bc -lq <<< "scale=2; $ftime/$totaldomains"`

    if [ $TO_FILE -eq 0 ]
    then    
        echo "  $avg"
    else
        printf "%.2f,\n" "$avg" >> "$OUTPUT_FILE"
    fi

done


exit 0;
