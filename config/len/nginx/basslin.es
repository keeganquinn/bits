upstream bln_puma {
    server unix:///srv/rails/bln/shared/puma.sock fail_timeout=0;
}

server {
    listen 80;
    listen [::]:80;
    server_name basslin.es www.basslin.es;

    location /.well-known {
        alias /srv/www/basslin.es/.well-known;
    }

    location / {
        return 301 https://basslin.es$request_uri;
    }
}

server {
    listen 443 ssl http2;
    server_name www.basslin.es;
    ssl on;
    ssl_certificate /etc/ssl/certs/basslin.es.crt-combined;
    ssl_certificate_key /etc/ssl/private/basslin.es.key;
    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:!DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
    ssl_prefer_server_ciphers on;
    ssl_dhparam /etc/nginx/dhparams.pem;
    ssl_stapling on;
    ssl_stapling_verify on;
    ssl_trusted_certificate /etc/ssl/certs/basslin.es.crt-ca;
    add_header Strict-Transport-Security "max-age=31536000";

    location /.well-known {
        alias /srv/www/basslin.es/.well-known;
    }

    location / {
        return 301 https://basslin.es$request_uri;
    }
}

server {
    listen 443 ssl http2 default_server;
    server_name basslin.es;
    ssl on;
    ssl_certificate /etc/ssl/certs/basslin.es.crt-combined;
    ssl_certificate_key /etc/ssl/private/basslin.es.key;
    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:!DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
    ssl_prefer_server_ciphers on;
    ssl_dhparam /etc/nginx/dhparams.pem;
    ssl_stapling on;
    ssl_stapling_verify on;
    ssl_trusted_certificate /etc/ssl/certs/basslin.es.crt-ca;
    add_header Strict-Transport-Security "max-age=31536000";
    add_header Access-Control-Allow-Origin "*";

    root /srv/rails/bln/current/public;

    location ^~ /assets/ {
        gzip_static on;
        expires max;
        add_header Cache-Control public;
    }

    try_files $uri/index.html $uri @bln_puma;
    location @bln_puma {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto https;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        proxy_redirect off;
        proxy_pass http://bln_puma;
    }

    client_max_body_size 4G;
    keepalive_timeout 10;

    location /bluevertigo {
        return 301 /str1ng;
    }

    location ~ ^/keegan(/.*)?$ {
        return 301 /kQ$1;
    }

    location ~ ^/kq(/.*)?$ {
        return 301 /kQ$1;
    }

    location /order {
        return 301 /;
    }

    location /services {
        return 301 /;
    }

    location /stream {
        return 301 /;
    }

    location ~ ^/~(.+?)(/.*)?$ {
        alias /home/$1/public_html$2;
        index index.html index.htm;
        autoindex on;
    }
}
