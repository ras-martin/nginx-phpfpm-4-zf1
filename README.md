# Docker-Image with Nginx + PHP-FPM optimized & configured for ZF1

[![Build Status](https://travis-ci.org/ras-martin/nginx-phpfpm-4-zf1.svg?branch=master)](https://travis-ci.org/ras-martin/nginx-phpfpm-4-zf1)

* [Docker Hub](https://hub.docker.com/r/rasmartin/nginx-phpfpm-4-zf1)
* [GitHub](https://github.com/ras-martin/nginx-phpfpm-4-zf1)

This is a custom Docker-Image based on [Nginx](https://www.nginx.com/) and [PHP-FPM](https://www.php.net/) to host your [ZF1](https://github.com/zendframework/zf1)-based project (or better [ZF1 with compatibility changes](https://github.com/Shardj/zf1-future) for PHP7).

## Distributions

At the moment the following distributions are support:
* [Alpine Linux](https://alpinelinux.org/) amd64

The included `build.sh` can be used to build the required Docker-Image.

## FAQ's

### Where do I have to mount the docroot to?

The docroot must be mounted to `/application/src` so that the webserver can use `/application/src/public` as docroot.

### How to overwrite PHP settings?

If it is required to overwrite PHP settings, create a custom configuration file ([php.ini](https://www.php.net/manual/en/ini.list.php) style) which contains the required configurations and mount it with `docker run` to `/etc/php7/conf.d/zzz-override.ini`.
