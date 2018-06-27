FROM php:7.1

MAINTAINER passioninfinite <passioninfinite1795@gmail.com>

RUN apt-get update

#Install unzip
RUN apt-get install unzip

#Install mongodb using pecl
RUN pecl install mongodb

#Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Print Composer version
RUN composer --version

