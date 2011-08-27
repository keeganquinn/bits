<VirtualHost *:80>
	ServerName micrtonerflorida.com
	ServerAlias www.micrtonerflorida.com
	ServerAdmin webmaster@micrtonerflorida.com

	CustomLog /home/keegan/www/logs/micrtonerflorida.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerflorida.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
