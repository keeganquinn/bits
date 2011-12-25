<VirtualHost *:80>
    ServerName micrtonerdakota.com
    ServerAlias www.micrtonerdakota.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerdakota.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerdakota.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
