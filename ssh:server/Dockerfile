#version: 0.0.1
#Raul Baena Nocea@edt M06 2018-2019
#Servidor ssh
#----------------------
FROM fedora:27
LABEL author="Raul BAena Nocea@edt ASIX M06 Curs 2018-2019"
LABEL description=" Servidor SSH Raul Baena@edt.org "
RUN dnf -y install procps vim less tree nmap mlocate iproute openldap-clients nss-pam-ldapd passwd authconfig openssh-server 
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
CMD ["/opt/docker/startup.sh"]
WORKDIR /opt/docker

