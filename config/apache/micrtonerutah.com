<VirtualHost *:80>
	ServerName micrtonerutah.com
	ServerAlias www.micrtonerutah.com
	ServerAdmin webmaster@micrtonerutah.com

	CustomLog /home/keegan/www/logs/micrtonerutah.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerutah.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
