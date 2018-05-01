FROM ubuntu:16.04

RUN apt-get update && \
	apt-get -y install software-properties-common && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
	LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/apache2 && \
	apt-get update && \
	apt-get -y install \
 php7.1 php7.1-cli php7.1-fpm php7.1-common php7.1-bcmath php7.1-curl php7.1-fpm php7.1-gd php7.1-intl php7.1-json php7.1-ldap php7.1-mbstring php7.1-mcrypt php7.1-mysql php7.1-odbc php7.1-opcache php7.1-readline php7.1-soap php7.1-sybase php7.1-xml php7.1-xmlrpc php7.1-zip  libapache2-mod-php7.1\
 php7.0 php7.0-cli php7.0-fpm php7.0-common php7.0-bcmath php7.0-curl php7.0-fpm php7.0-gd php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-odbc php7.0-opcache php7.0-readline php7.0-soap php7.0-sybase php7.0-xml php7.0-xmlrpc php7.0-zip  libapache2-mod-php7.0\
 php5.6 php5.6-cli php5.6-fpm php5.6-common php5.6-bcmath php5.6-curl php5.6-fpm php5.6-gd php5.6-intl php5.6-json php5.6-ldap php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-odbc php5.6-opcache php5.6-readline php5.6-soap php5.6-sybase php5.6-xml php5.6-xmlrpc php5.6-zip  libapache2-mod-php5.6\
 php7.2 php7.2-cli php7.2-fpm php7.2-common php7.2-bcmath php7.2-curl php7.2-fpm php7.2-gd php7.2-intl php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql php7.2-odbc php7.2-opcache php7.2-readline php7.2-soap php7.2-sybase php7.2-xml php7.2-xmlrpc php7.2-zip  libapache2-mod-php7.2\
 php-xdebug\
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


RUN phive install -g --trust-gpg-keys 993876E71CF55503 iMi-digital/irobo 

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get install -y nodejs \
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get update && apt-get install yarn \
	&& yarn global add bower gulp
