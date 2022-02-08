FROM php:8.1.1
WORKDIR /app
RUN apt-get update && apt-get install wget && apt install zip unzip && \
    wget https://get.symfony.com/cli/installer -O - | bash && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony 
RUN docker-php-ext-install pdo pdo_mysql
RUN wget -O compose-setup.php https://getcomposer.org/installer && \
    php compose-setup.php --install-dir=/usr/local/bin/ --filename=composer.php
RUN cp -r . .
CMD [ "symfony", "server:start"]