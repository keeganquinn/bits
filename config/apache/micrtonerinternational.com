<VirtualHost *:80>
	ServerName micrtonerinternational.com
	ServerAlias www.micrtonerinternational.com
	ServerAdmin webmaster@micrtonerinternational.com

	RedirectMatch 301 ^/(.*)$ https://micrtonerinternational.com/$1
</VirtualHost>
