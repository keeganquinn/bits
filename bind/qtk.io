; -*- zone -*-

; qtk.io: Quinn Technologies

$TTL 2d

@ IN    SOA     len hostmaster (
        ; serial
        2021021900
        ; refresh
        30M
        ; retry
        15M
        ; expiry
        4W
        ; minimum
        1h
        )

        NS      ns1.linode.com.
        NS      ns2.linode.com.
        NS      ns3.linode.com.
        NS      ns4.linode.com.
        NS      ns5.linode.com.

        MX      10      len

        A       45.79.65.28
        AAAA    2600:3c01::f03c:91ff:fee9:47cb

        TXT     "google-site-verification=1OfHR563epbyfz3VTSwSMZYbwATJ6j3vsAXSND-0yIQ"
        TXT     "v=spf1 mx a include:_spf.google.com ~all"
_dmarc  TXT     "v=DMARC1;p=reject;pct=100;fo=0;rua=mailto:postmaster@qtk.io"
mail._domainkey TXT "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC/99IBr17xO4t61WBOl46n5W0WN3zeRg6HDIMKzXDtFZ0051OI2kqWmIFJOuTRXE82yJVtZnQVVoealfGBf1Ly2YuAfxOKdgIb93UGVzcB2oVhOJl3JYQBAKSQS4eFeI18MN/LT8NpEGK16T9qOWJKdG18YeodoGaiXLK3iWkUrwIDAQAB"

www     CNAME   @

; linode
len     A       45.79.65.28
len     AAAA    2600:3c01::f03c:91ff:fee9:47cb
len     TXT     "v=spf1 a -all"

; site 0
scrap   A       73.11.66.175
scrap   AAAA    2001:558:6025:53:c86c:1aef:b55e:e39e
scrap   MX      10      len
scrap   TXT     "v=spf1 mx a -all"

artifact        A       10.11.22.9
artifact        AAAA    2601:1c2:4c00:35::99a3
base            A       10.11.22.2
base            AAAA    2601:1c2:4c00:35::5033
electron        A       10.11.22.7
electron        AAAA    2601:1c2:4c00:35::2431
factor          A       10.11.22.12
factor          AAAA    2601:1c2:4c00:35::5ec6
lilguy          A       10.11.22.6
lilguy          AAAA    2601:1c2:4c00:35::4f38
one             A       10.11.22.11
one             AAAA    2601:1c2:4c00:35::4ed6
sink            A       10.11.22.8
sink            AAAA    2601:1c2:4c00:35::96ba
spot            A       10.11.22.5
spot            AAAA    2601:1c2:4c00:35::ef97
vie             A       10.11.22.4
vie             AAAA    2601:1c2:4c00:35::4d47
wave            A       10.11.22.3
wave            AAAA    2601:1c2:4c00:35::a385
zero            A       10.11.22.10
zero            AAAA    2601:1c2:4c00:35::ccf1

s0edge  A       10.11.22.1
s0edge  AAAA    2601:1c2:4c00:35::1
s0gw    A       67.189.68.1
s0gw    AAAA    2001:558:6025:53::1
$GENERATE 50-250 s0d${0,3,d} A 10.11.22.$

; site 1
widget  A       71.193.157.21
widget  AAAA    2001:558:6025:54:9172:5a4f:e60f:2deb
s1edge  A       10.11.23.1
s1edge  AAAA    2601:1c2:4d80:20::1
s1gw    A       71.193.156.1
s1gw    AAAA    2001:558:4060:54::1
$GENERATE 50-250 s1d${0,3,d} A 10.11.23.$

; aliases
animamagica             CNAME   len
animamagica-staging     CNAME   scrap
basslines-staging       CNAME   scrap
ci                      CNAME   scrap
cloud                   CNAME   scrap
es                      CNAME   scrap
mail                    CNAME   scrap
pm                      CNAME   scrap
sacredflame-staging     CNAME   scrap
staging                 CNAME   scrap
xmit                    CNAME   scrap
zabbix                  CNAME   scrap
