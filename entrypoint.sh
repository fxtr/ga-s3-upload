#!/bin/sh -l
set -e
set -o xtrace

export BRANCH_NAME="${GITHUB_REF#refs/heads/}"
export DEV_VERSION="$BRANCH_NAME-$(date +'%Y%m%d%H%M')"

if [[ "$BRANCH_NAME" =~ ^[a-zA-Z0-9]\.[a-zA-Z0-9]\.[a-zA-Z0-9]$ ]]; then
  export RELEASE_VERSION="$BRANCH_NAME"
else
  export RELEASE_VERSION="$DEV_VERSION"
fi

echo $RELEASE_VERSION

aws s3 cp --acl private $TARGET s3://$BUCKET_NAME/$BUCKET_PATH/$RELEASE_VERSION/