# Init Example Database World on PostgreSQL 11
FROM debezium/postgres:11

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD mysecretpassword 
ENV POSTGRES_DB dvdrental 

ADD scripts/* /docker-entrypoint-initdb.d/
RUN chmod -R +r /docker-entrypoint-initdb.d/

COPY docker-healthcheck /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-healthcheck

HEALTHCHECK CMD ["docker-healthcheck"]
