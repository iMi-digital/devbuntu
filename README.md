# devbuntu

[![Docker Pulls](https://img.shields.io/docker/pulls/imid/devbuntu.svg)](https://hub.docker.com/r/imid/devbuntu/)

> iMi standard PHP dev box as docker image.

It has php, apache2, mariadb-client, composer, phive, [iMi's special iRobo fork](https://github.com/iMi-digital/iRobo), n98-magerun, none js, yarn, bower and gulp installed.

Currently beta.

# Supported tags and respective `Dockerfile` links

* `7.2`, `latest` [(Dockerfile)](https://github.com/iMi-digital/devbuntu/tree/master/7.2/full)
* `7.1` [(Dockerfile)](https://github.com/iMi-digital/devbuntu/tree/master/7.1/full)
* `7.0` [(Dockerfile)](https://github.com/iMi-digital/devbuntu/tree/master/7.0/full)
* `5.6` [(Dockerfile)](https://github.com/iMi-digital/devbuntu/tree/master/5.6/full)

Each tag is also available as a "base" version with only php and apache installed, no tools.

## Usage

Simply run 

```bash
docker run -v $PWD:/var/www/html -p 80:80 --name devbuntu -d imid/devbuntu
```

This will run the image in the latest stable php version (7.2) with your current directory mounted to `/var/www/html`.

To connect inside the container to execute for example composer, run

```bash
docker exec -it devbuntu bash
```

This will throw you in a bash session inside the container.

### Change apache webroot

You can change the apache webroot by using the `APACHE_DOCUMENT_ROOT` environment variable, for example:

```bash
docker run -v $PWD:/var/www/html -p 80:80 -e APACHE_DOCUMENT_ROOT=/var/www/html/public --name devbuntu -d imid/devbuntu
```

### Becoming www-data inside of the container

Apache runs with the user `www-data`. To ensure correct permissions, it sometimes is useful to become the user running the webserver. To do this inside the docker container, simply run

```bash
~$ w3d
```

## Contributing

If you run into any issues with the image or discover a bug, feel free to [create a new issue](https://github.com/iMi-digital/devbuntu/issues/new) on Github.

Or, if you have any improvements to the image, fork and create a pull request.

General help and feedback is below in the comments.

# About Us

[iMi digital GmbH](http://www.imi.de/) offers Magento & Laravel related open source modules. If you are confronted with any bugs, you may want to open an issue here.

In need of support or an implementation of a modul in an existing system, [feel free to contact us](mailto:digital@iMi.de). In this case, we will provide full service support for a fee.

Of course we provide development of closed-source modules or full magento shops as well.

## License

Copyright 2018 iMi digital GmbH Licensed under MIT
