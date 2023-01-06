FROM php:8.2.1

RUN apt-get update -y && apt-get install -y libpng-dev libzip-dev libxml2-dev libbz2-dev libonig-dev
RUN docker-php-ext-install mbstring pdo_mysql json gd xml zip bz2 opcache bcmath exif fileinfo intl calendar
