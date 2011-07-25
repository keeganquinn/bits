<VirtualHost *:80>
	ServerName basslin.es
	ServerAlias www.basslin.es
	ServerAdmin keegan@sniz.org

	CustomLog /var/log/apache2/basslin.es-access.log combined
	ErrorLog /var/log/apache2/basslin.es-error.log

	DocumentRoot /srv/www/basslin.es
	<Directory /srv/www/basslin.es>
		Allow from all
		Options -Indexes -MultiViews
	</Directory>
</VirtualHost>
