<VirtualHost *:80>
	ServerName micrtoneroregon.com
	ServerAlias www.micrtoneroregon.com
	ServerAdmin webmaster@micrtoneroregon.com

	CustomLog /home/keegan/www/logs/micrtoneroregon.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtoneroregon.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
