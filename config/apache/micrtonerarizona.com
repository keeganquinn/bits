<VirtualHost *:80>
    ServerName micrtonerarizona.com
    ServerAlias www.micrtonerarizona.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonerarizona.com-access.log combined
    ErrorLog /var/log/apache2/micrtonerarizona.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
