<VirtualHost *:80>
    ServerName ugraal.ml
    ServerAlias www.ugraal.ml
    ServerAdmin webmaster@ugraal.ml

    RedirectMatch 301 ^/(.*)$ http://ni-guild.tk/$1
</VirtualHost>
