server {
    listen 80;
    listen [::]:80;
    server_name keegan.ws;

    return 301 http://www.keegan.ws$request_uri;
}
