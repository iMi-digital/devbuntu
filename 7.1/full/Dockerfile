#
# Generated Dockerfile!
# DO NOT EDIT DIRECTLY!
#

FROM imid/devbuntu:7.1-base

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

# Install Git
RUN apt-get update && apt-get install -y git git-lfs

# Set up xdebug
RUN apt-get install -y php-xdebug
COPY 20-xdebug.ini /etc/php/7.1/apache2/conf.d/20-xdebug.ini

# Usefull tools
RUN apt-get install -y pv

# Install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/ \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install phive
RUN curl -sSLo phive.phar https://phar.io/releases/phive.phar \
	&& curl -sSLo phive.phar.asc https://phar.io/releases/phive.phar.asc \
	&& gpg --keyserver hkps.pool.sks-keyservers.net --recv-keys 0x9d8a98b29b2d5d79 \
	&& gpg --verify phive.phar.asc phive.phar \
	&& chmod +x phive.phar \
	&& mv phive.phar /usr/bin/phive

# Install iMi special irobo and n98-magerun2
RUN phive install -g --trust-gpg-keys 993876E71CF55503,DD545A4C2E198F79 iMi-digital/irobo && \
 phive install -g --trust-gpg-keys 993876E71CF55503,DD545A4C2E198F79 n98-magerun2

# Install frontend build stuff
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get install -y nodejs \
	&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get update && apt-get install yarn \
	&& yarn global add bower gulp

# Install Cypress.io Dependencies
RUN apt-get install -y xvfb libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2
