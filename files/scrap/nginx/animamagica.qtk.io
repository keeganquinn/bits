# -*- nginx -*-

upstream animamagica_puma {
    server unix:///srv/rails/animamagica/shared/puma.sock fail_timeout=0;
}

server {
    listen 80;
    listen [::]:80;
    server_name animamagica.qtk.io;

    access_log off;

    location /.well-known {
        alias /srv/rails/animamagica/current/public/.well-known;
    }

    location / {
        return 301 https://animamagica.qtk.io$request_uri;
    }
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name animamagica.qtk.io;
    ssl on;
    ssl_certificate /etc/letsencrypt/live/animamagica.qtk.io/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/animamagica.qtk.io/privkey.pem;
    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:!DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
    ssl_prefer_server_ciphers on;
    ssl_dhparam /etc/nginx/dhparams.pem;
    ssl_stapling on;
    ssl_stapling_verify on;
    ssl_trusted_certificate /etc/letsencrypt/live/animamagica.qtk.io/chain.pem;
    add_header Strict-Transport-Security "max-age=31536000";

    access_log /var/log/nginx/animamagica.qtk.io-access.log combined if=$log_ua;
    error_log /var/log/nginx/animamagica.qtk.io-error.log warn;

    root /srv/rails/animamagica/current/public;

    location /.well-known/apple-app-site-association {
        default_type application/json;
    }

    location ^~ /assets/ {
        gzip_static on;
        expires max;
        add_header Cache-Control public;
    }

    try_files $uri/index.html $uri @animamagica_puma;
    location @animamagica_puma {
        if (-f $document_root/../tmp/maintenance.txt) {
            return 503;
        }

        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto https;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        proxy_redirect off;
        proxy_pass http://animamagica_puma;
        proxy_buffer_size 16k;
        proxy_buffers 128 256k;
    }

    client_max_body_size 4G;
    keepalive_timeout 10;

    error_page 503 @maintenance;

    location @maintenance {
        if (!-f $request_filename) {
            rewrite ^(.*)$ /maintenance.html break;
        }
    }
}
