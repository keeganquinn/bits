; renewabletoner.com. Keegan's.

$TTL 2d

@ IN	SOA	donk.sniz.org.	keegan.sniz.org. (
		; serial	refresh	retry	expiry	minimum
		2011072500	30M	15M	4W	1h	)

	NS	donk.sniz.org.
	NS	iris.sniz.org.

	A	70.102.34.162

www	CNAME	@

