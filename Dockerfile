FROM php:7.3-fpm-alpine

RUN pecl install redis-5.1.1 \
    && pecl install xdebug-2.6.0 \
    && pecl install swoole-4.4.12 \
    && docker-php-ext-enable redis xdebug swoole

WORKDIR /app

COPY swoole.php /swoole/swoole.php

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["/usr/local/bin/dumb-init", "--", "php"]

CMD ["/swoole/swoole.php"]