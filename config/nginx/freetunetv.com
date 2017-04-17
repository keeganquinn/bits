server {
    listen 80;
    listen [::]:80;
    server_name www.freetunetv.com;

    return 301 http://freetunetv.com$request_uri;
}

server {
    listen 80;
    listen [::]:80;
    server_name freetunetv.com;

    root /srv/www/freetunetv.com;

    error_page 404 /404.html;
}
