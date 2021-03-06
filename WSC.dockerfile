FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get upgrade -y
# skip interaction with terminal
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get install -y apache2 
RUN apt-get install -y php-bcmath php-bz2 php-intl php-gd php-mbstring libmcrypt-dev php-mysql,dev php-common php-json
RUN apt-get install -y libapache2-mod-php  
RUN apt-get install -y composer
RUN apt-get install -y software-properties-common
COPY ./php.ini /etc/php/7.3/apache2/php.ini
COPY ./apache2.conf /etc/apache2/apache2.conf
RUN systemctl enable apache2.service

# enables the specified module within the apache2 configuration
RUN a2enmod rewrite headers

EXPOSE 80
EXPOSE 443
