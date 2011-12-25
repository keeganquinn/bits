; basslin.es zone

$TTL 2d

@ IN	SOA	nil.basslin.es.	keeganquinn.gmail.com. (
		; serial	refresh	retry	expiry	minimum
		2011122500	30M	15M	4W	1h	)

	NS	nil.basslin.es.
	NS	athena.basslin.es.

	MX	10	nil.basslin.es.

	A	70.102.34.164
	AAAA	2001:470:1f05:3f::164

www	CNAME	@

athena	A	207.189.107.20
	AAAA	2001:470:1f05:41::1

nil	A	70.102.34.167
	AAAA	2001:470:1f05:3f::1
