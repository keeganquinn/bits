<VirtualHost *:80>
    ServerName micrtonerutah.com
    ServerAlias www.micrtonerutah.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerutah.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerutah.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
