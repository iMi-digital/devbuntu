FROM ubuntu:16.04

# Install php and apache2
RUN apt-get update && \
	apt-get -y install software-properties-common && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/apache2 && \
	apt-get update && \
	apt-get -y install \
 curl wget unzip \
 php7.0 php7.0-cli php7.0-fpm php7.0-common php7.0-bcmath php7.0-curl php7.0-fpm php7.0-gd php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-odbc php7.0-opcache php7.0-readline php7.0-soap php7.0-sybase php7.0-xml php7.0-xmlrpc php7.0-zip  libapache2-mod-php7.0\
 mariadb-client vim nano\
 imagemagick && \
 a2enmod rewrite rewrite vhost_alias headers  

# Custom apache config
COPY apache.conf /etc/apache2/sites-available/000-default.conf
ENV APACHE_DOCUMENT_ROOT /var/www/html # Placeholder, you can change this at runtime

# Create the workdir
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
EXPOSE 80

# Let apache run in foreground
COPY apache2-foreground /usr/local/bin/
CMD ["apache2-foreground"]
