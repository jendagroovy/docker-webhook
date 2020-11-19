FROM almir/webhook:latest
RUN apk add docker && \
    apk add gettext

ENTRYPOINT []
CMD echo 'Rendering hooks config file' && \
    set -o allexport && \
    source $ENVFILE && \
    set +o allexport && \
    envsubst < /etc/webhook/hooks.json.template > /etc/webhook/hooks.json && \
    echo 'Done, starting daemon' && \
    /usr/local/bin/webhook -logfile /dev/stdout

