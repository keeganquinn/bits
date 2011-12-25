<VirtualHost *:80>
    ServerName micrtonerdallas.com
    ServerAlias www.micrtonerdallas.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerdallas.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerdallas.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
