<VirtualHost *:80>
    ServerName micrtonernewyork.com
    ServerAlias www.micrtonernewyork.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonernewyork.com-access.log combined
    ErrorLog /var/log/apache2/micrtonernewyork.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
