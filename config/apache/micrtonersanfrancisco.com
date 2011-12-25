<VirtualHost *:80>
    ServerName micrtonersanfrancisco.com
    ServerAlias www.micrtonersanfrancisco.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonersanfrancisco.com-access.log combined
    ErrorLog /var/log/apache2/micrtonersanfrancisco.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
