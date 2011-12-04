<VirtualHost *:80>
	ServerName micrtonerinternational.com
	ServerAlias www.micrtonerinternational.com
	ServerAdmin webmaster@micrtonerinternational.com

	CustomLog /var/log/apache2/micrtonerinternational.com-access.log combined
	ErrorLog /var/log/apache2/micrtonerinternational.com-error.log

	DocumentRoot /srv/www/micrtonerinternational.com
	<Directory /srv/www/micrtonerinternational.com>
		Allow from all
		Options -Indexes -MultiViews
	</Directory>

	# Rewrite to remove 'www' from hostname, if present
	RewriteEngine on
	RewriteCond %{HTTPS} !=on
	RewriteCond %{HTTP_HOST} ^www\.(.+)$ [NC]
	RewriteRule ^ http://%1%{REQUEST_URI} [R=301,L]
</VirtualHost>
