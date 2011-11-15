<VirtualHost *:80>
    ServerName basslin.es
    ServerAlias www.basslin.es

    ServerAdmin keeganquinn@gmail.com
    RedirectMatch 301 ^/(.*)$ https://basslin.es/$1
</VirtualHost>
