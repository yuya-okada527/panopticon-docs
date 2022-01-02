#!bin/sh -veu
echo "start waiting db connection"
until mysqladmin ping -h panopticon-db -u root --silent; do
  echo 'waiting for mysqld tobe connectable...'
  sleep 2
done
