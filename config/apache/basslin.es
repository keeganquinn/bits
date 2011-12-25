<VirtualHost *:80>
    ServerName basslin.es
    ServerAlias www.basslin.es
    ServerAdmin webmaster@basslin.es

    RedirectMatch 301 ^/(.*)$ https://basslin.es/$1
</VirtualHost>
