<VirtualHost *:80>
	ServerName micrtonerarizona.com
	ServerAlias www.micrtonerarizona.com
	ServerAdmin webmaster@micrtonerarizona.com

	CustomLog /home/keegan/www/logs/micrtonerarizona.com-access.log combined
	ErrorLog /home/keegan/www/logs/micrtonerarizona.com-error.log

	RedirectMatch /(.*) http://micrtonerinternational.com/$1
</VirtualHost>
