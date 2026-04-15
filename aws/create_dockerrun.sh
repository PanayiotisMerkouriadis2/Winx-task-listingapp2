#!/bin/bash

set -e

IMAGE_TAG="latest"

cat <<EOF > Dockerrun.aws.json
{
  "AWSEBDockerrunVersion": "1",
  "Image": {
    "Name": "${CONTAINER_REGISTRY_URL}:${IMAGE_TAG}",
    "Update": "true"
  },
  "Ports": [
    {
      "ContainerPort": 80
    }
  ]
}
EOF

echo "Created Dockerrun.aws.json"
ls -la
cat Dockerrun.aws.json