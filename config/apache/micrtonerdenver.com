<VirtualHost *:80>
    ServerName micrtonerdenver.com
    ServerAlias www.micrtonerdenver.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerdenver.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerdenver.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
