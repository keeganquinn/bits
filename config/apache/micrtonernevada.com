<VirtualHost *:80>
	ServerName micrtonernevada.com
	ServerAlias www.micrtonernevada.com
	ServerAdmin webmaster@micrtonernevada.com

	CustomLog /home/keegan/www/logs/micrtonernevada.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonernevada.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
