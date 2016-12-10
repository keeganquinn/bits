<VirtualHost *:80>
    ServerName kernelklug.com
    ServerAlias www.kernelklug.com
    ServerAdmin webmaster@kernelklug.com

    CustomLog /var/log/apache2/kernelklug.com-access.log combined
    ErrorLog /var/log/apache2/kernelklug.com-error.log

    DocumentRoot /srv/www/kernelklug.com
    <Directory /srv/www/kernelklug.com>
        Allow from all
    </Directory>

    Options +FollowSymLinks -MultiViews -Indexes

    ErrorDocument 404 /404.html

    # UTF-8 encoding
    AddDefaultCharset utf-8
    AddCharset utf-8 .html .css .js .xml .json .rss .atom

    # Rewrite to remove 'www' from hostname, if present
    RewriteEngine on
    RewriteCond %{HTTPS} !=on
    RewriteCond %{HTTP_HOST} ^www\.(.+)$ [NC]
    RewriteRule ^ http://%1%{REQUEST_URI} [R=301,L]

    # Block access to hidden things
    RewriteRule "(^|/)\." - [F]

    # Proper MIME types
    AddType application/javascript         js

    AddType audio/ogg                      oga ogg
    AddType audio/mp4                      m4a

    AddType video/ogg                      ogv
    AddType video/mp4                      mp4 m4v
    AddType video/webm                     webm

    AddType image/svg+xml                  svg svgz
    AddEncoding gzip                       svgz

    AddType application/vnd.ms-fontobject  eot
    AddType application/x-font-ttf         ttf ttc
    AddType font/opentype                  otf
    AddType application/x-font-woff        woff

    AddType image/x-icon                   ico
    AddType image/webp                     webp
    AddType text/cache-manifest            appcache manifest
    AddType text/x-component               htc
    AddType application/x-chrome-extension crx
    AddType application/x-xpinstall        xpi
    AddType application/octet-stream       safariextz
    AddType text/x-vcard                   vcf

    # Force the latest IE version, in various cases when it may fall back to IE7 mode
    # Use ChromeFrame if it's installed for a better experience for the poor IE folk
    Header set X-UA-Compatible "IE=Edge,chrome=1"
    # mod_headers can't match by content-type, but we don't want to send this header on *everything*...
    <FilesMatch "\.(js|css|gif|png|jpe?g|pdf|xml|oga|ogg|m4a|ogv|mp4|m4v|webm|svg|svgz|eot|ttf|otf|woff|ico|webp|appcache|manifest|htc|crx|xpi|safariextz|vcf)$">
        Header unset X-UA-Compatible
    </FilesMatch>

    # Allow access from all domains for webfonts.
    <FilesMatch "\.(ttf|ttc|otf|eot|woff|font.css)$">
        Header set Access-Control-Allow-Origin "*"
    </FilesMatch>

    # Force deflate for mangled headers
    SetEnvIfNoCase ^(Accept-EncodXng|X-cept-Encoding|X{15}|~{15}|-{15})$ ^((gzip|deflate)\s*,?\s*)+|[X~-]{4,13}$ HAVE_Accept-Encoding
    RequestHeader append Accept-Encoding "gzip,deflate" env=HAVE_Accept-Encoding

    # HTML, TXT, CSS, JavaScript, JSON, XML, HTC:
    FilterDeclare   COMPRESS
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'text/html'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'text/css'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'text/plain'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'text/xml'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'text/x-component'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'application/javascript'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'application/json'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'application/xml'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'application/xhtml+xml'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'application/rss+xml'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'application/atom+xml'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'application/vnd.ms-fontobject'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'image/svg+xml'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'image/x-icon'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'application/x-font-ttf'"
    FilterProvider  COMPRESS  DEFLATE "%{Content_Type} = 'font/opentype'"
    FilterChain     COMPRESS
    FilterProtocol  COMPRESS  DEFLATE change=yes;byteranges=no

    # Stop screen flicker in IE on CSS rollovers
    BrowserMatch "MSIE" brokenvary=1
    BrowserMatch "Mozilla/4.[0-9]{2}" brokenvary=1
    BrowserMatch "Opera" !brokenvary
    SetEnvIf brokenvary 1 force-no-vary
</VirtualHost>
