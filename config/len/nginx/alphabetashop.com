server {
    listen 80;
    listen [::]:80;
    server_name www.alphabetashop.com;

    return 301 http://alphabetashop.com$request_uri;
}

server {
    listen 80;
    listen [::]:80;
    server_name alphabetashop.com;

    root /srv/www/alphabetashop.com;

    error_page 404 /404.html;
}
