<VirtualHost *:80>
	ServerName micrtonermontana.com
	ServerAlias www.micrtonermontana.com
	ServerAdmin webmaster@micrtonermontana.com

	CustomLog /home/keegan/www/logs/micrtonermontana.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonermontana.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
