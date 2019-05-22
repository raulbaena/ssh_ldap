#! /bin/bash
# @edt ASIX M06 2018-2019
# Usuaris locals
cp /opt/docker/ldap.conf /etc/openldap/ldap.conf
cp /opt/docker/nsswitch.conf /etc/nsswitch.conf
cp /opt/docker/nslcd.conf /etc/nslcd.conf
cp /opt/docker/system-auth /etc/pam.d/system-auth
cp /opt/docker/sshd /etc/pam.d/sshd
cp /opt/docker/sshd_config /etc/ssh/sshd_config
cp /opt/docker/access.conf	/etc/security/access.conf
cp /opt/docker/pam_mount.conf.xml /etc/security/pam_mount.conf.xml
groupadd localgrp01
groupadd localgrp02
useradd -g users -G localgrp01 local01
useradd -g users -G localgrp01 local02
useradd -g users -G localgrp01 local03
useradd -g users -G localgrp02 local04
useradd -g users -G localgrp02 local05
useradd -g users -G localgrp02 local06
echo "local01" | passwd --stdin local01
echo "local02" | passwd --stdin local02
echo "local03" | passwd --stdin local03
echo "local04" | passwd --stdin local04
echo "local05" | passwd --stdin local05
echo "local06" | passwd --stdin local06
ssh-keygen -A
