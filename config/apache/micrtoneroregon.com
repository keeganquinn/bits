<VirtualHost *:80>
    ServerName micrtoneroregon.com
    ServerAlias www.micrtoneroregon.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtoneroregon.com-access.log combined
    ErrorLog /var/log/apache2/micrtoneroregon.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
