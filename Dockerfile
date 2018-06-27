FROM ubuntu:16.04

MAINTAINER passioninfinite <passioninfinite1795@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    locales \
    software-properties-common \
    python-software-properties \
    build-essential \
    curl \
    git \
    unzip \
    mcrypt \
    wget \
    openssl \
    autoconf \
    openssh-client \
    g++ \
    make \
    libssl-dev \
    libcurl4-openssl-dev \
    libsasl2-dev \
    libcurl3 \
    --no-install-recommends && rm -r /var/lib/apt/lists/* \
    && apt-get --purge autoremove -y

# Ensure UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
RUN locale-gen en_US.UTF-8

# OpenSSL
RUN mkdir -p /usr/local/openssl/include/openssl/ && \
    ln -s /usr/include/openssl/evp.h /usr/local/openssl/include/openssl/evp.h && \
    mkdir -p /usr/local/openssl/lib/ && \
    ln -s /usr/lib/x86_64-linux-gnu/libssl.a /usr/local/openssl/lib/libssl.a && \
    ln -s /usr/lib/x86_64-linux-gnu/libssl.so /usr/local/openssl/lib/

RUN mkdir /root/.ssh/

RUN chmod 700 /root/.ssh/

# NODE JS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install nodejs -qq && \
    npm install -g gulp-cli 


RUN add-apt-repository -y ppa:ondrej/php && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y -qq php-pear \
      php7.1-dev \
      php7.1-cli \
      php7.1-fpm \
      php7.1-apcu \
      php7.1-bcmath \
      php7.1-bz2 \
      php7.1-calendar \
      php7.1-common \
      php7.1-ctype \
      php7.1-curl \
      php7.1-dba \
      php7.1-dom \
      php7.1-embed \
      php7.1-enchant \
      php7.1-exif \
      php7.1-fpm \
      php7.1-ftp \
      php7.1-gd \
      php7.1-gettext \
      php7.1-gmp \
      php7.1-iconv \
      php7.1-imagick \
      php7.1-imap \
      php7.1-intl \
      php7.1-json \
      php7.1-ldap \
      php7.1-mbstring \
      php7.1-mcrypt \
      php7.1-memcached \
      php7.1-mongodb \
      php7.1-mysqli \
      php7.1-mysqlnd \
      php7.1-odbc \
      php7.1-opcache \
#      php7.0-openssl \
      php7.1-pdo \
      php7.1-pgsql \
      php7.1-phar \
      php7.1-phpdbg \
      php7.1-posix \
      php7.1-pspell \
      php7.1-redis \
      php7.1-shmop \
      php7.1-snmp \
      php7.1-soap \
      php7.1-sockets \
      php7.1-sqlite3 \
      php7.1-sysvmsg \
      php7.1-sysvsem \
      php7.1-sysvshm \
      php7.1-tidy \
      php7.1-tokenizer \
      php7.1-wddx \
      php7.1-xdebug \
      php7.1-xml \
      php7.1-xmlreader \
      php7.1-xmlrpc \
      php7.1-xmlwriter \
      php7.1-xsl \
      php7.1-zip 


RUN apt-get clean -y && \
        apt-get autoremove -y && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Install unzip
RUN apt-get install unzip

#Install mongodb using pecl
RUN pecl install mongodb

#Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Print Composer version
RUN composer --version

