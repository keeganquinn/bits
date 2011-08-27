<VirtualHost *:80>
	ServerName micrtonernewjersey.com
	ServerAlias www.micrtonernewjersey.com
	ServerAdmin webmaster@micrtonernewjersey.com

	CustomLog /home/keegan/www/logs/micrtonernewjersey.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonernewjersey.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
