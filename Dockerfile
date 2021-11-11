FROM nginxproxy/nginx-proxy:0.9-alpine

COPY conf.d /etc/nginx/conf.d
