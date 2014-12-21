; -*- zone -*-

; keegan.ws. Keegan's.

$TTL 2d

@ IN    SOA     none.keegan.ws.  keeganquinn.gmail.com. (
        ; serial
        2014122100
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
none            A       54.186.81.53
ore             A       50.139.27.86
pi              A       89.18.165.159
wave            A       50.139.27.86
zero            A       50.139.27.86
