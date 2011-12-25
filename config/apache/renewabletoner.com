<VirtualHost *:80>
    ServerName renewabletoner.com
    ServerAlias www.renewabletoner.com
    ServerAdmin webmaster@renewabletoner.com

    CustomLog /var/log/apache2/renewabletoner.com-access.log combined
    ErrorLog /var/log/apache2/renewabletoner.com-error.log

    DocumentRoot /srv/www/renewabletoner.com
    <Directory /srv/www/renewabletoner.com>
        Allow from all
        Options -Indexes -MultiViews
    </Directory>

    # Rewrite to remove 'www' from hostname, if present
    RewriteEngine on
    RewriteCond %{HTTPS} !=on
    RewriteCond %{HTTP_HOST} ^www\.(.+)$ [NC]
    RewriteRule ^ http://%1%{REQUEST_URI} [R=301,L]
</VirtualHost>
