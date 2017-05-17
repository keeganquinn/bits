server {
    listen 80;
    listen [::]:80;
    server_name www.fernhillmarket.com;

    return 301 http://fernhillmarket.com$request_uri;
}

server {
    listen 80;
    listen [::]:80;
    server_name fernhillmarket.com;

    root /srv/www/fernhillmarket.com;

    error_page 404 /404.html;
}
