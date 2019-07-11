# -*- nginx -*-

server {
    listen 80;
    listen [::]:80;
    server_name abusive.ml www.abusive.ml;

    access_log off;

    return 301 http://abusive.enjin.com$request_uri;
}
