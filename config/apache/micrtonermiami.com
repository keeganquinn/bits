<VirtualHost *:80>
	ServerName micrtonermiami.com
	ServerAlias www.micrtonermiami.com
	ServerAdmin webmaster@micrtonermiami.com

	CustomLog /home/keegan/www/logs/micrtonermiami.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonermiami.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
