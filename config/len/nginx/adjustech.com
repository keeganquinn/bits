server {
    listen 80;
    listen [::]:80;
    server_name www.adjustech.com;

    return 301 http://adjustech.com$request_uri;
}

server {
    listen 80;
    listen [::]:80;
    server_name adjustech.com;

    root /srv/www/adjustech.com;

    error_page 404 /404.html;
}
