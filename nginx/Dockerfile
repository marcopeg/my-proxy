FROM nginx:1.11
EXPOSE 80

VOLUME /etc/nginx/sites-enabled

ADD nginx-boot.sh /nginx-boot.sh
ADD nginx.conf /etc/nginx/nginx.conf
ADD sites-enabled /etc/nginx/sites-enabled-templates
ADD default-website /etc/nginx/default-website

ENTRYPOINT "/nginx-boot.sh"
