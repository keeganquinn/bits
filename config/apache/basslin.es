<VirtualHost *:80>
    ServerName basslin.es
    ServerAlias www.basslin.es
    ServerAdmin webmaster@basslin.es

    CustomLog /var/log/apache2/basslin.es-access.log combined
    ErrorLog /var/log/apache2/basslin.es-error.log

    RedirectMatch 301 ^/(.*)$ https://basslin.es/$1
</VirtualHost>
