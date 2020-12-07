#/usr/bin/env sh

set -e

FIRST_READY_STATUS_FLAG='/tmp/.FIRST_READY_STATUS_FLAG'

# Health check
/healthcheck.sh

# On success
if [ ! -f "${FIRST_READY_STATUS_FLAG}" ]; then
  # On first success...
  touch "${FIRST_READY_STATUS_FLAG}"

  # Run DOCKER_ON_READY on first health check ok
  if [ ! -z "${DOCKER_ON_READY}" ]; then
    eval "${DOCKER_ON_READY}"
  fi
fi
