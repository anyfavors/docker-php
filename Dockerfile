FROM php:7.4

RUN apt-get update -y && apt-get install -y libpng-dev libzip-dev libxml2-dev libbz2-dev libonig-dev
RUN docker-php-ext-install mbstring pdo_mysql json gd xml zip bz2 opcache bcmath exif fileinfo intl calendar
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN wget https://getcomposer.org/installer -O composer-setup.php
RUN wget https://composer.github.io/installer.sha384sum

RUN sha384sum --check installer.sha384sum \
if [ $? != 0 ]; then \ 
  echo 'composer checksum is not valid' && rm composer-setup.php && rm installer.sha384sum \
  exit 1 \
fi

RUN php -r "unlink('composer-setup.php');"

RUN php -r "unlink('installer.sha384sum');"
