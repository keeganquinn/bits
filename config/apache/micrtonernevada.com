<VirtualHost *:80>
    ServerName micrtonernevada.com
    ServerAlias www.micrtonernevada.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonernevada.com-access.log combined
    ErrorLog /var/log/apache2/micrtonernevada.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
