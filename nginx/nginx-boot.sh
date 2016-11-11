#!/bin/bash

# Cleanup current configuration
for source in /etc/nginx/sites-enabled/* ; do
    rm -f $source
done

# Apply variables to existing files
for source in /etc/nginx/sites-enabled-templates/* ; do
    target="/etc/nginx/sites-enabled/$(basename $source)"

    # need to preserve all the valid config variables in nginx!!!
    host="\$host" \
    remote_addr="\$remote_addr" \
    proxy_add_x_forwarded_for="\$proxy_add_x_forwarded_for" \
    scheme="\$scheme" \
    envsubst < $source > $target
done

# Debug stuff
# for source in /etc/nginx/sites-enabled/* ; do
#     echo "=== $source"
#     cat $source
# done

# Finally start nginx
nginx -g 'daemon off;'
