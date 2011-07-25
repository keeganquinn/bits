; renewabletoner.com. Keegan's.

$TTL 2d

@ IN	SOA	donk.sniz.org.	keeganquinn.gmail.com. (
		; serial	refresh	retry	expiry	minimum
		2011071800	30M	15M	4W	1h	)

	RP	keeganquinn.gmail.com.	.

	NS	donk.sniz.org.
	NS	iris.sniz.org.

	A	70.102.34.162

www	CNAME	@

