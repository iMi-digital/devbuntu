FROM ubuntu:16.04

# Install php and apache2
RUN apt-get update && \
	apt-get -y install software-properties-common && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/apache2 && \
	apt-get update && \
	apt-get -y install \
 curl wget \
 php7.0 php7.0-cli php7.0-fpm php7.0-common php7.0-bcmath php7.0-curl php7.0-fpm php7.0-gd php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-odbc php7.0-opcache php7.0-readline php7.0-soap php7.0-sybase php7.0-xml php7.0-xmlrpc php7.0-zip  libapache2-mod-php7.0\
 php-xdebug mariadb-client\
 imagemagick && \
 a2enmod rewrite rewrite vhost_alias headers

# Set up xdebug
COPY 20-xdebug.ini /etc/php/7.1/apache2/conf.d/20-xdebug.ini

# Create the workdir
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
EXPOSE 80

# Let apache run in foreground
COPY apache2-foreground /usr/local/bin/
CMD ["apache2-foreground"]
