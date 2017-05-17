server {
    listen 80;
    listen [::]:80;
    server_name str1ng.ml www.str1ng.ml;

    return 301 https://basslin.es/str1ng$request_uri;
}
