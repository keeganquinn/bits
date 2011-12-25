<VirtualHost *:80>
    ServerName micrtonerus.com
    ServerAlias www.micrtonerus.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerus.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerus.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
