<VirtualHost *:80>
    ServerName micrtonerla.com
    ServerAlias www.micrtonerla.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerla.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerla.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
