<VirtualHost *:80>
    ServerName micrtonercolorado.com
    ServerAlias www.micrtonercolorado.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonercolorado.com-access.log combined
    ErrorLog /var/log/apache2/micrtonercolorado.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
