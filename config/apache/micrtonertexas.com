<VirtualHost *:80>
	ServerName micrtonertexas.com
	ServerAlias www.micrtonertexas.com
	ServerAdmin webmaster@micrtonertexas.com

	CustomLog /home/keegan/www/logs/micrtonertexas.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonertexas.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
