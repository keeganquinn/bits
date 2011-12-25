<VirtualHost *:80>
    ServerName micrtonerlasvegas.com
    ServerAlias www.micrtonerlasvegas.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerlasvegas.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerlasvegas.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
