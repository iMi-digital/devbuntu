FROM ubuntu:16.04

# Install php and apache2
RUN apt-get update && \
	apt-get -y install software-properties-common && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/apache2 && \
	apt-get update && \
	apt-get -y install \
 curl wget unzip \
 php5.6 php5.6-cli php5.6-fpm php5.6-common php5.6-bcmath php5.6-curl php5.6-fpm php5.6-gd php5.6-intl php5.6-json php5.6-ldap php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-odbc php5.6-opcache php5.6-readline php5.6-soap php5.6-sybase php5.6-xml php5.6-xmlrpc php5.6-zip  libapache2-mod-php5.6\
 mariadb-client\
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
