FROM nginx:stable

RUN rm -r /etc/nginx/conf.d/*

ADD ./nginx.conf /etc/nginx/conf.d/myapp.conf
ADD ./.htpasswd /etc/nginx/.htpasswd
ADD ./certs/localhost+1.pem /etc/certs/localhost.pem
ADD ./certs/localhost+1-key.pem /etc/certs/localhost-key.pem

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
