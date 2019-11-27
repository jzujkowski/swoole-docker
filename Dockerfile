FROM php:7.3-fpm

#RUN apk add autoconf clang gcc

RUN pecl install redis-5.1.1 \
    && pecl install swoole-4.4.12 \
    && docker-php-ext-enable redis swoole

WORKDIR /app

COPY swoole.php /app/swoole.php
COPY run.sh /app/run.sh

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

VOLUME /code

CMD ["/app/run.sh"]
