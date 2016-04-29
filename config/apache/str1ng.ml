<VirtualHost *:80>
    ServerName str1ng.ml
    ServerAlias www.str1ng.ml
    ServerAdmin webmaster@str1ng.ml

    CustomLog /var/log/apache2/str1ng.ml-access.log combined
    ErrorLog /var/log/apache2/str1ng.ml-error.log

    RedirectMatch /(.*) http://keegan.ws/$1
</VirtualHost>
