server {
    listen 80;
    listen [::]:80;
    server_name unplug.ml www.unplug.ml;

    return 301 http://personaltelco.net$request_uri;
}
