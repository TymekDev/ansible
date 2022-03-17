FROM ubuntu:focal AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    apt-get install -y ansible && \
    ansible-galaxy collection install community.general


FROM base
COPY . .
CMD [ "sh", "-c", "ansible-playbook local.yml" ]
