FROM ubuntu:noble

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y vim adduser

# copy exercise setups
COPY ./setups /setups
COPY ./setup.sh /setup.sh
# set-up bandit exercises
RUN bash /setup.sh
# for me :)
RUN echo "root:toor" | chpasswd

EXPOSE 2220
CMD ["/usr/sbin/sshd", "-D"]
