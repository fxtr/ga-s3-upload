FROM alpine:3.16.0

ENV AWS_ACCESS_KEY_ID=''
ENV AWS_SECRET_ACCESS_KEY=''
ENV AWS_DEFAULT_REGION=''

ENV GITHUB_REF=''
ENV BUCKET_NAME=''
ENV BUCKET_PATH=''
ENV NO_RELEASE_PATH=false
ENV TARGET=''
ENV TARGET_DIR=''
ENV SYNC_OPTIONS=''

RUN apk -v --update add \
    python3 \
    py3-pip \
    && \
  pip3 install awscli==1.29.9 && \
  apk -v --purge del py3-pip && \
  rm /var/cache/apk/*

RUN apk add zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]