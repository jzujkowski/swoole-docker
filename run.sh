#!/bin/bash

if [[ "${LARAVEL}" = true ]]; then
  echo "[info] Running laravel-swoole process"
  cd /code
  php artisan swoole:http start
else
	echo "[info] No run command set.  Running default swoole.php (example app)"
  cd /swoole
  php swoole.php
fi
