<VirtualHost *:80>
    ServerName micrtonerca.com
    ServerAlias www.micrtonerca.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerca.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerca.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
