#!/bin/sh

if [ ! -f ./.initialized ]; then
		echo "wordpress configuration..."
		mv /usr/src/wordpress/* .

		#Inport env variables in the config file
		cp wp-config-sample.php wp-config.php
		sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
		sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
		sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config.php
		sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php

		wp core install \
				--url="$WP_URL" \
				--title="$WP_TITLE" \
				--admin_user="$WP_ADMIN_USER" \
				--admin_password="$WP_ADMIN_PASSWORD" \
				--admin_email="$WP_ADMIN_EMAIL" \
				--skip-email \
				--allow-root || exit 1

		wp user create "$WP_USER" "$WP_USER_EMAIL" \
				--user_pass="$WP_USER_PASSWORD" \
				--role=editor \
				--allow-root || exit 1  

		touch .initialized
fi

exec "$@"
