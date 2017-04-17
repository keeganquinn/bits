server {
    listen 80;
    listen [::]:80;
    server_name www.fernhillmeadow.com;

    return 301 http://fernhillmeadow.com$request_uri;
}

server {
    listen 80;
    listen [::]:80;
    server_name fernhillmeadow.com;

    root /srv/www/fernhillmeadow.com;

    error_page 404 /404.html;
}
