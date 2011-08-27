<VirtualHost *:80>
	ServerName micrtonermichigan.com
	ServerAlias www.micrtonermichigan.com
	ServerAdmin webmaster@micrtonermichigan.com

	CustomLog /home/keegan/www/logs/micrtonermichigan.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonermichigan.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
