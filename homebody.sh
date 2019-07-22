#!/bin/bash

generate_post_data() {
  cat <<EOF 
  {
    {
      "notifications_enabled": true
    }
    {
      "$schema": "http://json-schema.org/draft-04/schema#",
      "type": "object",
      "properties": {
        "notifications_enabled": {
          "type": "boolean"
        }
      },
      "required": [
        "notifications_enabled"
      ]
    } 
  }
EOF
}

curl -i \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST --data "$(generate_post_data)" "192.168.1.8:8080"

