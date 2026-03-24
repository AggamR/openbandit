FROM alpine:latest

RUN apk add --no-cache openssh bash

# copy exercise setups
COPY ./setups /setups
# set-up bandit exercises
RUN cat /setups/* | bash

EXPOSE 2220
CMD ["/usr/sbin/sshd", "-D"]