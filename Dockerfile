# Container image that runs your code
FROM gittools/gitversion:5.1.3-linux-ubuntu-18.04-netcoreapp2.1

RUN apt-get -y update
RUN apt-get -y install jq

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]