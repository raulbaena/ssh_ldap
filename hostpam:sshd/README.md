# Host PAM
## Descripcio

raulbaena/ssh:hostpam --> Host que permet l'autenticacio ssh de usuaris ldap i usuaris locals. Aquest client es comunic amb el servidor ssh i amb el servidor ldap

## Configuracio 

ldap.conf --> Aquest és l'arxiu de configuració per a totes les aplicacions client que fan servir les biblioteques OpenLDAP com ara ldapsearch, ldapadd, Sendmail, Pine, Bassa, Evolution, i Gnome Meeting.

nslcd.conf -->Arxiu on es configura el servei nslcd que li permet configurar el vostre sistema local per carregar usuaris i grups des d'un directori LDAP, com Active Directory (AD).

nsswitch.conf --> El fitxer de configuració Linux nsswitch.conf controla com funciona la resolució de noms quan es busquen diversos tipus d'objectes, com ara adreces i contrasenyes de host

system-auth -- FItxer de configuracio PAM que permet l'autenticacio d'usuaris ldap y usuaris locals del servidor ssh.

## Execucio 

Per executar la maquina has de fer la seguent comanda
```
docker run --rm --name host -h host --network sshnet -it raulbaena/shh:hostpam
```

Descarregar la maquina:

```
docker pull raulbaena/ssh:hostpam
```
