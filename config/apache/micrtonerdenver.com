<VirtualHost *:80>
	ServerName micrtonerdenver.com
	ServerAlias www.micrtonerdenver.com
	ServerAdmin webmaster@micrtonerdenver.com

	CustomLog /home/keegan/www/logs/micrtonerdenver.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerdenver.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
