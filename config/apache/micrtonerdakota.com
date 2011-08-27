<VirtualHost *:80>
	ServerName micrtonerdakota.com
	ServerAlias www.micrtonerdakota.com
	ServerAdmin webmaster@micrtonerdakota.com

	CustomLog /home/keegan/www/logs/micrtonerdakota.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerdakota.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
