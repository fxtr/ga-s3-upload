#!/bin/sh -l
set -e
set -o xtrace

if [ "$NO_RELEASE_PATH" = true ] ; then
  aws s3 cp --acl private $TARGET s3://$BUCKET_NAME/$BUCKET_PATH/
elif [ ! -z "$TARGET_DIR" ] ; then
  S3Path="s3://${BUCKET_NAME}/"
  if [ ! -z "$BUCKET_PATH" ] ; then
    S3Path=$S3Path$BUCKET_PATH/
  fi
  aws s3 sync $TARGET_DIR $S3Path --delete --acl private $SYNC_OPTIONS
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
