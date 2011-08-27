<VirtualHost *:80>
	ServerName micrtonervirginia.com
	ServerAlias www.micrtonervirginia.com
	ServerAdmin webmaster@micrtonervirginia.com

	CustomLog /home/keegan/www/logs/micrtonervirginia.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonervirginia.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
