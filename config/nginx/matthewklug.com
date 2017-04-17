server {
    listen 80;
    listen [::]:80;
    server_name www.matthewklug.com;

    return 301 http://matthewklug.com$request_uri;
}

server {
    listen 80;
    listen [::]:80;
    server_name matthewklug.com;

    root /srv/www/matthewklug.com;

    error_page 404 /404.html;
}
