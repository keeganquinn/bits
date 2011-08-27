<VirtualHost *:80>
	ServerName micrtonerdallas.com
	ServerAlias www.micrtonerdallas.com
	ServerAdmin webmaster@micrtonerdallas.com

	CustomLog /home/keegan/www/logs/micrtonerdallas.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerdallas.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
