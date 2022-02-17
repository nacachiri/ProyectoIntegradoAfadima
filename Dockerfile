FROM php:8.1.1
WORKDIR /app
RUN apt-get update && apt-get install wget && apt install zip unzip && \
    wget https://get.symfony.com/cli/installer -O - | bash && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony 
RUN docker-php-ext-install pdo pdo_mysql
RUN wget -O compose-setup.php https://getcomposer.org/installer && \
    php compose-setup.php --install-dir=/usr/local/bin/ --filename=composer.php
RUN sed -i 's/upload_max_filesize=2M;/upload_max_filesize=500M;/' /usr/local/etc/php/php.ini-development
RUN sed -i 's/post_max_size=8M;/post_max_size=0;/' /usr/local/etc/php/php.ini-development

RUN sed -i 's/upload_max_filesize=2M;/upload_max_filesize=500M;/' /usr/local/etc/php/php.ini-production
RUN sed -i 's/post_max_size=8M;/post_max_size=0;/' /usr/local/etc/php/php.ini-production

# RUN echo 'upload_max_filesize=500M;\npost_max_size=0;' >> /usr/local/etc/php/php.ini-development
# RUN echo 'upload_max_filesize=500M;\npost_max_size=0;' >> /usr/local/etc/php/php.ini-production 
CMD [ "symfony", "server:start"]