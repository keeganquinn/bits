<VirtualHost *:80>
    ServerName unplug.ml
    ServerAlias www.unplug.ml
    ServerAdmin webmaster@unplug.ml

    CustomLog /var/log/apache2/unplug.ml-access.log combined
    ErrorLog /var/log/apache2/unplug.ml-error.log

    RedirectMatch /(.*) http://personaltelco.net/$1
</VirtualHost>
