<VirtualHost *:80>
    ServerName quinn.ml
    ServerAlias www.quinn.ml
    ServerAdmin webmaster@quinn.ml

    CustomLog /var/log/apache2/quinn.ml-access.log combined
    ErrorLog /var/log/apache2/quinn.ml-error.log

    RedirectMatch /(.*) http://keegan.ws/$1
</VirtualHost>
