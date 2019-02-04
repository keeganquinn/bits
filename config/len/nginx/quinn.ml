# -*- nginx -*-

server {
    listen 80;
    listen [::]:80;
    server_name quinn.ml www.quinn.ml;

    access_log off;

    return 301 https://quinn.tk$request_uri;
}
