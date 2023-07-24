FROM alpine:3.10.1

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
    python \
    py-pip \
    && \
  pip install awscli==1.19.112 && \
  apk -v --purge del py-pip && \
  rm /var/cache/apk/*

RUN apk add zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]