FROM mysql:debian
COPY ./db.sql /docker-entrypoint-initdb.d/db.sql
COPY my.cnf /etc/mysql/my.cnf
COPY ./twig.csv /tmp/twig.csv
