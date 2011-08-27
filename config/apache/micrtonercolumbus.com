<VirtualHost *:80>
	ServerName micrtonercolumbus.com
	ServerAlias www.micrtonercolumbus.com
	ServerAdmin webmaster@micrtonercolumbus.com

	CustomLog /home/keegan/www/logs/micrtonercolumbus.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonercolumbus.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
