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

# Install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install phive
RUN curl -sSLo phive.phar https://phar.io/releases/phive.phar \
	&& curl -sSLo phive.phar.asc https://phar.io/releases/phive.phar.asc \
	&& gpg --keyserver hkps.pool.sks-keyservers.net --recv-keys 0x9D8A98B29B2D5D79 \
	&& gpg --verify phive.phar.asc phive.phar \
	&& chmod +x phive.phar \
	&& mv phive.phar /usr/bin/phive

# Install iMi special irobo and n98-magerun2
RUN phive install -g --trust-gpg-keys 993876E71CF55503 iMi-digital/irobo && \
 phive install -g --trust-gpg-keys 59B3B8B6C924630C n98-magerun2

# Install frontend build stuff
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get install -y nodejs \
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get update && apt-get install yarn \
	&& yarn global add bower gulp

# Create the workdir
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
EXPOSE 80

# Let apache run in foreground
COPY apache2-foreground /usr/local/bin/
CMD ["apache2-foreground"]
