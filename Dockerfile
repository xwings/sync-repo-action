FROM alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash grep git openssh-client && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
