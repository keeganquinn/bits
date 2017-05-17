server {
    listen 80;
    listen [::]:80;
    server_name www.kernelklug.com;

    return 301 http://kernelklug.com$request_uri;
}

server {
    listen 80;
    listen [::]:80;
    server_name kernelklug.com;

    root /srv/www/kernelklug.com;

    error_page 404 /404.html;
}
