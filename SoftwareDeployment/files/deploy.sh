#!/bin/sh
#

echo "Hello $firstname $lastname"

echo "Writing to /tmp/demo"
echo "Hello $firstname $lastname" > /tmp/demo
echo -n "The file /tmp/demo contains `cat /tmp/demo` for server $deploy_server_id during $deploy_action" > $heat_outputs_path.result
echo "Written to /tmp/demo"
echo "Output to stderr" 1>&2
