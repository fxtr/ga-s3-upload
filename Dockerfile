FROM alpine:3.10.1

ENV GITHUB_REF=''
ENV BUCKET_NAME=''
ENV BUCKET_PATH=''
ENV TARGET=''

RUN apk -v --update add \
    python \
    py-pip \
    && \
  pip install --upgrade awscli && \
  apk -v --purge del py-pip && \
  rm /var/cache/apk/*

RUN apk add zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]