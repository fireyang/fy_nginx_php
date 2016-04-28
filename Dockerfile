# Pull base image.
FROM debian:jessie

#change source list to 163.com
RUN mv /etc/apt/sources.list /etc/apt/sources.list.back
ADD conf/debian_jessie_source.list /etc/apt/sources.list

# Install Redis.
RUN echo "Asia/shanghai" > /etc/timezone;
RUN apt-get update --yes --force-yes 
RUN apt-get install vim --yes --force-yes
RUN apt-get install wget --yes --force-yes
RUN apt-get install python --yes --force-yes
RUN apt-get install nginx --yes --force-yes
# Install PHP
RUN apt-get install php5-fpm php5-mysql --yes --force-yes


RUN sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini

ADD conf/site_default_config /etc/nginx/sites-available/default

ENTRYPOINT  service nginx start && \
            service php5-fpm start && \
            bash

VOLUME ["/data"]

ENV PATH "$PATH:/usr/local/bin"

EXPOSE 80

CMD bash
