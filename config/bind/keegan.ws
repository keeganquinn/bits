; -*- zone -*-

; keegan.ws. Keegan's.

$TTL 2d

@ IN    SOA     none.keegan.ws.  keeganquinn.gmail.com. (
        ; serial
        2014030901
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

        MX      10      nil.keegan.ws.

        A       70.102.34.167

www     CNAME   ghs.google.com.

athena  A       207.189.107.20
nil     A       70.102.34.167
none    A       54.186.81.53
ore     A       24.20.142.245
