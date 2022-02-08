#!/usr/bin/env bash

# Copy Wallet profiles
cp /wallet/* /usr/lib/oracle/21/client64/lib/network/admin/


export DBNAME="autodbtest301_high"
export DBPASSWORD="Chh%%67896789psh"
export DBUSER="admin"

# Run migrations and collectstatic
cd /django-rest
/django-rest/env/bin/python manage.py migrate
/django-rest/env/bin/python manage.py collectstatic --noinput

# Configure supervisor
cp /django-rest/deploy/supervisor_profiles_api.conf /etc/supervisor/conf.d/profiles_api.conf
service supervisor start
supervisorctl reread
supervisorctl update
supervisorctl restart profiles_api


# Configure nginx
cp /django-rest/deploy/nginx_profiles_api.conf /etc/nginx/sites-available/profiles_api.conf
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/profiles_api.conf /etc/nginx/sites-enabled/profiles_api.conf
service  nginx restart

echo "DONE! :)"
