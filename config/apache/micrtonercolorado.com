<VirtualHost *:80>
	ServerName micrtonercolorado.com
	ServerAlias www.micrtonercolorado.com
	ServerAdmin webmaster@micrtonercolorado.com

	CustomLog /home/keegan/www/logs/micrtonercolorado.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonercolorado.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
