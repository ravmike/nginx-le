FROM nginx:1.30-alpine

# enables automatic changelog generation by tools like Dependabot
LABEL org.opencontainers.image.source="https://github.com/ravmike/nginx-le"

ADD conf/nginx.conf /etc/nginx/nginx.conf

ADD script/entrypoint.sh /entrypoint.sh
ADD script/le.sh /le.sh
ADD script/verify-runtime.sh /verify-runtime.sh

RUN \
 rm /etc/nginx/conf.d/default.conf && \
 chmod +x /entrypoint.sh && \
 chmod +x /le.sh && \
 chmod +x /verify-runtime.sh && \
 apk add --no-cache --update certbot tzdata openssl && \
 /verify-runtime.sh

CMD ["/entrypoint.sh"]
