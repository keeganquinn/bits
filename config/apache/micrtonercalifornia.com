<VirtualHost *:80>
    ServerName micrtonercalifornia.com
    ServerAlias www.micrtonercalifornia.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonercalifornia.com-access.log combined
    ErrorLog /var/log/apache2/micrtonercalifornia.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
