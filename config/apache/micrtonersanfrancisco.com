<VirtualHost *:80>
	ServerName micrtonersanfrancisco.com
	ServerAlias www.micrtonersanfrancisco.com
	ServerAdmin webmaster@micrtonersanfrancisco.com

	CustomLog /home/keegan/www/logs/micrtonersanfrancisco.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonersanfrancisco.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
