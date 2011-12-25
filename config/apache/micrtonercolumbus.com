<VirtualHost *:80>
    ServerName micrtonercolumbus.com
    ServerAlias www.micrtonercolumbus.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonercolumbus.com-access.log combined
    ErrorLog /var/log/apache2/micrtonercolumbus.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
