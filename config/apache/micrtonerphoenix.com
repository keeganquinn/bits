<VirtualHost *:80>
	ServerName micrtonerphoenix.com
	ServerAlias www.micrtonerphoenix.com
	ServerAdmin webmaster@micrtonerphoenix.com

	CustomLog /home/keegan/www/logs/micrtonerphoenix.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerphoenix.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
