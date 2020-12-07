FROM ubuntu

COPY docker/init.sh /init.sh
COPY docker/healthcheck.sh /healthcheck.sh
COPY docker/healthchecker-runner.sh /healthchecker-runner.sh
RUN chmod a+x /healthcheck.sh /healthchecker-runner.sh /init.sh

HEALTHCHECK --interval=10s CMD /healthchecker-runner.sh

CMD bash -c 'set -x; set +e; while true; do cat /test.txt; sleep 3; done'
