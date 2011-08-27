<VirtualHost *:80>
	ServerName micrtonerseattle.com
	ServerAlias www.micrtonerseattle.com
	ServerAdmin webmaster@micrtonerseattle.com

	CustomLog /home/keegan/www/logs/micrtonerseattle.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerseattle.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
