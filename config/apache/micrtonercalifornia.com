<VirtualHost *:80>
	ServerName micrtonercalifornia.com
	ServerAlias www.micrtonercalifornia.com
	ServerAdmin webmaster@micrtonercalifornia.com

	CustomLog /home/keegan/www/logs/micrtonercalifornia.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonercalifornia.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
