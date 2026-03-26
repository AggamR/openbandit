FROM alpine:latest

RUN apk add --no-cache openssh bash vim

# copy exercise setups
COPY ./setups /setups
COPY ./setup.sh /setup.sh
# set-up bandit exercises
RUN bash /setup.sh
# for me :)
RUN echo "root:toor" | chpasswd

EXPOSE 2220
CMD ["/usr/sbin/sshd", "-D"]
