# 42 inception

## <img src="https://www.docker.com/sites/default/files/d8/2019-07/vertical-logo-monochromatic.png"  width="40px"> About the project

The aim of this project is to build and up the following services using docker-compose:
- MariaDB
- Wordpress
- NGiNX
- Adminer
- Cadvisor

As a one of the bonus, there is also a static webpage.

Here is an example diagram of the expected result:

<img width="562" alt="Screen Shot 2021-12-22 at 8 38 03 PM" src="https://user-images.githubusercontent.com/54292953/147146268-a616f39a-3f16-41f8-80c9-db5494c3dfe7.png">

## Info, tips & links

```
.env file contains sensitive data in the enviroment variables.
Never store production environment and any important data in the repo!
```

Before writing Dockerfiles read the following and understand the concept of docker-init:
- [How to write your daemon](http://www.netzmafia.de/skripten/unix/linux-daemon-howto.html)
- [PID 1 and daemons](https://it-lux.ru/docker-entrypoint-pid-1/#1-%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-entrypoint-ampamp-cmd)
- [PID 1 and daemons](https://medium.com/hackernoon/my-process-became-pid-1-and-now-signals-behave-strangely-b05c52cc551c)
- [CMD vs ENTRYPOINT](https://habr.com/ru/company/southbridge/blog/329138/)

In all the containers I have used `envsubst` to replace env variables in the config files.

<hr>

### MariaDB
This is the first service you should up, because for mandatory part you have dependency chain:

MariaDB -> Wordpress -> Nginx


<hr>

### Wordpress

Wordpress is working under `php-fpm`, so I proxied to wordpress:port with `fastcgi_pass`.

Go ahead and take a look at a [useful site](https://wp-kama.ru/handbook/wp-cli) with a descriptions of wp-cli commands.

<hr>

### Nginx

I've used a bash script to generate certificates.

This script is called from the Makefile and it produces CA key, CA crt, server key and server crt files. <br>
Certificates passed to containers through separate volume.

You can manually add CA certificate to the browser to avoid 'insecure' error.
[Add certificate to Mozilla Firefox](https://docs.vmware.com/en/VMware-Adapter-for-SAP-Landscape-Management/2.1.0/Installation-and-Administration-Guide-for-VLA-Administrators/GUID-0CED691F-79D3-43A4-B90D-CD97650C13A0.html)

As for Nginx, `ssl_protocols TLSv1.2 TLSv1.3;` must be specified in config file.

In this project nginx is the entry point to all the services, except ftp.

<hr>

### Adminer

Adminer is working under `php-fpm` as well, so I proxied to adminer:port with `fastcgi_pass`.
You can also start it under `php` and proxy with `proxy_pass` 



<hr>

### cAdvisor

The info about these services could be found on the official pages:
- [cAdvisor](https://github.com/google/cadvisor)

Both of them are builded directly from their github repos.
