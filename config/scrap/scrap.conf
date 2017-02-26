<VirtualHost *:80>
    ServerName scrap.keegan.ws
    ServerAlias scrap.local
    ServerAdmin webmaster@keegan.ws

    CustomLog /var/log/apache2/scrap.keegan.ws-access.log combined
    ErrorLog /var/log/apache2/scrap.keegan.ws-error.log

    RedirectMatch 301 ^/(.*)$ https://scrap.keegan.ws/$1
</VirtualHost>
