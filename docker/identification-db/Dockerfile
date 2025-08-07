# identification-db/Dockerfile
#FROM mysql:8.3

FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Copy the SQL dump so MySQL initialises the schema & data on first run
COPY init/*.sql /docker-entrypoint-initdb.d/

# Expose for clarity; docker-compose publishes the port
EXPOSE 3306
