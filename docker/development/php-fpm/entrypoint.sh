#!/bin/bash
set -e

USER_ID=${UID:-1000}
GROUP_ID=${GID:-1000}

echo "Fixing file permissions with UID=${USER_ID} and GID=${GROUP_ID}..."
chown -R ${USER_ID}:${GROUP_ID} /var/www || echo "Some files could not be changed"

if [ -f /var/www/artisan ]; then
    echo "Setting Laravel storage permissions..."
    chmod -R 775 /var/www/storage /var/www/bootstrap/cache || true
    chown -R www:www /var/www/storage /var/www/bootstrap/cache || true
    
    echo "Clearing Laravel configurations..."
    php artisan config:clear || true
    php artisan route:clear || true
    php artisan view:clear || true
fi

exec "$@"
