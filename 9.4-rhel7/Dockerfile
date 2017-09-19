FROM registry.access.redhat.com/rhscl/postgresql-94-rhel7:latest

ENV PG_LOG_PATH=/var/lib/pgsql/data/userdata/pg_log
ENV LOG_PREFIX=postgresql
ENV LOG_EXT=log
ENV LOG_MON=${PG_LOG_PATH}/${LOG_PREFIX}-Mon.${LOG_EXT}
ENV LOG_TUE=${PG_LOG_PATH}/${LOG_PREFIX}-Tue.${LOG_EXT}
ENV LOG_WED=${PG_LOG_PATH}/${LOG_PREFIX}-Wed.${LOG_EXT}
ENV LOG_THU=${PG_LOG_PATH}/${LOG_PREFIX}-Thu.${LOG_EXT}
ENV LOG_FRI=${PG_LOG_PATH}/${LOG_PREFIX}-Fri.${LOG_EXT}
ENV LOG_SAT=${PG_LOG_PATH}/${LOG_PREFIX}-Sat.${LOG_EXT}
ENV LOG_SUN=${PG_LOG_PATH}/${LOG_PREFIX}-Sun.${LOG_EXT}

ENV EXPORT_LOG=true
USER root
COPY run-postgresql-extension /usr/bin/run-postgresql-extension

RUN \
	sed -i '1 r /usr/bin/run-postgresql-extension' /usr/bin/run-postgresql

USER 26