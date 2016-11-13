FROM postgres:9.6

ENV POSTGRES_USER pumgrana
ENV POSTGRES_PASSWORD pumgrana
ENV POSTGRES_DB pumgrana

RUN mkdir -p /docker-entrypoint-initdb.d/
ADD init.sql /docker-entrypoint-initdb.d/init.sql

RUN mkdir -p /var/lib/postgresql/data

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf

# And add ``listen_addresses`` to ``/var/lib/postgresql/data/postgresql.conf``
RUN echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf
