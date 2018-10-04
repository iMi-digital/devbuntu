FROM ubuntu:16.04

RUN apt-get update && \
	apt-get -y install software-properties-common && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/apache2 && \
	apt-get update && \
	apt-get -y install \
 php7.2 php7.2-cli php7.2-fpm php7.2-common php7.2-bcmath php7.2-curl php7.2-fpm php7.2-gd php7.2-intl php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-odbc php7.2-opcache php7.2-readline php7.2-soap php7.2-sybase php7.2-xml php7.2-xmlrpc php7.2-zip  libapache2-mod-php7.2\
 php-xdebug mariadb-client\
 imagemagick

RUN apt-get update && \
	apt-get -y install curl wget

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

RUN curl -sSLo phive.phar https://phar.io/releases/phive.phar \
	&& curl -sSLo phive.phar.asc https://phar.io/releases/phive.phar.asc \
	&& gpg --keyserver hkps.pool.sks-keyservers.net --recv-keys 0x9D8A98B29B2D5D79 \
	&& gpg --verify phive.phar.asc phive.phar \
	&& chmod +x phive.phar \
	&& mv phive.phar /usr/bin/phive

RUN phive install -g --trust-gpg-keys 993876E71CF55503 iMi-digital/irobo && \
 phive install -g --trust-gpg-keys 59B3B8B6C924630C n98-magerun2

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get install -y nodejs \
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get update && apt-get install yarn \
	&& yarn global add bower gulp

RUN mkdir -p /var/www/html
WORKDIR /var/www/html
EXPOSE 80

COPY apache2-foreground /usr/local/bin/
CMD ["apache2-foreground"]
