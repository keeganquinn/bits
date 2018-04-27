; -*- zone -*-

; basslin.es.

$TTL 2d

@ IN    SOA     pi.quinn.tk. hostmaster (
        ; serial
        2018042600
        ; refresh
        30M
        ; retry
        15M
        ; expiry
        4W
        ; minimum
        1h
        )

        NS      pi.quinn.tk.
        NS      d.ns.buddyns.com.
        NS      g.ns.buddyns.com.
        NS      i.ns.buddyns.com.
        NS      e.ns.buddyns.com.

        MX      10      len.quinn.tk.
        MX      20      pi.quinn.tk.

        A       45.79.65.28
        AAAA    2600:3c01::f03c:91ff:fee9:47cb

        TXT     "v=DMARC1;p=quarantine;pct=100;rua=mailto:postmaster@quinn.tk"
        TXT     "v=spf1 mx a include:_spf.google.com ~all"
mail._domainkey TXT "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/99IBr17xO4t61WBOl46n5W0WN3zeRg6HDIMKzXDtFZ0051OI2kqWmIFJOuTRXE82yJVtZnQVVoealfGBf1Ly2YuAfxOKdgIb93UGVzcB2oVhOJl3JYQBAKSQS4eFeI18MN/LT8NpEGK16T9qOWJKdG18YeodoGaiXLK3iWkUrwIDAQAB"

www     CNAME   @

media   A       45.79.65.28
media   AAAA    2600:3c01::f03c:91ff:fee9:47cb

media   A       89.18.165.159
media   AAAA    2a00:f10:103:201:ba27:ebff:fe73:17b5
