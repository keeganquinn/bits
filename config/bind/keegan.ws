; -*- zone -*-

; keegan.ws. Keegan's.

$TTL 2d

@ IN    SOA     pi.keegan.ws.  keeganquinn.gmail.com. (
        ; serial
        2016120701
        ; refresh
        30M
        ; retry
        15M
        ; expiry
        4W
        ; minimum
        1h
        )

        NS      pi.keegan.ws.
        NS      d.ns.buddyns.com.
        NS      g.ns.buddyns.com.
        NS      i.ns.buddyns.com.
        NS      e.ns.buddyns.com.

        MX      10      pi.keegan.ws.

        TXT     "google-site-verification=1T8y8CABlRTWxGO9l4_5Uz8KAyDa9WHO5Fv928Azg7U"

        A       89.18.165.159
        AAAA    2a00:f10:103:201:ba27:ebff:fe73:17b5

www     CNAME   ghs.google.com.

pi      A       89.18.165.159
pi      AAAA    2a00:f10:103:201:ba27:ebff:fe73:17b5

scrap   A       73.164.202.148
scrap   AAAA    2601:1c2:4c01:6e4a:20e:cff:fe6d:9bf3
