<VirtualHost *:80>
	ServerName micrtonerchicago.com
	ServerAlias www.micrtonerchicago.com
	ServerAdmin webmaster@micrtonerchicago.com

	CustomLog /home/keegan/www/logs/micrtonerchicago.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerchicago.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
