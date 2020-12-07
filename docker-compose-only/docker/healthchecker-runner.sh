#/usr/bin/env sh

set -e

FIRST_READY_STATUS_FLAG='/tmp/.FIRST_READY_STATUS_FLAG'

# Health check
/healthcheck.sh

# On success
if [ ! -f "${FIRST_READY_STATUS_FLAG}" ]; then
  # On first success...
  touch "${FIRST_READY_STATUS_FLAG}"

  # Run on first health check ok
  /init.sh
fi
