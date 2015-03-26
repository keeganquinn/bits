; -*- zone -*-

; keegan.ws. Keegan's.

$TTL 2d

@ IN    SOA     pi.keegan.ws.  keeganquinn.gmail.com. (
        ; serial
        2015032600
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
        NS      athena.keegan.ws.

        MX      10      pi.keegan.ws.

        A       89.18.165.159

www     CNAME   ghs.google.com.

athena          A       207.189.107.20
none            A       54.186.81.53
ore             A       50.139.27.86
pi              A       89.18.165.159
pi              AAAA    2a00:f10:103:201:ba27:ebff:fe73:17b5
wave            A       50.139.27.86
zero            A       50.139.27.86
