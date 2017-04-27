; -*- zone -*-

; keegan.ws. Keegan's.

$TTL 2d

@ IN    SOA     pi.quinn.tk. hostmaster (
        ; serial
        2017042700
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

        MX      10      pi.quinn.tk.

        A       34.206.222.35

        TXT     "google-site-verification=1T8y8CABlRTWxGO9l4_5Uz8KAyDa9WHO5Fv928Azg7U"
        TXT     "v=DMARC1;p=quarantine;pct=100;rua=mailto:postmaster@quinn.tk"
        TXT     "v=spf1 mx a include:_spf.google.com ~all"
mail._domainkey TXT "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/99IBr17xO4t61WBOl46n5W0WN3zeRg6HDIMKzXDtFZ0051OI2kqWmIFJOuTRXE82yJVtZnQVVoealfGBf1Ly2YuAfxOKdgIb93UGVzcB2oVhOJl3JYQBAKSQS4eFeI18MN/LT8NpEGK16T9qOWJKdG18YeodoGaiXLK3iWkUrwIDAQAB"

www     CNAME   ghs.google.com.

pi      A       89.18.165.159
pi      AAAA    2a00:f10:103:201:ba27:ebff:fe73:17b5
pi      TXT     "v=spf1 a -all"

scrap   A       73.164.202.148
scrap   AAAA    2601:1c2:4c01:6e4a:20e:cff:fe6d:9bf3
scrap   TXT     "v=spf1 a -all"

spark   A       34.206.222.35
spark   TXT     "v=spf1 a -all"
