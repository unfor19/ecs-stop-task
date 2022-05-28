FROM unfor19/alpine-ci:awscli-latest-aef23938
WORKDIR /code
COPY . .
ENTRYPOINT [ "bash", "main.sh" ]
