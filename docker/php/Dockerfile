FROM php:8.1.3-fpm

# Update
RUN apt-get -y update --fix-missing && \
    apt-get upgrade -y && \
    apt-get --no-install-recommends install -y apt-utils && \
    rm -rf /var/lib/apt/lists/*

# Install git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN git config --global user.email "samuel.challe@gmail.com"
RUN git config --global user.name "Samuel Challe"

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Symfony CLI
RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list
RUN apt-get update
RUN apt-get install symfony-cli

# PHP8 Extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && sync
RUN install-php-extensions apcu
RUN install-php-extensions curl
RUN install-php-extensions exif
RUN install-php-extensions intl
RUN install-php-extensions mbstring
RUN install-php-extensions opcache
RUN install-php-extensions pdo_mysql
RUN install-php-extensions tokenizer
RUN install-php-extensions xml
RUN install-php-extensions xsl
RUN install-php-extensions zip
