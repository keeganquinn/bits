<VirtualHost *:80>
    ServerName micrtonerny.com
    ServerAlias www.micrtonerny.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerny.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerny.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
