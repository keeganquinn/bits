<VirtualHost *:80>
    ServerName micrtonermontana.com
    ServerAlias www.micrtonermontana.com
    ServerAdmin webmaster@micrtonerinternational.com

    CustomLog /var/log/apache2/micrtonermontana.com-access.log combined
    ErrorLog /var/log/apache2/micrtonermontana.com-error.log

    RedirectMatch /(.*) https://micrtonerinternational.com/$1
</VirtualHost>
