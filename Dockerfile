FROM keboola/base
ENV APP_VERSION 1.0.0

# Image setup
WORKDIR /tmp
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm && \
	rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
	yum -y --enablerepo=epel,remi,remi-php70 upgrade && \
	yum -y --enablerepo=epel,remi,remi-php70 install \
		git \
		php \
		php-cli \
		php-common \
		php-mbstring \
		php-pdo \
		php-xml \
		&& \
	yum clean all && \
	echo "date.timezone=UTC" >> /etc/php.ini && \
	echo "memory_limit = -1" >> /etc/php.ini && \
	curl -sS https://getcomposer.org/installer | php && \
	mv composer.phar /usr/local/bin/composer