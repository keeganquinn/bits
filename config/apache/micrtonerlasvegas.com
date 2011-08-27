<VirtualHost *:80>
	ServerName micrtonerlasvegas.com
	ServerAlias www.micrtonerlasvegas.com
	ServerAdmin webmaster@micrtonerlasvegas.com

	CustomLog /home/keegan/www/logs/micrtonerlasvegas.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerlasvegas.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
