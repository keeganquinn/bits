<VirtualHost *:80>
    ServerName ugraal.ml
    ServerAlias www.ugraal.ml
    ServerAdmin webmaster@ugraal.ml

    CustomLog /var/log/apache2/ugraal.ml-access.log combined
    ErrorLog /var/log/apache2/ugraal.ml-error.log

    RedirectMatch 301 ^/(.*)$ http://abusive.gq/$1
</VirtualHost>
