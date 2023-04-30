#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2207
# shellcheck source=/dev/null
# bash /volume1/homes/admin/scripts/bash/dnstest.sh

# CHECK FOR DIG REQUIREMENT
if ! command -v dig &> /dev/null; then
  echo
  echo "* DIG (Domain Information Gopher) is required for DNS queries, but"
  echo "  is not found in the PATH. Please install it."
  echo
  if [ -e "/proc/sys/kernel/syno_hw_version" ]; then
    echo "  DIG can be installed as a part of the 'SynoCli Network Tools'"
    echo "  package. This can be installed via the DSM Package Center by"
    echo "  adding the 'SynoCommunity' Package Source site, located at:"
    echo
    echo "  https://packages.synocommunity.com/"
  else
    echo "  DIG can typically be installed as a part of the 'dnsutils'"
    echo "  or 'bind-utils' packages. These can be installed via your"
    echo "  package management system."
  fi
    echo
    echo Exiting...
    echo
exit 1
fi

# SCRAPE SCRIPT PATH INFO
SrceFllPth=$(readlink -f "${BASH_SOURCE[0]}")
SrceFolder=$(dirname "$SrceFllPth")
SrceFileNm=${SrceFllPth##*/}

# BUILD LIST OF NAMESERVERS USED BY THIS HOST
NAMESERVERS=($(grep ^nameserver /etc/resolv.conf | awk 'BEGIN{i=0}{i++;}{print $2 "#" $1 "/" i}'))

# CHECK IF LOCALHOST IS RUNNING DNS ON THE DEFAULT PORT
if LOCALTEST=$(netstat -tulpnW | grep "\:53\b" | grep "tcp\b" | grep "LISTEN"); then
# if [ "$?" -eq "0" ]; then
  LOCALDNS=$(echo "$LOCALTEST" | awk -F '/' 'NR==1{ print $2 }')
  LOCALHOST=127.0.0.1#"$LOCALDNS"
  NAMESERVERS=("${LOCALHOST}" "${NAMESERVERS[@]}")
fi
# SANITIZE NAMESERVERS ARRAY
shopt -s extglob                                           # turn on extended glob
NAMESERVERS=("${NAMESERVERS[@]/#+([[:blank:]])/}")         # remove leading space/tab from each element
NAMESERVERS=("${NAMESERVERS[@]/%+([[:blank:]])/}")         # remove trailing space/tab from each element

# BUILD LIST OF IPV4 DNS PROVIDERS
PROVIDERSV4="
# NOTABLE IP4 DNS PROVIDERS
    94.140.14.14#AdGuard/1 
    94.140.15.15#AdGuard/2
   185.228.168.9#CleanBrowsing/1 
   185.228.169.9#CleanBrowsing/2 
         1.1.1.1#Cloudflare/1
         1.0.0.1#Cloudflare/2
      8.26.56.26#Comodo/1
     8.20.247.20#Comodo/2
    84.200.69.80#DNS.Watch/1
    84.200.70.40#DNS.Watch/2
         8.8.8.8#Google/1 
         8.8.4.4#Google/2 
         4.2.2.1#Level3/1 
         4.2.2.2#Level3/2 
       64.6.64.6#Neustar/1
       64.6.65.6#Neustar/2
  208.67.222.222#OpenDNS/1
  208.67.220.220#OpenDNS/2
   216.146.35.35#OracleDyn/1
   216.146.36.36#OracleDyn/2
         9.9.9.9#Quad9/1 
 149.112.112.112#Quad9/2

# OTHER IP4 DNS PROVIDERS
     76.76.19.19#AlternateDNS/1
  76.223.122.150#AlternateDNS/2
       76.76.2.0#ControlD/1
      76.76.10.0#ControlD/2
   103.247.36.36#DNSFilter/1
   103.247.37.37#DNSFilter/2
     80.80.80.80#Freenom/1
     80.80.81.81#Freenom/2
    45.90.28.243#NextDNS/1
    45.90.30.243#NextDNS/2
   199.85.126.10#NortonCS/1 
   199.85.127.10#NortonCS/2 
    195.46.39.39#SafeDNS/1
    195.46.39.40#SafeDNS/2
  91.239.100.100#UncensoredDNS/1
    89.233.43.71#UncensoredDNS/2
       64.6.64.6#Verisign/1
       64.6.65.6#Verisign/2
       77.88.8.8#Yandex/1 
       77.88.8.1#Yandex/2
"
# SORT PROVIDERSV4 ARRAY
IFS=$'\n' PROVIDERSV4=($(sort -t "#" -k 2,2 <<<"${PROVIDERSV4[@]}")); unset IFS

# BUILD LIST OF IPV6 DNS PROVIDERS
PROVIDERSV6="
# NOTABLE IP6 DNS PROVIDERS
         2a10:50c0::ad1:ff#AdGuard/1-v6
         2a10:50c0::ad2:ff#AdGuard/2-v6
            2a0d:2a00:1::2#CleanBrowsing/1-v6
            2a0d:2a00:2::2#CleanBrowsing/2-v6
      2606:4700:4700::1111#Cloudflare/1-v6
      2606:4700:4700::1001#Cloudflare/2-v6
2001:1608:10:25::1c04:b12f#DNS.Watch/1
2001:1608:10:25::9249:d69b#DNS.Watch/2
      2001:4860:4860::8888#Google/1-v6
      2001:4860:4860::8844#Google/2-v6
           2620:74:1b::1:1#Neustar/1
           2620:74:1c::2:2#Neustar/2
           2620:119:35::35#OpenDNS/1-v6
           2620:119:53::53#OpenDNS/2-v6
               2620:fe::fe#Quad9/1-v6
                2620:fe::9#Quad9/2-v6

# OTHER IP6 DNS PROVIDERS
             2602:fcbc::ad#AlternateDNS/1-v6
           2602:fcbc:2::ad#AlternateDNS/2-v6
               2606:1a40::#ControlD/1-v6
             2606:1a40:1::#ControlD/2-v6
        2a07:a8c0::11:b227#NextDNS/1-v6
        2a07:a8c1::11:b227#NextDNS/2-v6
       2001:67c:2778::3939#SafeDNS/1-v6
       2001:67c:2778::3939#SafeDNS/2-v6
           2001:67c:28a4::#UncensoredDNS/1
          2a01:3a0:53:53::#UncensoredDNS/2
        2a02:6b8::feed:0ff#Yandex/1-v6 
    2a02:6b8:0:1::feed:0ff#Yandex/2-v6
"
# SORT PROVIDERSV6 ARRAY
IFS=$'\n' PROVIDERSV6=($(sort -t "#" -k 2,2 <<<"${PROVIDERSV6[@]}")); unset IFS

# BUILD LIST OF DOMAINS TO TEST AGAINST
DOMAINS2TEST="
# 13 TESTS OR LESS SHOULD FIT WITHIN 80 CHARACTER TERMINAL DISPLAY
  www.google.com
  www.youtube.com
  www.facebook.com
  www.amazon.com
  www.reddit.com
  www.apple.com
  www.yahoo.com
  www.wikipedia.org
  www.twitter.com
  www.paypal.com
  docker.io
  github.com
  gmail.com

# OTHER TOP/POPULAR WEBSITES TO TEST AGAINST
# www.bing.com
# www.fandom.com
# www.microsoftonline.com
# www.walmart.com
# www.duckduckgo.com
# www.weather.com
# www.indeed.com
# www.qccerttest.com
# www.quora.com
# www.ebay.com
# www.cnn.com
# www.espn.com
# www.etsy.com
# www.nytimes.com
# www.imdb.com
# www.usps.com
# www.office.com
# www.microsoft.com
# www.zillow.com
# www.live.com
# www.plex.tv

# SOCIAL NETWORKING SITES
# www.instagram.com
# www.twitch.tv
# www.tiktok.com
# www.linkedin.com

# PORN SITES
# www.pornhub.com
# www.xvideos.com
# www.xnxx.com
# www.spankbang.com
# www.xhamster.com
"
# SORT DOMAINS2TEST ARRAY
IFS=$'\n' DOMAINS2TEST=($(sort -u <<<"${DOMAINS2TEST[@]}")); unset IFS

# SANITIZE DOMAINS2TEST ARRAY
shopt -s extglob                                           # turn on extended glob
DOMAINS2TEST=("${DOMAINS2TEST[@]/#+([[:blank:]])/}")       # remove leading space/tab from each element
DOMAINS2TEST=("${DOMAINS2TEST[@]/%+([[:blank:]])/}")       # remove trailing space/tab from each element

if [ "$1" = "ipv6" ]; then
  PROVIDERSTOTEST=("${PROVIDERSV6[@]}")
elif [ "$1" = "ipv4" ]; then
  PROVIDERSTOTEST=("${PROVIDERSV4[@]}")
elif [ "$1" = "all" ]; then
    PROVIDERSTOTEST=("${PROVIDERSV4[@]}" "${PROVIDERSV6[@]}")
else
  PROVIDERSTOTEST=("${PROVIDERSV4[@]}")
fi
if [ "$1" = "host" ]; then
  PROVIDERSTOTEST=("${NAMESERVERS[@]}")
elif [ "$1" = "-host" ]; then
  PROVIDERSTOTEST=("${PROVIDERSTOTEST[@]}")
else
  PROVIDERSTOTEST=("${NAMESERVERS[@]}" "${PROVIDERSTOTEST[@]}")
fi
# SANITIZE NAMESERVERS ARRAY
shopt -s extglob                                           # turn on extended glob
PROVIDERSTOTEST=("${PROVIDERSTOTEST[@]/#+([[:blank:]])/}") # remove leading space/tab from each element
PROVIDERSTOTEST=("${PROVIDERSTOTEST[@]/%+([[:blank:]])/}") # remove trailing space/tab from each element

# DETERMINE NAMESERVERS NAME LENGTH ($nsl)
for item in "${PROVIDERSTOTEST[@]}"; do
if [[ -n "$item" ]] && [[ ! $item =~ ^#.* ]]; then
  pname=${item##*#}
  plength[${#pname}]=${item##*#} # use word length as index
fi
done
longest=("${plength[@]: -1}")    # select last array element
length=$((${#longest}))
nsl="%-$((${#longest} + 1))s"

echo 
echo TESTING DOMAINS:
echo 
echo Test Domain Name
echo ---- ---------------
for d in "${DOMAINS2TEST[@]}"; do
if [[ -n "$d" ]] && [[ ! $d =~ ^#.* ]]; then
  totaldomains=$((totaldomains + 1))
  printf "%3s: %s\n" "t$totaldomains" "$d"
fi
done
unset totaldomains

echo 
echo ALPHABETICAL TESTING:
echo 

# REDIRECT STDOUT TO TEE IN ORDER TO DUPLICATE THE OUTPUT TO THE TERMINAL AS WELL AS A .LOG FILE
exec > >(tee "$SrceFllPth.log")

# totaldomains=0
eval printf '$nsl' "Provider"
for d in "${DOMAINS2TEST[@]}"; do
if [[ -n "$d" ]] && [[ ! $d =~ ^#.* ]]; then
  totaldomains=$((totaldomains + 1))
  printf "%-4s" "t$totaldomains"
fi
done
printf "%9s\n" "Median ms"
eval printf -- '-%.0s' "{1..$length}"
printf ' %.0s' ""
for d in "${DOMAINS2TEST[@]}"; do
if [[ -n "$d" ]] && [[ ! $d =~ ^#.* ]]; then
  printf "%-4s" "---"
fi
done
printf "%-4s\n" "---------"

for p in "${PROVIDERSTOTEST[@]}"; do
if [[ -n "$p" ]] && [[ ! $p =~ ^#.* ]]; then

    pip=${p%%#*}
    pname=${p##*#}
    ftime=0
    xtime=0

    eval printf '$nsl' "$pname"
    for d in "${DOMAINS2TEST[@]}"; do
    if [[ -n "$d" ]] && [[ ! $d =~ ^#.* ]]; then

      ttime=$(dig +tries=1 +timeout=1  @"$pip" "$d" |  grep "Query time:" | awk '{ print $4 }')



  # NSLOOKUP INSTEAD OF DIG
      # TEST=$((time (nslookup -timeout=1 -retry=0 www.microsoft.com 89.233.43.71)) 2>&1)
      # echo "$TEST" | grep "connection timed out"
      # echo "$TEST" | grep "real"



      if [ -z "$ttime" ]; then
  	    #let's have time out be 1s = 1000ms
  	    ttime=1000
      elif [ "$ttime" = "0" ]; then
  	    ttime=1
  	  fi

      if [ "$ttime" -ge "1000" ]; then
       printf "%-4s" "*"
       xtime=$((xtime+1))
      else
        printf "%-4s" "$ttime"
      fi

      ftime=$((ftime + ttime))

    fi
    done
    avg=$(awk -v a="$ftime" -v b="$totaldomains" 'BEGIN { printf "%.2f", a/b }' </dev/null)

      if [ "$xtime" -gt "0" ]; then
        printf "%-3s %5s\n" "999" "$xtime-to"
        unset xtime
      else
        printf "%9s\n" "$avg ms"
      fi
  # sleep 30
  fi
done

# CLOSE AND NORMALIZE THE LOGGING REDIRECTIONS
exec > /dev/tty 2>&1

# SORT THE LOGGED OUTPUT BY FASTEST MEDIAN RESPONSE TIME
read -r third_line < <(head -n 3 "$SrceFllPth".log | tail -n 1)
num_fields=$(echo "$third_line" | awk '{print NF}')
sort -k "$((num_fields - 1))" -k "$num_fields" -n "$SrceFllPth".log -o "$SrceFllPth".sorted.log
(tail -n +3 "$SrceFllPth".log | sort -k "$((num_fields - 1))" -k "$num_fields" -n) \
 | cat <(head -n 2 "$SrceFllPth".log) - > "$SrceFllPth".sorted.log

echo 
echo RESULTS SORTED BY MEDIAN RESPONSE TIME \("$SrceFileNm.sorted.log"\):
echo
cat "$SrceFllPth".sorted.log
echo 

# exit 0;
