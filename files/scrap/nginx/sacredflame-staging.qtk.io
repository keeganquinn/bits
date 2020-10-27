# -*- nginx -*-

server {
    listen 80;
    listen [::]:80;
    server_name sacredflame-staging.qtk.io;

    access_log off;

    location /.well-known {
        alias /srv/www/sacredflame.life/.well-known;
    }

    location / {
        return 301 https://sacredflame-staging.qtk.io$request_uri;
    }
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name sacredflame-staging.qtk.io;
    ssl on;
    ssl_certificate /etc/letsencrypt/live/sacredflame-staging.qtk.io/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/sacredflame-staging.qtk.io/privkey.pem;
    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:!DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
    ssl_prefer_server_ciphers on;
    ssl_dhparam /etc/nginx/dhparams.pem;
    ssl_stapling on;
    ssl_stapling_verify on;
    ssl_trusted_certificate /etc/letsencrypt/live/sacredflame-staging.qtk.io/chain.pem;
    add_header Strict-Transport-Security "max-age=31536000";
    add_header Access-Control-Allow-Origin "*";

    access_log /var/log/nginx/sacredflame-staging.qtk.io-access.log combined if=$log_ua;
    error_log /var/log/nginx/sacredflame-staging.qtk.io-error.log warn;

    root /srv/www/sacredflame.life;
}
