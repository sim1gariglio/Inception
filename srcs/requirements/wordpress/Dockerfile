FROM debian:11

# Install necessary packages
RUN apt-get update && apt-get upgrade && apt-get install -y \
	php-fpm php-mysql curl wget unzip \
	mariadb-client \
	&& apt-get clean

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# Create necessary directories
RUN mkdir -p /run/php /var/www/html

# Copy configuration files
# COPY conf/php.ini /etc/php/7.4/fpm/php.ini
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/auto_config.sh /usr/local/bin/auto_config.sh

# Set permissions
RUN chmod +x /usr/local/bin/auto_config.sh

# Expose port 9000
EXPOSE 9000

# Run the auto configuration script
CMD ["auto_config.sh"]