#!/usr/bin/env bash

command -v bc > /dev/null || { echo "bc was not found. Please install bc."; exit 1; }
{ command -v drill > /dev/null && dig=drill; } || { command -v dig > /dev/null && dig=dig; } || { echo "dig was not found. Please install dnsutils."; exit 1; }


# Local DNS resolvers
NAMESERVERS=`cat /etc/resolv.conf | grep ^nameserver | cut -d " " -f 2 | sed 's/\(.*\)/&#&/'`

# Upstream DNS resolvers
# Non-standard ports may be specified e.g. 127.0.0.1:5353#mydns
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

# Number of domains to test
NUM_DOMAINS2TEST=10

# Random domains to choose from
RANDOM_DOMAINS=(
`curl -sS https://raw.githubusercontent.com/opendns/public-domain-lists/master/opendns-top-domains.txt`
`curl -sS https://raw.githubusercontent.com/opendns/public-domain-lists/master/opendns-random-domains.txt`
)

heading="DOMAINS TO TEST: "; echo -n "$heading"
results_indent=$((${#heading} - 3))
results_tempfile=`mktemp`
domains2test=""
num_random_domains=${#RANDOM_DOMAINS[*]}

for ((i=1; i <= $NUM_DOMAINS2TEST; i++)); do
    if [ $i -gt 1 ]; then
        printf "%-${#heading}s" ""
    fi

    domain_id=`printf "%5s" "($i) "`; echo -n "$domain_id"
    domain_heading="   $domain_id"
    results_header="$results_header$domain_heading"
    random_domain=${RANDOM_DOMAINS[$RANDOM % num_random_domains]}; echo $random_domain
    domains2test="$domains2test $random_domain"
done

avg_heading="  AVERAGE"
results_header="$results_header$avg_heading"
printf "\n%-${results_indent}s" ""
echo "$results_header"

for p in $NAMESERVERS $PROVIDERS; do
    pip=${p%%#*}
    pname=${p##*#}
    ftime=0

    printf "%-${results_indent}s" "$pname" | tee -a $results_tempfile
    for d in $domains2test; do
        ttime=`$dig +tries=1 +time=2 +stats @${pip/:/" -p"} $d | grep "Query time:" | cut -d : -f 2- | cut -d " " -f 2`
        if [ -z "$ttime" ]; then
	        #let's have time out be 1s = 1000ms
	        ttime=1000
        elif [ "x$ttime" = "x0" ]; then
	        ttime=1
	    fi

        printf "%${#domain_heading}s" "$ttime ms" | tee -a $results_tempfile
        ftime=$((ftime + ttime))
    done
    avg=`bc -lq <<< "scale=2; $ftime/$NUM_DOMAINS2TEST"`

    printf "%${#avg_heading}s\n" $avg | tee -a $results_tempfile
done

printf "\n%-${results_indent}s" "SORTED BY AVG."
echo "$results_header"
sort -g -k$((2*$NUM_DOMAINS2TEST + 2)) $results_tempfile
rm $results_tempfile


exit 0;
