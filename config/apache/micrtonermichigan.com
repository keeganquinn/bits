<VirtualHost *:80>
    ServerName micrtonermichigan.com
    ServerAlias www.micrtonermichigan.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonermichigan.com-access.log combined
    ErrorLog /var/log/apache2/micrtonermichigan.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
