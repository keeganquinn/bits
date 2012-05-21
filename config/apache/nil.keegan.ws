<VirtualHost *:80>
    ServerName nil.keegan.ws
    ServerAdmin webmaster@keegan.ws

    RedirectMatch 301 ^/(.*)$ https://nil.keegan.ws/$1
</VirtualHost>
