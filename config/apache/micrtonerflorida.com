<VirtualHost *:80>
    ServerName micrtonerflorida.com
    ServerAlias www.micrtonerflorida.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerflorida.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerflorida.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
