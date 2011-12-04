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

	Alias /wp-uploads/ /srv/www/wp-uploads/micrtonerinternational.com/
	<Directory /srv/www/wp-uploads/micrtonerinternational.com>
		Allow from all
		Options -Indexes -MultiViews
	</Directory>
</VirtualHost>
