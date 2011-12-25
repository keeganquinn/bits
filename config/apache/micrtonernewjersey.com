<VirtualHost *:80>
    ServerName micrtonernewjersey.com
    ServerAlias www.micrtonernewjersey.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonernewjersey.com-access.log combined
    ErrorLog /var/log/apache2/micrtonernewjersey.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
