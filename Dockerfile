FROM ubuntu:14.04
MAINTAINER Piotr Radkowski <piotr.radkowski@uj.edu.pl>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

# Install ansible
RUN apt-get update && \
	apt-get install -y software-properties-common curl && \
	apt-add-repository -y ppa:ansible/ansible && \
	apt-get update && \
	apt-get install -y ansible

# Setup ansible roles
ENV ANSIBLE_HOME /etc/ansible
RUN mkdir -p ${ANSIBLE_HOME}/roles/nuada.dockerize; \
	curl --location https://github.com/nuada/ansible-dockerize/archive/master.tar.gz | \
	tar xz -C ${ANSIBLE_HOME}/roles/nuada.dockerize --strip 1

# Playbook
ADD site.yml ${ANSIBLE_HOME}/site.yml
ADD slurm.conf.j2 ${ANSIBLE_HOME}/slurm.conf.j2
RUN ansible-playbook ${ANSIBLE_HOME}/site.yml

ADD update-gemini-data /usr/bin/update-gemini-data

ENV HOME /home/omicron
WORKDIR ${HOME}
USER omicron

# Expose RStudio Server
EXPOSE 8787

# Run RStudio Server
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-app-armor-enabled=0", "--server-daemonize=0"]

