<VirtualHost *:80>
	ServerName micrtonerwashington.com
	ServerAlias www.micrtonerwashington.com
	ServerAdmin webmaster@micrtonerwashington.com

	CustomLog /home/keegan/www/logs/micrtonerwashington.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerwashington.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
