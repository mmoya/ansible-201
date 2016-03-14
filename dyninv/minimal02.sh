#!/bin/sh

cat <<EOT
{
    "_meta": {
        "hostvars": {}
    },
    "group1": [
        "host1-1"
    ],
    "group2": [
        "host2-1",
        "host2-2"
    ]
}
EOT
