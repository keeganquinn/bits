server {
    listen 80;
    listen [::]:80;
    server_name quinn.ml www.quinn.ml;

    return 301 https://quinn.tk$request_uri;
}
