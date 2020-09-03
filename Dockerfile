FROM php:7.4

RUN apt-get update -y && apt-get install -y libpng-dev libzip-dev libxml2-dev libbz2-dev libonig-dev
RUN docker-php-ext-install mbstring pdo_mysql json gd xml zip bz2 opcache bcmath exif fileinfo intl calendar
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === file_get_contents('https://composer.github.io/installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --install-dir=/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"
