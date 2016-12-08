FROM elasticsearch:2.4

ENV ES_HEAP_SIZE=2g

RUN bin/plugin install mobz/elasticsearch-head

ADD docker-entrypoint-custom.sh /docker-entrypoint-custom.sh
ADD launcher.sh /launcher.sh
ADD init.sh /init.sh
ADD schema.json /schema.json

ENTRYPOINT ["/docker-entrypoint-custom.sh"]
CMD ["elasticsearch"]