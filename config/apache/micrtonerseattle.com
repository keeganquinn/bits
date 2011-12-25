<VirtualHost *:80>
    ServerName micrtonerseattle.com
    ServerAlias www.micrtonerseattle.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerseattle.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerseattle.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
