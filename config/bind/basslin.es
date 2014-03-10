; -*- zone -*-

; basslin.es zone

$TTL 2d

@ IN    SOA     nil.keegan.ws.  keeganquinn.gmail.com. (
        ; serial
        2014030900
        ; refresh
        30M
        ; retry
        15M
        ; expiry
        4W
        ; minimum
        1h
        )

        NS      nil.keegan.ws.
        NS      athena.keegan.ws.

        MX      10      nil.keegan.ws.

        A       70.102.34.165

www     CNAME   @
