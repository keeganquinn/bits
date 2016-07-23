<VirtualHost *:80>
    ServerName ugraal.ml
    ServerAlias www.ugraal.ml
    ServerAdmin webmaster@ugraal.ml

    RedirectMatch 301 ^/(.*)$ http://abusive.gq/$1
</VirtualHost>
