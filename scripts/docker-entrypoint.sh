#!/bin/sh
set -e
# Run the migration first using the custom release task
/opt/scm/bin/scm eval "SCM.ReleaseTasks.migrate"
# Launch the OTP release and replace the caller as Process #1 in the container
exec /opt/scm/bin/scm "$@"
