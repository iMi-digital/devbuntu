FROM ubuntu:16.04

# Install php and apache2
RUN apt-get update && \
	apt-get -y install software-properties-common && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/apache2 && \
	apt-get update && \
	apt-get -y install \
 curl wget unzip \
 php7.1 php7.1-cli php7.1-fpm php7.1-common php7.1-bcmath php7.1-curl php7.1-fpm php7.1-gd php7.1-intl php7.1-json php7.1-ldap php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-odbc php7.1-opcache php7.1-readline php7.1-soap php7.1-sybase php7.1-xml php7.1-xmlrpc php7.1-zip  libapache2-mod-php7.1\
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

# Use www-data
ADD www-data.sh /usr/local/bin/www-data
RUN chmod +x /usr/local/bin/www-data

# Let apache run in foreground
COPY apache2-foreground /usr/local/bin/
CMD ["apache2-foreground"]
