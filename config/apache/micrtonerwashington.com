<VirtualHost *:80>
    ServerName micrtonerwashington.com
    ServerAlias www.micrtonerwashington.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerwashington.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerwashington.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
