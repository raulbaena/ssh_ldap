# PAM
## @edt ASIX M06-ASO Curs 2018-2019

raulbaena/sshd2:host --> Host per conectarnos al servidor ssh i amb connexió al servidor ldap

docker run --privileged --rm -h host --name host --network sshnet -it raulbaena/sshd2:host 
