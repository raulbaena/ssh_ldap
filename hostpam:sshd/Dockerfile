# Version: 0.0.1
# edt M06 2018-2019
# Client ssh
#-------------------------------------------------
FROM fedora:27
LABEL author="@edt ASIX M06 2018-2019"
LABEL description="Client ssh PAM 2018-2019"
RUN dnf -y install procps vim passwd openldap-clients nss-pam-ldapd pam_mount openssh-clients
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/*.sh
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
