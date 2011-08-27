<VirtualHost *:80>
	ServerName micrtonercarolina.com
	ServerAlias www.micrtonercarolina.com
	ServerAdmin webmaster@micrtonercarolina.com

	CustomLog /home/keegan/www/logs/micrtonercarolina.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonercarolina.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
