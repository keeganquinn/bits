<VirtualHost *:80>
    ServerName abusive.ml
    ServerAlias www.abusive.ml
    ServerAdmin webmaster@abusive.ml

    CustomLog /var/log/apache2/abusive.ml-access.log combined
    ErrorLog /var/log/apache2/abusive.ml-error.log

    RedirectMatch 301 ^/(.*)$ http://abusive.gq/$1
</VirtualHost>
