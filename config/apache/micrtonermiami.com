<VirtualHost *:80>
    ServerName micrtonermiami.com
    ServerAlias www.micrtonermiami.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonermiami.com-access.log combined
    ErrorLog /var/log/apache2/micrtonermiami.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
