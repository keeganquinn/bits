<VirtualHost *:80>
    ServerName micrtonerchicago.com
    ServerAlias www.micrtonerchicago.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerchicago.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerchicago.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
