# PRACTICA LDAP AMB SSH

## ARQUITECTURA

Disposem de un servidor ldap en el qual es connectará amb un servidor ssh mitjancant PAM. A aquest servidor ssh es connectara un hostpam que autenticara usuaris de ldap i usuaris locals de aquest servidor. Aquests servidors estaran dintre d'una intranet anomenada sshnet.

sshnet --> Xarxa local per la qual es comuniquen els equips informatics.

raulbaena/ssh:server --> Servidor ssh que permet l'inici de sessio d'usuaris ldap i locals d'aquesta maquina. Aquesta maquina es comunica amb el servidor ldap mitjansant PAM.

raulbaena/ssh:ldapserver --> Servidor ldap que proveira usuaris per connectarse per ssh

raulbaena/ssh:hostpam --> Host que permet l'autenticacio ssh de usuaris ldap i usuaris locals


## Implementació

En aquest disposem de tres maquines que he explicat anteriorment, les quals enxegarem i explicare la implementació que hem de fer per el seu funcionament. Hem de ser capasos de connectarnos per ssh amb els usuaris de ldap pere y pau. Per comneçar crearem la xarxa on estarán les maquines amb la següent comanda:
```
docker network create sshnet
```
Un cop tinguem la xarxa creada entxegarem el nostre servidor ldap.
```
docker run --rm --name ldap -h ldap --network sshnet -d raulbaena/shh:ldapserver 
```
Ja el nostre servidor ldap entxegat posem en marxa el nostre servidor ssh
```
docker run --rm --name ssh -h ssh --network sshnet -it raulbaena/shh:server 
```
Ara comprovem que el nostre servidor ssh tingui comunicacio amb el nostre servidor ldap. Ho farem mitjansant l'ordre:
```
[root@ssh docker]# getent passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
systemd-coredump:x:999:998:systemd Core Dumper:/:/sbin/nologin
systemd-timesync:x:998:997:systemd Time Synchronization:/:/sbin/nologin
systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
systemd-resolve:x:193:193:systemd Resolver:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
tss:x:59:59:Account used by the trousers package to sandbox the tcsd daemon:/dev/null:/sbin/nologin
nscd:x:28:28:NSCD Daemon:/:/sbin/nologin
nslcd:x:65:55:LDAP Client User:/:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
pere:x:1000:100::/home/pere:/bin/bash
raul:x:1001:100::/home/raul:/bin/bash
dani:x:1002:100::/home/dani:/bin/bash
marta:x:1003:100::/home/marta:/bin/bash
trump:x:1004:1001::/home/trump:/bin/bash
puig:x:1005:1001::/home/puig:/bin/bash
rajoy:x:1006:1001::/home/rajoy:/bin/bash
pau:*:5000:100:Pau Pou:/tmp/home/pau:
pere:*:5001:100:Pere Pou:/tmp/home/pere:
anna:*:5002:600:Anna Pou:/tmp/home/anna:
marta:*:5003:600:Marta Mas:/tmp/home/marta:
jordi:*:5004:100:Jordi Mas:/tmp/home/jordi:
admin:*:10:10:Administrador Sistema:/tmp/home/admin:
user01:*:7001:610:user01:/tmp/home/1asix/user01:
user02:*:7002:610:user02:/tmp/home/1asix/user02:
user02:*:7003:610:user03:/tmp/home/1asix/user03:
user04:*:7004:610:user04:/tmp/home/1asix/user04:
user05:*:7005:610:user05:/tmp/home/1asix/user05:
user06:*:7006:611:user06:/tmp/home/2asix/user06:
user07:*:7007:611:user07:/tmp/home/2asix/user07:
user08:*:7008:611:user08:/tmp/home/2asix/user08:
user09:*:7009:611:user09:/tmp/home/2asix/user09:
user10:*:7010:611:user10:/tmp/home/2asix/user10:
mao:*:11001:650:mao tse tung:/tmp/home/1wiaw/mao:
ho:*:11002:650:ho chi minh:/tmp/home/1wiaw/ho:
hiro:*:11003:650:hirohito:/tmp/home/1wiaw/hiro:
nelson:*:11004:650:nelson mandela:/tmp/home/1wiaw/nelson:
robert:*:11005:650:robert mugabe:/tmp/home/1wiaw/robert:
ali:*:11006:650:ali bey:/tmp/home/1wiaw/ali:
konrad:*:11007:651:konrad adenauer:/tmp/home/2wiaw/konrad:
humphrey:*:11008:651:humpprey appleby:/tmp/home/2wiaw/humphrey:
carles:*:11009:651:carles puigdemon:/tmp/home/2wiaw/jordi:
francisco:*:11010:651:francisco franco bahamonde:/tmp/home/2wiaw/fracisco:
vladimir:*:11011:651:vladimir putin:/tmp/home/2wiaw/vladimir:
jorge:*:11012:651:jorge mario bergoglio:/tmp/home/2wiaw/jorge:
```
Ja tenim comunicació entre els nostres servidors

Ara entxegarem el nostre client amb la seguent comanda
```
docker run --rm --name host -h host --network sshnet -it raulbaena/shh:hostpam 
```
Ja tindrem tota la nostra petita infraestructura preparada.

## Troubleshooting usuaris locals i ldap

Ara farem les proves d'autenticacio hem de ser capasos de connectarnos amb l'usuari de ldap pere i amb l'usuari local local02.
Comensarem connectantnos amb el usuari local02. Per fer-ho farem la seguent comanda:
```
[root@host docker]# ssh local02@ssh -p 1022
The authenticity of host '[ssh]:1022 ([172.18.0.3]:1022)' can't be established.
RSA key fingerprint is SHA256:BdZShkLxAXeVFBKrs7WSigXS0MKoq0JztCh6wj56p0w.
RSA key fingerprint is MD5:87:a9:d7:55:50:40:4e:7a:92:e2:8a:d5:1b:9f:c3:b1.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[ssh]:1022,[172.18.0.3]:1022' (RSA) to the list of known hosts.
local02@ssh's password: 
[local02@ssh ~]$ 
```
Com podem comprovar l'autentacio ha sigut tot un exit. 

Ara farem la prova amb el famos usuari pere, farem la seguent comanda:
```
[root@host docker]# ssh pere@ssh -p 1022
The authenticity of host '[ssh]:1022 ([172.18.0.3]:1022)' can't be established.
RSA key fingerprint is SHA256:k4R6xupB7yWU5Tp6vqyjgi5bz6+8By3Na/ZpPSlYQlI.
RSA key fingerprint is MD5:32:c4:3c:a2:7f:60:95:77:e9:4a:d9:5d:c0:c6:19:68.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[ssh]:1022,[172.18.0.3]:1022' (RSA) to the list of known hosts.
Password: 
[pere@ssh ~]$ 
```
Com podem veure s'autenticat l'usuari pere.

## Execucio
```
docker network create sshnet
docker run --rm --name ldap -h ldap --network sshnet -d raulbaena/shh:ldapserver 
docker run --rm --name ssh -h ssh --network sshnet -it raulbaena/shh:server 
docker run --rm --name host -h host --network sshnet -it raulbaena/shh:hostpam
```





