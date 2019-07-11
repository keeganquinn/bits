# -*- nginx -*-

server {
    listen 80;
    listen [::]:80;
    server_name wabisabi.ml www.wabisabi.ml;

    access_log off;

    return 301 https://basslin.es/wabisabi$request_uri;
}
