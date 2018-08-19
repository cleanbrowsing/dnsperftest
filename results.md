# DNS Performance Results

Results from tests done by our users. Feel free to add yours (including Country, City and ISP / Datacenter).

## North America
  * [USA, California, San Diego, Frontier Residential](#usa-san-diego-frontier)
  * [USA, California, Fremont, Linode Datacenter](#usa-fremont-linode)
  * [USA, California, San Francisco, Digital Ocean Datacenter](#usa-sanfrancisco-digitalocean)
  * [USA, Texas, Dallas, Linode](#usa-dallas-linode)
  * [Canada, NB, Fredericton, Bell Aliant](#canada-nb-fredericton-bell)
  
## Europe
  * [France, Paris, OVH Datacenter](#france-paris-ovh)
  * [Slovakia, Bratislava, Residential, SWAN optical](#slovakia-bratislava)

## South America
  * [Argentina, Buenos Aires, Residential](#agentina-buenosaires)
  * [Brazil, Sao Paulo, AWS Datacenter](#brazil-saopaulo-aws)

## North America Results

<a name="usa-san-diego-frontier"></a>
**USA, California, San Diego, Frontier Residential**

``` 
                      test1   test2   test3   test4   test5   test6   test7   test8   test9   Average
#1  level3             6 ms    8 ms    6 ms    6 ms    13 ms   6 ms    5 ms    7 ms    6 ms   7.00
#2  cloudflare         6 ms    7 ms    11 ms   7 ms    7 ms    8 ms    7 ms    7 ms    7 ms   7.40
#3  neustar            7 ms    7 ms    7 ms    6 ms    6 ms    9 ms    6 ms    10 ms   21 ms  8.70
#4  norton             23 ms   7 ms    6 ms    9 ms    8 ms    7 ms    7 ms    6 ms    23 ms  10.40
#5  cleanbrowsing      22 ms   18 ms   16 ms   18 ms   18 ms   18 ms   17 ms   16 ms   16 ms  17.90
#6  google             6 ms    34 ms   7 ms    7 ms    42 ms   31 ms   11 ms   31 ms   7 ms   21.40
#7  opendns            35 ms   8 ms    7 ms    44 ms   21 ms   68 ms   8 ms    56 ms   6 ms   27.10
#8  quad9              15 ms   38 ms   80 ms   22 ms   15 ms   20 ms   24 ms   57 ms   20 ms  31.50
#9  freenom            21 ms   42 ms   19 ms   20 ms   111 ms  212 ms  20 ms   70 ms   19 ms  59.40
#10 comodo             79 ms   81 ms   74 ms   74 ms   75 ms   77 ms   76 ms   77 ms   80 ms  76.70
#11 yandex             188 ms  268 ms  195 ms  191 ms  190 ms  195 ms  191 ms  205 ms  189 ms 203.50
#12 adguard            196 ms  255 ms  203 ms  281 ms  229 ms  255 ms  183 ms  220 ms  187 ms 219.50
```

<a name="usa-fremont-linode"></a>
**USA, California, Fremont, Linode Datacenter**
```                      test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
#1  cloudflare        1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.00
#2  norton            1 ms    1 ms    1 ms    2 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.10
#3  neustar           1 ms    1 ms    1 ms    2 ms    1 ms    1 ms    1 ms    1 ms    1 ms    2 ms      1.20
#4  level3            2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    4 ms      2.20
#5  cleanbrowsing     1 ms    10 ms   8 ms    9 ms    2 ms    1 ms    1 ms    9 ms    1 ms    9 ms      5.10
#6  google            19 ms   1 ms    1 ms    19 ms   19 ms   79 ms   1 ms    21 ms   21 ms   1 ms      18.20
#7  opendns           39 ms   2 ms    2 ms    39 ms   3 ms    76 ms   2 ms    2 ms    21 ms   12 ms     19.80
#8  quad9             67 ms   68 ms   2 ms    67 ms   1 ms    27 ms   69 ms   1 ms    1 ms    153 ms    45.60
#9  comodo            68 ms   67 ms   67 ms   67 ms   67 ms   67 ms   67 ms   66 ms   67 ms   67 ms     67.00
#10 freenom           143 ms  57 ms   56 ms   56 ms   57 ms   144 ms  57 ms   57 ms   145 ms  57 ms     82.90
#11 adguard           146 ms  143 ms  143 ms  1 ms    3 ms    144 ms  5 ms    1 ms    145 ms  146 ms    87.70
#12 yandex            179 ms  173 ms  174 ms  174 ms  185 ms  199 ms  172 ms  173 ms  172 ms  231 ms    183.20
```

<a name="usa-sanfrancisco-digitalocean"></a>
**USA, California, San Francisco, Digital Ocean Datacenter**
```                      test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
#1  level3            1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    2 ms    1 ms      1.10
#2  norton            2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms      2.00
#3  neustar           2 ms    2 ms    2 ms    3 ms    2 ms    2 ms    2 ms    2 ms    2 ms    2 ms      2.10
#4  cloudflare        2 ms    2 ms    3 ms    3 ms    3 ms    2 ms    2 ms    2 ms    3 ms    2 ms      2.40
#5  cleanbrowsing     4 ms    4 ms    4 ms    4 ms    4 ms    4 ms    4 ms    4 ms    4 ms    4 ms      4.00
#6  adguard           2 ms    5 ms    2 ms    7 ms    2 ms    2 ms    6 ms    2 ms    9 ms    8 ms      4.50
#7  google            1 ms    3 ms    3 ms    20 ms   20 ms   61 ms   6 ms    23 ms   21 ms   4 ms      16.20
#8  quad9             2 ms    2 ms    59 ms   2 ms    1 ms    9 ms    2 ms    125 ms  2 ms    1 ms      20.50
#9  opendns           1 ms    1 ms    2 ms    58 ms   3 ms    148 ms  1 ms    38 ms   1 ms    11 ms     26.40
#10 freenom           28 ms   26 ms   28 ms   26 ms   24 ms   28 ms   28 ms   26 ms   28 ms   26 ms     26.80
#11 comodo            79 ms   172 ms  84 ms   76 ms   79 ms   81 ms   83 ms   83 ms   76 ms   79 ms     89.20
#12 yandex            178 ms  210 ms  198 ms  176 ms  185 ms  178 ms  179 ms  187 ms  180 ms  181 ms    185.20
```

<a name="usa-dallas-linode"></a>
**USA, Texas, Dallas, Linode Datacenter**
```                      test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
#1  cleanbrowsing     1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.00
#1  cloudflare        1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.00
#1  level3            1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.00
#4  norton            1 ms    1 ms    1 ms    2 ms    1 ms    1 ms    1 ms    1 ms    1 ms    1 ms      1.10
#5  neustar           1 ms    1 ms    1 ms    2 ms    1 ms    2 ms    2 ms    1 ms    1 ms    1 ms      1.30
#6  opendns           1 ms    1 ms    1 ms    14 ms   1 ms    2 ms    1 ms    7 ms    7 ms    1 ms      3.60
#7  google            8 ms    8 ms    1 ms    8 ms    9 ms    39 ms   1 ms    8 ms    10 ms   1 ms      9.30
#8  quad9             1 ms    30 ms   30 ms   1 ms    1 ms    1 ms    1 ms    30 ms   30 ms   58 ms     18.30
#9  comodo            38 ms   38 ms   38 ms   38 ms   38 ms   38 ms   38 ms   37 ms   37 ms   38 ms     37.80
#10 adguard           114 ms  43 ms   42 ms   112 ms  119 ms  41 ms   115 ms  116 ms  116 ms  41 ms     85.90
#11 freenom           115 ms  125 ms  114 ms  125 ms  151 ms  230 ms  125 ms  124 ms  114 ms  116 ms    133.90
#12 yandex            140 ms  177 ms  141 ms  137 ms  147 ms  171 ms  139 ms  143 ms  140 ms  163 ms    149.80
```

<a name="canada-nb-fredericton-bell"></a>
**Canada, NB, Fredericton, Bell Aliant**
```
                   test1   test2   test3   test4   test5   test6   test7   test8   test9   Average  
#1  cloudflare     38 ms   38 ms   38 ms   37 ms   37 ms   37 ms   37 ms   37 ms   38 ms   37.40
#2  cleanbrowsing  37 ms   37 ms   37 ms   37 ms   37 ms   37 ms   45 ms   38 ms   37 ms   37.90
#3  neustar        37 ms   38 ms   38 ms   38 ms   38 ms   39 ms   37 ms   40 ms   38 ms   38.10
#4  google         38 ms   37 ms   75 ms   37 ms   46 ms   38 ms   37 ms   40 ms   37 ms   42.20
#5  comodo         38 ms   41 ms   100 ms  42 ms   38 ms   38 ms   40 ms   43 ms   39 ms   45.80
#6  quad9          59 ms   62 ms   57 ms   58 ms   65 ms   67 ms   70 ms   71 ms   133 ms  84.80
#7  norton         147 ms  280 ms  154 ms  38 ms   39 ms   38 ms   40 ms   37 ms   40 ms   85.10
#8  adguard        119 ms  118 ms  128 ms  112 ms  118 ms  114 ms  119 ms  119 ms  116 ms  118.50
#9  yandex         145 ms  147 ms  142 ms  144 ms  148 ms  174 ms  136 ms  141 ms  143 ms  146.10
#10 opendns        172 ms  63 ms   245 ms  158 ms  146 ms  159 ms  279 ms  140 ms  163 ms  167.50
```


## Europe Results
<a name="france-paris-ovh"></a>
**France, Paris, OVH Datacenter**
```
                      test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
#1  cloudflare        5 ms    17 ms   5 ms    5 ms    5 ms    5 ms    5 ms    5 ms    5 ms    5 ms      6.20
#2  cleanbrowsing     7 ms    7 ms    7 ms    7 ms    7 ms    7 ms    7 ms    7 ms    7 ms    7 ms      7.00
#3  freenom           7 ms    9 ms    7 ms    7 ms    7 ms    7 ms    7 ms    7 ms    7 ms    7 ms      7.20
#4  level3            7 ms    8 ms    7 ms    7 ms    8 ms    8 ms    7 ms    7 ms    7 ms    7 ms      7.30
#5  quad9             7 ms    8 ms    7 ms    7 ms    8 ms    7 ms    7 ms    7 ms    7 ms    8 ms      7.30
#6  google            5 ms    5 ms    4 ms    19 ms   5 ms    16 ms   5 ms    12 ms   12 ms   10 ms     9.30
#7  opendns           5 ms    20 ms   5 ms    5 ms    5 ms    5 ms    18 ms   17 ms   17 ms   5 ms      10.20
#8  neustar           20 ms   22 ms   20 ms   21 ms   21 ms   21 ms   21 ms   21 ms   21 ms   21 ms     20.90
#9  norton            21 ms   21 ms   21 ms   21 ms   21 ms   21 ms   22 ms   21 ms   21 ms   21 ms     21.10
#10 yandex            39 ms   38 ms   39 ms   38 ms   47 ms   39 ms   36 ms   42 ms   35 ms   78 ms     43.10
#11 comodo            10 ms   10 ms   10 ms   10 ms   10 ms   10 ms   10 ms   10 ms   10 ms   417 ms    50.70
#12 adguard           55 ms   125 ms  54 ms   54 ms   66 ms   61 ms   58 ms   54 ms   54 ms   54 ms     63.50
```
<a name="slovakia-bratislava"></a>
**Slovakia, Bratislava, Residential, SWAN optical**
```
                      test1   test2   test3   test4   test5   test6   test7   test8   test9   test10  Average
#1  cloudflare         6 ms    7 ms    7 ms    6 ms    7 ms    6 ms    6 ms    7 ms    6 ms    7 ms      6.50
#2  level3            15 ms   15 ms   15 ms   17 ms   15 ms   15 ms   15 ms   15 ms   15 ms   15 ms     15.20
#3  norton            15 ms   16 ms   20 ms   17 ms   16 ms   15 ms   16 ms   15 ms   15 ms   16 ms     16.10
#4  neustar           17 ms   15 ms   16 ms   16 ms   16 ms   17 ms   16 ms   16 ms   19 ms   16 ms     16.40
#5  google            14 ms   16 ms   14 ms   23 ms   30 ms   29 ms   15 ms   24 ms   14 ms   14 ms     19.30
#6  8.8.8.8           25 ms   15 ms   17 ms   22 ms   29 ms   23 ms   14 ms   24 ms   14 ms   16 ms     19.90
#7  opendns            7 ms    7 ms    7 ms    7 ms   30 ms  241 ms    7 ms    7 ms    9 ms   31 ms     35.30
#8  yandex            40 ms   41 ms   43 ms   41 ms   49 ms   40 ms   40 ms   40 ms   40 ms   74 ms     44.80
#9  comodo            33 ms   238 ms  34 ms   38 ms   34 ms   31 ms   32 ms   40 ms   38 ms   34 ms     55.20
#10 adguard           51 ms   94 ms   51 ms   53 ms   93 ms   52 ms   58 ms   52 ms   52 ms   55 ms     61.10
#11 cleanbrowsing     53 ms   94 ms   93 ms   51 ms   53 ms   52 ms   57 ms   60 ms   66 ms   53 ms     63.20
#12 quad9              4 ms    4 ms    4 ms    4 ms    4 ms  292 ms    4 ms  247 ms    4 ms  267 ms     83.40
#13 freenom           170 ms  259 ms  270 ms  252 ms  268 ms  277 ms  266 ms  366 ms  270 ms  271 ms   266.90
```
## South America
<a name="argentina-buenosaires"></a>
**Argentina, Buenos Aires, Residential**
```
                     test1   test2   test3   test4   test5   test6   test7   test8   test9   Average
#1  cloudflare        26 ms   25 ms   26 ms   24 ms   26 ms   25 ms   24 ms   24 ms   25 ms   25.00
#2  google            25 ms   25 ms   25 ms   27 ms   81 ms   25 ms   24 ms   26 ms   24 ms   30.60
#3  cleanbrowsing     32 ms   36 ms   34 ms   35 ms   33 ms   31 ms   33 ms   156 ms  33 ms   46.00
#4  opendns           149 ms  32 ms   32 ms   269 ms  34 ms   232 ms  32 ms   152 ms  87 ms   105.30
#5  neustar           160 ms  150 ms  164 ms  161 ms  159 ms  156 ms  159 ms  159 ms  156 ms  158.30
#6  quad9             158 ms  160 ms  156 ms  158 ms  157 ms  158 ms  163 ms  159 ms  159 ms  158.80
#7  norton            156 ms  152 ms  163 ms  156 ms  174 ms  158 ms  157 ms  163 ms  161 ms  160.30
#8  comodo            169 ms  170 ms  171 ms  162 ms  166 ms  161 ms  169 ms  162 ms  165 ms  166.10
#9  yandex            271 ms  283 ms  297 ms  288 ms  287 ms  302 ms  277 ms  295 ms  294 ms  289.00
#10 adguard           291 ms  290 ms  290 ms  294 ms  285 ms  288 ms  287 ms  297 ms  284 ms  290.00
```

<a name="brazil-saopaulo-aws"></a>
**Brazil, Sao Paulo, AWS Datacenter**
```
                      test1   test2   test3   test4   test5   test6   test7   test8   test9   Average        
#1  cleanbrowsing     3 ms    3 ms    4 ms    3 ms    4 ms    4 ms    3 ms    4 ms    4 ms    3.60
#2  cloudflare        6 ms    5 ms    5 ms    5 ms    5 ms    29 ms   5 ms    5 ms    6 ms    10.20
#3  google            58 ms   2 ms    1 ms    57 ms   105 ms  52 ms   2 ms    55 ms   49 ms   38.20
#4  opendns           122 ms  4 ms    3 ms    180 ms  3 ms    122 ms  4 ms    4 ms    3 ms    44.90
#5  neustar           112 ms  112 ms  112 ms  111 ms  112 ms  113 ms  113 ms  111 ms  114 ms  112.10
#6  norton            118 ms  113 ms  111 ms  111 ms  113 ms  117 ms  113 ms  114 ms  113 ms  114.20
#7  level3            122 ms  121 ms  120 ms  121 ms  122 ms  123 ms  123 ms  121 ms  122 ms  121.70
#8  comodo            133 ms  128 ms  128 ms  129 ms  127 ms  128 ms  128 ms  128 ms  128 ms  129.00
#9  freenom           161 ms  161 ms  168 ms  207 ms  172 ms  161 ms  162 ms  167 ms  169 ms  169.00
#10 quad9             176 ms  176 ms  175 ms  175 ms  176 ms  175 ms  175 ms  175 ms  176 ms  175.40
#11 yandex            240 ms  272 ms  243 ms  247 ms  242 ms  236 ms  237 ms  241 ms  236 ms  243.10
#12 adguard           249 ms  245 ms  247 ms  250 ms  249 ms  244 ms  244 ms  252 ms  259 ms  248.70
```
