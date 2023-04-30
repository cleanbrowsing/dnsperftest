# DNS Performance Test

Shell script to test the performance of the most popular DNS resolvers from your location.

Includes the redundant servers of notable DNS providers by default:

* AdGuard
* CleanBrowsing 
* Cloudflare (1.1.1.1)
* Comodo
* DNS.Watch
* Google (8.8.8.8)
* Level3 (4.2.2.1)
* Neustar
* OpenDNS (208.67.222.222)
* OracleDyn
* Quad9 (9.9.9.9)

As well as the redundant servers of these other well-known providers:

* AlternateDNS
* ControlD
* DNSFilter
* Freenom
* NextDNS
* NortonCS 
* SafeDNS
* UncensoredDNS
* Verisign
* Yandex 

13 default domain names are tested, with many others available as toggleable in the code:

* docker.io
* github.com
* gmail.com
* www.amazon.com
* www.apple.com
* www.facebook.com
* www.google.com
* www.paypal.com
* www.reddit.com
* www.twitter.com
* www.wikipedia.org
* www.yahoo.com
* www.youtube.com

# Required 

You need to install `dig`. `bc` is no longer a requirement.

# Utilization and example output:

    # bash dnstest.sh
    
    TESTING DOMAINS:
    
    Test Domain Name
    ---- ---------------
     t1: docker.io
     t2: github.com
     t3: gmail.com
     t4: www.amazon.com
     t5: www.apple.com
     t6: www.facebook.com
     t7: www.google.com
     t8: www.paypal.com
     t9: www.reddit.com
    t10: www.twitter.com
    t11: www.wikipedia.org
    t12: www.yahoo.com
    t13: www.youtube.com
    
    ALPHABETICAL TESTING:
    
    Provider        t1  t2  t3  t4  t5  t6  t7  t8  t9  t10 t11 t12 t13 Median ms
    --------------- --- --- --- --- --- --- --- --- --- --- --- --- --- ---------
    pihole-FTL      1   1   1   1   1   1   1   1   1   1   1   1   1     1.00 ms
    nameserver/1    49  21  64  82  79  20  19  19  20  19  74  20  19   38.85 ms
    nameserver/2    50  69  52  29  30  22  21  20  21  19  49  19  22   32.54 ms
    AdGuard/1       106 56  84  56  55  57  55  56  58  58  202 56  58   73.62 ms
    AdGuard/2       56  55  56  57  58  58  58  56  57  57  58  58  56   56.92 ms
    AlternateDNS/1  76  76  75  76  76  76  76  75  78  74  77  75  76   75.85 ms
    AlternateDNS/2  76  76  80  76  76  77  72  73  77  78  78  76  76   76.23 ms
    CleanBrowsing/1 97  81  79  81  80  80  82  83  79  84  81  80  83   82.31 ms
    CleanBrowsing/2 57  55  56  55  55  55  53  57  55  55  56  56  55   55.38 ms
    Cloudflare/1    50  47  49  45  48  48  46  48  48  50  48  50  45   47.85 ms
    Cloudflare/2    49  48  49  49  46  44  49  48  48  49  45  49  46   47.62 ms
    Comodo/1        30  29  31  30  32  30  32  31  30  30  149 28  31   39.46 ms
    Comodo/2        30  25  30  30  30  31  31  30  30  30  30  31  33   30.08 ms
    ControlD/1      24  20  35  22  32  21  21  61  21  26  182 21  21   39.00 ms
    ControlD/2      21  21  19  20  22  21  19  22  20  21  20  20  19   20.38 ms
    DNSFilter/1     19  17  18  19  19  20  18  17  19  20  20  20  19   18.85 ms
    DNSFilter/2     21  22  21  18  19  20  20  22  21  22  21  19  20   20.46 ms
    DNS.Watch/1     162 167 164 162 163 176 162 166 165 167 183 175 165 167.46 ms
    DNS.Watch/2     159 160 165 166 164 182 167 162 *   162 170 161 166 999  1-to
    Freenom/1       399 194 360 264 286 193 196 556 *   205 620 258 195 999  1-to
    Freenom/2       412 191 311 507 288 195 195 205 301 235 614 724 194 336.31 ms
    Google/1        20  20  18  29  23  19  18  19  18  17  55  17  19   22.46 ms
    Google/2        17  21  26  61  23  19  18  18  20  21  18  19  21   23.23 ms
    Level3/1        21  18  18  18  20  17  18  18  17  19  18  20  20   18.62 ms
    Level3/2        19  17  16  18  19  18  17  21  17  20  21  16  20   18.38 ms
    Neustar/1       61  27  28  24  28  25  26  27  27  28  28  27  26   29.38 ms
    Neustar/2       18  20  19  38  21  20  21  18  19  19  19  19  21   20.92 ms
    NextDNS/1       20  18  19  21  19  20  19  21  18  21  20  20  19   19.62 ms
    NextDNS/2       54  21  19  20  14  20  21  22  20  21  21  21  20   22.62 ms
    NortonCS/1      33  20  19  19  21  20  20  20  19  18  21  19  19   20.62 ms
    NortonCS/2      43  29  26  24  27  24  27  26  27  25  26  27  27   27.54 ms
    OpenDNS/1       21  21  34  48  29  19  20  18  20  19  79  18  20   28.15 ms
    OpenDNS/2       22  22  37  60  19  30  18  19  19  19  18  19  21   24.85 ms
    OracleDyn/1     39  29  27  24  25  27  25  23  29  30  25  30  28   27.77 ms
    OracleDyn/2     40  31  28  27  27  27  28  32  29  26  27  28  28   29.08 ms
    Quad9/1         21  20  21  19  21  20  20  19  18  19  20  19  19   19.69 ms
    Quad9/2         18  22  19  24  19  20  21  21  19  21  19  20  20   20.23 ms
    SafeDNS/1       137 136 146 163 135 135 146 137 134 132 135 136 176 142.15 ms
    SafeDNS/2       136 135 134 136 136 135 137 136 135 135 135 135 135 135.38 ms
    UncensoredDNS/1 *   *   *   *   *   *   *   *   *   *   *   *   *   999 13-to
    UncensoredDNS/2 *   *   *   *   *   *   *   *   *   *   *   *   *   999 13-to
    Verisign/1      33  28  29  27  28  27  27  27  27  27  28  27  25   27.69 ms
    Verisign/2      21  18  19  19  14  18  18  19  18  20  21  20  20   18.85 ms
    Yandex/1        203 210 202 197 192 201 206 204 623 199 202 198 185 232.46 ms
    Yandex/2        194 187 189 190 195 207 188 214 209 186 206 202 187 196.46 ms
    
    RESULTS SORTED BY MEDIAN RESPONSE TIME (dnstest.sh.sorted.log):
    
    Provider        t1  t2  t3  t4  t5  t6  t7  t8  t9  t10 t11 t12 t13 Median ms
    --------------- --- --- --- --- --- --- --- --- --- --- --- --- --- ---------
    pihole-FTL      1   1   1   1   1   1   1   1   1   1   1   1   1     1.00 ms
    Level3/2        19  17  16  18  19  18  17  21  17  20  21  16  20   18.38 ms
    Level3/1        21  18  18  18  20  17  18  18  17  19  18  20  20   18.62 ms
    DNSFilter/1     19  17  18  19  19  20  18  17  19  20  20  20  19   18.85 ms
    Verisign/2      21  18  19  19  14  18  18  19  18  20  21  20  20   18.85 ms
    NextDNS/1       20  18  19  21  19  20  19  21  18  21  20  20  19   19.62 ms
    Quad9/1         21  20  21  19  21  20  20  19  18  19  20  19  19   19.69 ms
    Quad9/2         18  22  19  24  19  20  21  21  19  21  19  20  20   20.23 ms
    ControlD/2      21  21  19  20  22  21  19  22  20  21  20  20  19   20.38 ms
    DNSFilter/2     21  22  21  18  19  20  20  22  21  22  21  19  20   20.46 ms
    NortonCS/1      33  20  19  19  21  20  20  20  19  18  21  19  19   20.62 ms
    Neustar/2       18  20  19  38  21  20  21  18  19  19  19  19  21   20.92 ms
    Google/1        20  20  18  29  23  19  18  19  18  17  55  17  19   22.46 ms
    NextDNS/2       54  21  19  20  14  20  21  22  20  21  21  21  20   22.62 ms
    Google/2        17  21  26  61  23  19  18  18  20  21  18  19  21   23.23 ms
    OpenDNS/2       22  22  37  60  19  30  18  19  19  19  18  19  21   24.85 ms
    NortonCS/2      43  29  26  24  27  24  27  26  27  25  26  27  27   27.54 ms
    Verisign/1      33  28  29  27  28  27  27  27  27  27  28  27  25   27.69 ms
    OracleDyn/1     39  29  27  24  25  27  25  23  29  30  25  30  28   27.77 ms
    OpenDNS/1       21  21  34  48  29  19  20  18  20  19  79  18  20   28.15 ms
    OracleDyn/2     40  31  28  27  27  27  28  32  29  26  27  28  28   29.08 ms
    Neustar/1       61  27  28  24  28  25  26  27  27  28  28  27  26   29.38 ms
    Comodo/2        30  25  30  30  30  31  31  30  30  30  30  31  33   30.08 ms
    nameserver/2    50  69  52  29  30  22  21  20  21  19  49  19  22   32.54 ms
    nameserver/1    49  21  64  82  79  20  19  19  20  19  74  20  19   38.85 ms
    ControlD/1      24  20  35  22  32  21  21  61  21  26  182 21  21   39.00 ms
    Comodo/1        30  29  31  30  32  30  32  31  30  30  149 28  31   39.46 ms
    Cloudflare/2    49  48  49  49  46  44  49  48  48  49  45  49  46   47.62 ms
    Cloudflare/1    50  47  49  45  48  48  46  48  48  50  48  50  45   47.85 ms
    CleanBrowsing/2 57  55  56  55  55  55  53  57  55  55  56  56  55   55.38 ms
    AdGuard/2       56  55  56  57  58  58  58  56  57  57  58  58  56   56.92 ms
    AdGuard/1       106 56  84  56  55  57  55  56  58  58  202 56  58   73.62 ms
    AlternateDNS/1  76  76  75  76  76  76  76  75  78  74  77  75  76   75.85 ms
    AlternateDNS/2  76  76  80  76  76  77  72  73  77  78  78  76  76   76.23 ms
    CleanBrowsing/1 97  81  79  81  80  80  82  83  79  84  81  80  83   82.31 ms
    SafeDNS/2       136 135 134 136 136 135 137 136 135 135 135 135 135 135.38 ms
    SafeDNS/1       137 136 146 163 135 135 146 137 134 132 135 136 176 142.15 ms
    DNS.Watch/1     162 167 164 162 163 176 162 166 165 167 183 175 165 167.46 ms
    Yandex/2        194 187 189 190 195 207 188 214 209 186 206 202 187 196.46 ms
    Yandex/1        203 210 202 197 192 201 206 204 623 199 202 198 185 232.46 ms
    Freenom/2       412 191 311 507 288 195 195 205 301 235 614 724 194 336.31 ms
    DNS.Watch/2     159 160 165 166 164 182 167 162 *   162 170 161 166 999  1-to
    Freenom/1       399 194 360 264 286 193 196 556 *   205 620 258 195 999  1-to
    UncensoredDNS/1 *   *   *   *   *   *   *   *   *   *   *   *   *   999 13-to
    UncensoredDNS/2 *   *   *   *   *   *   *   *   *   *   *   *   *   999 13-to
    
