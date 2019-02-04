# -*- nginx -*-

server {
    listen 80;
    listen [::]:80;
    server_name unplug.ml www.unplug.ml;

    access_log off;

    return 301 http://personaltelco.net$request_uri;
}
