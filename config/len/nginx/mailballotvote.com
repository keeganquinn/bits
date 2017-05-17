server {
    listen 80;
    listen [::]:80;
    server_name www.mailballotvote.com;

    return 301 http://mailballotvote.com$request_uri;
}

server {
    listen 80;
    listen [::]:80;
    server_name mailballotvote.com;

    root /srv/www/mailballotvote.com;

    error_page 404 /404.html;
}
