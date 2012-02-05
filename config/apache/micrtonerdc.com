<VirtualHost *:80>
    ServerName micrtonerdc.com
    ServerAlias www.micrtonerdc.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerdc.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerdc.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>