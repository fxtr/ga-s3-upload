#!/bin/sh -l
set -e
set -o xtrace

if [ "$NO_RELEASE_PATH" = true ] ; then
  aws s3 cp --acl private $TARGET s3://$BUCKET_NAME/$BUCKET_PATH/
elif [ ! -z "$TARGET_DIR" ] ; then
  aws s3 sync $TARGET_DIR s3://$BUCKET_NAME/$BUCKET_PATH/ --delete --acl private
else
  BRANCH_NAME="${GITHUB_REF#refs/heads/}"
  DEV_VERSION="$BRANCH_NAME-$(date +'%Y%m%d%H%M')"

  if [[ "$BRANCH_NAME" =~ ^[a-zA-Z0-9]\.[a-zA-Z0-9]\.[a-zA-Z0-9]$ ]]; then
    RELEASE_VERSION="$BRANCH_NAME"
  else
    RELEASE_VERSION="$DEV_VERSION"
  fi

  echo $RELEASE_VERSION

  aws s3 cp --acl private $TARGET s3://$BUCKET_NAME/$BUCKET_PATH/$RELEASE_VERSION/
fi