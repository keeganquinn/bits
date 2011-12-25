<VirtualHost *:80>
    ServerName micrtonerlosangeles.com
    ServerAlias www.micrtonerlosangeles.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerlosangeles.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerlosangeles.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
