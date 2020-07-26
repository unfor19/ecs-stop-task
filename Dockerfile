FROM amazon/aws-cli:2.0.34
RUN yum update -y && \
    yum install -y jq util-linux-ng && \
    yum clean all && \
    rm -rf /var/cache/yum
WORKDIR /code
COPY . .
ENTRYPOINT [ "bash", "main.sh" ]
