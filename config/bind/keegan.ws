; -*- zone -*-

; keegan.ws. Keegan's.

$TTL 2d

@ IN    SOA     none.keegan.ws.  keeganquinn.gmail.com. (
        ; serial
        2014093000
        ; refresh
        30M
        ; retry
        15M
        ; expiry
        4W
        ; minimum
        1h
        )

        NS      none.keegan.ws.
        NS      athena.keegan.ws.

        MX      10      none.keegan.ws.

        A       54.186.81.53

www     CNAME   ghs.google.com.

athena          A       207.189.107.20
electron        AAAA    2601:7:2200:11a0::1b3
none            A       54.186.81.53
ore             A       24.20.142.245
ore             AAAA    2601:7:2200:11a0::52c
wave            A       24.20.142.245
wave            AAAA    2601:7:2200:11a0::1
zero            AAAA    2601:7:2200:11a0::224
