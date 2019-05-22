#! /bin/bash
# @edt ASIX M06 2018-2019
# instal·lacio 
# - crear usuaris locals
# -------------------------------------------
groupadd gexamen
useradd -g users -G gexamen examen01
useradd -g users -G gexamen examen02
useradd -g users -G gexamen examen03
echo "examen01" | passwd --stdin examen01
echo "examen02" | passwd --stdin examen02
echo "examen03" | passwd --stdin examen03
