<VirtualHost *:80>
	ServerName renewabletoner.com
	ServerAlias www.renewabletoner.com
	ServerAdmin webmaster@renewabletoner.com

	CustomLog /var/log/apache2/renewabletoner.com-access.log combined
	ErrorLog /var/log/apache2/renewabletoner.com-error.log

	DocumentRoot /srv/www/renewabletoner
	<Directory /srv/www/renewabletoner>
		Allow from all
		Options -Indexes -MultiViews
	</Directory>
</VirtualHost>
