FROM postgres:9.6

ENV POSTGRES_USER pumgrana
ENV POSTGRES_PASSWORD pumgrana
ENV POSTGRES_DB pumgrana

ADD init.sql /docker-entrypoint-initdb.d/init.sql
