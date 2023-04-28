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
    nameserver/1    52  21  48  120 30  17  17  19  19  19  85  17  18   37.08 ms
    nameserver/2    54  50  21  31  30  30  19  22  22  20  77  20  19   31.92 ms
    AdGuard/1       55  57  56  58  57  56  56  57  57  56  56  56  57   56.46 ms
    AdGuard/2       57  55  56  57  62  57  56  56  58  57  52  56  60   56.85 ms
    AlternateDNS/1  87  89  75  77  77  78  76  75  78  78  78  75  76   78.38 ms
    AlternateDNS/2  75  74  77  78  76  76  80  77  75  74  77  78  76   76.38 ms
    CleanBrowsing/1 88  81  80  81  84  80  81  83  81  81  80  81  79   81.54 ms
    CleanBrowsing/2 78  55  56  54  55  54  54  53  56  62  54  52  53   56.62 ms
    Cloudflare/1    42  42  44  46  43  46  48  45  45  44  45  46  45   44.69 ms
    Cloudflare/2    44  46  46  45  47  48  45  44  44  45  45  45  46   45.38 ms
    Comodo/1        30  33  28  30  28  28  30  31  34  30  30  29  29   30.00 ms
    Comodo/2        30  29  30  30  30  31  31  27  25  29  32  30  31   29.62 ms
    ControlD/1      22  29  20  22  29  20  19  22  22  19  20  24  20   22.15 ms
    ControlD/2      21  20  22  22  22  19  20  21  20  21  20  18  20   20.46 ms
    DNSFilter/1     18  19  18  20  19  20  17  18  20  23  20  22  21   19.62 ms
    DNSFilter/2     14  14  22  17  20  20  19  19  20  20  20  20  21   18.92 ms
    DNS.Watch/1     172 165 166 173 181 165 174 *   169 199 160 173 *   999  2-to
    DNS.Watch/2     *   170 185 166 161 165 166 205 170 162 293 167 199 999  1-to
    Freenom/1       231 284 309 377 247 194 194 479 339 333 585 269 194 310.38 ms
    Freenom/2       313 356 291 381 *   195 195 301 354 398 670 195 195 999  1-to
    Google/1        18  20  25  30  20  19  20  19  20  19  19  15  19   20.23 ms
    Google/2        19  22  20  30  20  19  18  18  19  19  19  21  18   20.15 ms
    Level3/1        19  19  17  18  17  19  17  18  18  18  23  16  17   18.15 ms
    Level3/2        19  20  18  20  18  18  19  19  19  18  19  20  18   18.85 ms
    Neustar/1       47  62  25  27  26  26  26  25  27  27  26  25  24   30.23 ms
    Neustar/2       16  17  18  15  16  20  15  17  19  19  22  19  20   17.92 ms
    NextDNS/1       20  21  20  20  20  19  20  20  19  20  20  20  20   19.92 ms
    NextDNS/2       22  24  26  33  21  21  19  21  20  21  21  20  19   22.15 ms
    NortonCS/1      21  19  19  19  22  20  22  20  20  19  21  21  18   20.08 ms
    NortonCS/2      25  26  24  25  26  26  24  22  23  25  27  26  26   25.00 ms
    OpenDNS/1       49  23  35  29  20  51  18  17  19  19  77  19  18   30.31 ms
    OpenDNS/2       23  20  18  59  47  25  46  19  19  21  84  21  20   32.46 ms
    OracleDyn/1     45  26  26  30  28  26  26  29  28  25  29  25  27   28.46 ms
    OracleDyn/2     27  29  29  28  26  29  31  25  27  30  26  28  28   27.92 ms
    Quad9/1         46  20  24  23  18  20  19  18  20  18  21  15  19   21.62 ms
    Quad9/2         19  20  18  18  20  18  19  20  18  20  19  15  21   18.85 ms
    SafeDNS/1       136 134 138 136 135 135 136 133 135 137 137 135 169 138.15 ms
    SafeDNS/2       137 135 135 138 135 137 134 134 137 136 136 135 135 135.69 ms
    UncensoredDNS/1 *   *   *   *   *   *   *   *   *   *   *   *   *   999 13-to
    UncensoredDNS/2 *   *   *   *   *   *   *   *   *   *   *   *   *   999 13-to
    Verisign/1      43  26  26  28  27  26  27  26  27  29  28  27  26   28.15 ms
    Verisign/2      21  20  15  18  17  13  15  19  18  18  16  19  21   17.69 ms
    Yandex/1        779 186 195 184 191 203 199 196 204 194 192 206 203 240.92 ms
    Yandex/2        253 214 209 191 185 211 185 197 209 197 190 195 184 201.54 ms
    
    RESULTS SORTED BY MEDIAN RESPONSE TIME:
    
    pihole-FTL      1   1   1   1   1   1   1   1   1   1   1   1   1     1.00 ms
    Verisign/2      21  20  15  18  17  13  15  19  18  18  16  19  21   17.69 ms
    Neustar/2       16  17  18  15  16  20  15  17  19  19  22  19  20   17.92 ms
    Level3/1        19  19  17  18  17  19  17  18  18  18  23  16  17   18.15 ms
    Level3/2        19  20  18  20  18  18  19  19  19  18  19  20  18   18.85 ms
    Quad9/2         19  20  18  18  20  18  19  20  18  20  19  15  21   18.85 ms
    DNSFilter/2     14  14  22  17  20  20  19  19  20  20  20  20  21   18.92 ms
    DNSFilter/1     18  19  18  20  19  20  17  18  20  23  20  22  21   19.62 ms
    NextDNS/1       20  21  20  20  20  19  20  20  19  20  20  20  20   19.92 ms
    NortonCS/1      21  19  19  19  22  20  22  20  20  19  21  21  18   20.08 ms
    Google/2        19  22  20  30  20  19  18  18  19  19  19  21  18   20.15 ms
    Google/1        18  20  25  30  20  19  20  19  20  19  19  15  19   20.23 ms
    ControlD/2      21  20  22  22  22  19  20  21  20  21  20  18  20   20.46 ms
    Quad9/1         46  20  24  23  18  20  19  18  20  18  21  15  19   21.62 ms
    ControlD/1      22  29  20  22  29  20  19  22  22  19  20  24  20   22.15 ms
    NextDNS/2       22  24  26  33  21  21  19  21  20  21  21  20  19   22.15 ms
    NortonCS/2      25  26  24  25  26  26  24  22  23  25  27  26  26   25.00 ms
    OracleDyn/2     27  29  29  28  26  29  31  25  27  30  26  28  28   27.92 ms
    Verisign/1      43  26  26  28  27  26  27  26  27  29  28  27  26   28.15 ms
    OracleDyn/1     45  26  26  30  28  26  26  29  28  25  29  25  27   28.46 ms
    Comodo/2        30  29  30  30  30  31  31  27  25  29  32  30  31   29.62 ms
    Comodo/1        30  33  28  30  28  28  30  31  34  30  30  29  29   30.00 ms
    Neustar/1       47  62  25  27  26  26  26  25  27  27  26  25  24   30.23 ms
    OpenDNS/1       49  23  35  29  20  51  18  17  19  19  77  19  18   30.31 ms
    nameserver/2    54  50  21  31  30  30  19  22  22  20  77  20  19   31.92 ms
    OpenDNS/2       23  20  18  59  47  25  46  19  19  21  84  21  20   32.46 ms
    nameserver/1    52  21  48  120 30  17  17  19  19  19  85  17  18   37.08 ms
    Cloudflare/1    42  42  44  46  43  46  48  45  45  44  45  46  45   44.69 ms
    Cloudflare/2    44  46  46  45  47  48  45  44  44  45  45  45  46   45.38 ms
    AdGuard/1       55  57  56  58  57  56  56  57  57  56  56  56  57   56.46 ms
    CleanBrowsing/2 78  55  56  54  55  54  54  53  56  62  54  52  53   56.62 ms
    AdGuard/2       57  55  56  57  62  57  56  56  58  57  52  56  60   56.85 ms
    AlternateDNS/2  75  74  77  78  76  76  80  77  75  74  77  78  76   76.38 ms
    AlternateDNS/1  87  89  75  77  77  78  76  75  78  78  78  75  76   78.38 ms
    CleanBrowsing/1 88  81  80  81  84  80  81  83  81  81  80  81  79   81.54 ms
    SafeDNS/2       137 135 135 138 135 137 134 134 137 136 136 135 135 135.69 ms
    SafeDNS/1       136 134 138 136 135 135 136 133 135 137 137 135 169 138.15 ms
    Yandex/2        253 214 209 191 185 211 185 197 209 197 190 195 184 201.54 ms
    Yandex/1        779 186 195 184 191 203 199 196 204 194 192 206 203 240.92 ms
    Freenom/1       231 284 309 377 247 194 194 479 339 333 585 269 194 310.38 ms
    DNS.Watch/2     *   170 185 166 161 165 166 205 170 162 293 167 199 999  1-to
    Freenom/2       313 356 291 381 *   195 195 301 354 398 670 195 195 999  1-to
    DNS.Watch/1     172 165 166 173 181 165 174 *   169 199 160 173 *   999  2-to
    UncensoredDNS/1 *   *   *   *   *   *   *   *   *   *   *   *   *   999 13-to
    UncensoredDNS/2 *   *   *   *   *   *   *   *   *   *   *   *   *   999 13-to
