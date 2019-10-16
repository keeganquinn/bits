# -*- nginx -*-

server {
    listen 80;
    listen [::]:80;
    server_name hrd503.ml www.hrd503.ml;

    access_log off;

    return 301 https://basslin.es/hrd$request_uri;
}