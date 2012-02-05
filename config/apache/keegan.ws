<VirtualHost *:80>
    ServerName keegan.ws
    ServerAdmin webmaster@keegan.ws

    CustomLog /var/log/apache2/keegan.ws-access.log combined
    ErrorLog /var/log/apache2/keegan.ws-error.log

    RedirectMatch /(.*) http://www.keegan.ws/$1
</VirtualHost>
