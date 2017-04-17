server {
    listen 80;
    listen [::]:80;
    server_name www.tunetvonline.com;

    return 301 http://tunetvonline.com$request_uri;
}

server {
    listen 80;
    listen [::]:80;
    server_name tunetvonline.com;

    root /srv/www/tunetvonline.com;

    error_page 404 /404.html;
}
