<VirtualHost *:80>
    ServerName abusive.ml
    ServerAlias www.abusive.ml
    ServerAdmin webmaster@abusive.ml

    RedirectMatch 301 ^/(.*)$ http://abusive.gq/$1
</VirtualHost>
