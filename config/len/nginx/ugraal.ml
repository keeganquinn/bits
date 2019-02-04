# -*- nginx -*-

server {
    listen 80;
    listen [::]:80;
    server_name ugraal.ml www.ugraal.ml;

    access_log off;

    return 301 https://www.twitch.tv/ugraal$request_uri;
}
