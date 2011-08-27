<VirtualHost *:80>
	ServerName micrtonernewyork.com
	ServerAlias www.micrtonernewyork.com
	ServerAdmin webmaster@micrtonernewyork.com

	CustomLog /home/keegan/www/logs/micrtonernewyork.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonernewyork.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
