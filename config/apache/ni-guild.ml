<VirtualHost *:80>
    ServerName ni-guild.ml
    ServerAlias www.ni-guild.ml
    ServerAdmin webmaster@ni-guild.ml

    RedirectMatch 301 ^/(.*)$ http://ni-guild.tk/$1
</VirtualHost>
