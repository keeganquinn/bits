<VirtualHost *:80>
    ServerName micrtonercarolina.com
    ServerAlias www.micrtonercarolina.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonercarolina.com-access.log combined
    ErrorLog /var/log/apache2/micrtonercarolina.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
