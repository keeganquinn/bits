<VirtualHost *:80>
    ServerName micrtonertexas.com
    ServerAlias www.micrtonertexas.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonertexas.com-access.log combined
    ErrorLog /var/log/apache2/micrtonertexas.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
