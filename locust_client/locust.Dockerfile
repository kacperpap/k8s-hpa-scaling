FROM python:3.6-alpine

ARG LOCUST_FILE
ARG ATTACKED_HOST
ARG USERS
ARG SPAWN_RATE
ARG RUN_TIME


COPY docker-entrypoint.sh /

RUN    apk --no-cache add --virtual=.build-dep build-base \
    && apk --no-cache add libzmq \
    && pip install --no-cache-dir locustio==0.8.1 \
    && apk del .build-dep \
    && chmod +x /docker-entrypoint.sh

VOLUME /locust

WORKDIR /locust

EXPOSE 8089

ENTRYPOINT ["locust", "-f", "${LOCUST_FILE}", "--host=${ATTACKED_HOST}", "--no-restart-stats", "--headless", "--users", "${USERS}", "--spawn-rate", "${SPAWN_RATE}", "--run-time", "${RUN_TIME}}"]

#build this container as:
#docker build --tag <name> --build-arg LOCUST_FILE=<name_of_locustfile_that_is_in_binded_to_locust_directory> --build-arg ATTACKED_HOST=<target_host_ip:port> --build-arg USERS=<number_of_users> --build-arg SPAWN_RATE=<spwan_rate> --build-arg RUN_TIME=<run_time> -v <absolute_path_to_locust_dir>:/locust -p 8089:8089 -f <path_to_dockerfile> .