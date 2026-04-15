#!/bin/bash

cat <<EOF > Dockerrun.aws.json
{
  "AWSEBDockerrunVersion": "1",
  "Image": {
    "Name": "$CONTAINER_REGISTRY_URL/$CONTAINER_REPOSITORY_NAME:$GITHUB_SHA",
    "Update": "true"
  },
  "Ports": [
    {
      "ContainerPort": "80"
    }
  ]
}
EOF

echo "Created Dockerrun file"
ls -la
cat Dockerrun.aws.json

echo "Uploading to S3"
aws s3 cp Dockerrun.aws.json "s3://$S3_DEPLOY_BUCKET/"