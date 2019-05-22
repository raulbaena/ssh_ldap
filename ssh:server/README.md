# Servidor SSH

## Descripcio 

raulbaena/ssh:server --> Servidor ssh que permet l'inici de sessio d'usuaris ldap i locals d'aquesta maquina. Aquesta maquina es comunica amb el servidor ldap mitjansant PAM.

## Configuracio

access.conf --> Fitxer on podem permetre'ns o denegar l'accés a usuaris o grups específics des d'orígens específics.

ldap.conf --> Aquest és l'arxiu de configuració per a totes les aplicacions client que fan servir les biblioteques OpenLDAP com ara ldapsearch, ldapadd, Sendmail, Pine, Bassa, Evolution, i Gnome Meeting.

nslcd.conf -->Arxiu on es configura el servei nslcd que li permet configurar el vostre sistema local per carregar usuaris i grups des d'un directori LDAP, com Active Directory (AD).

nsswitch.conf --> El fitxer de configuració Linux nsswitch.conf controla com funciona la resolució de noms quan es busquen diversos tipus d'objectes, com ara adreces i contrasenyes de host

sshd --> Fitxer de congfiguracio de sshd PAM per autenticacio amb usuaris ldap

sshd_config --> Fitxer de configuracio del servei ssh

userdeny --> Fitxer on es posen els usuaris que no tenen acces ssh

## Execucio de la maquina 

Per executar la maquina fes la seguent ordre:

```
docker run --rm --name ssh -h ssh --network sshnet -it raulbaena/shh:server 
```
