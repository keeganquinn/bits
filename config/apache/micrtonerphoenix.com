<VirtualHost *:80>
    ServerName micrtonerphoenix.com
    ServerAlias www.micrtonerphoenix.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerphoenix.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerphoenix.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
