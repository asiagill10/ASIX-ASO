# Activitat: del disseny a l’arquitectura d’AD DS

# Context

MusicCloud ja ha completat el disseny lògic del seu servei de directori.

Abans d’instal·lar Active Directory Domain Services, cal comprovar que l’alumnat identifica correctament els components que s’hauran d’implantar.

# Identificació dels components

A partir de l’arquitectura prevista, indiqueu:

1.  Quin serà el nom del bosc.
    > musiccloud.local
2.  Quin serà el nom del domini.
    > musiccloud.local
3.  Quin servidor actuarà com a controlador de domini.
    > SRV-AD-01
4.  Quin servidor proporcionarà DNS.
    > SRV-AD-01
5.  Quin protocol s’utilitzarà principalment per a l’autenticació.
    > Kerberos
6.  Quin protocol permetrà consultar els objectes.
    > LDAP
7.  Quin servei de Windows emmagatzema i administra els objectes del domini?
    > Active Directory Domain Service (AD DS)

# Anàlisi de l’arquitectura

Responeu breument:

1.  Per què el servidor `SRV-AD-01` necessita una adreça IP fixa?
    > Perquè els clients han de poder localitzar sempre el controlador de domini i el servidor DNS a la mateixa adreça IP.
2.  Per què els clients del domini han d’utilitzar un servidor DNS capaç de resoldre la zona d’Active Directory?
    > Perquè necessiten localitzar el controlador de domini i els serveis d'AD DS per autenticar-se i accedir als recursos del domini.
3.  Què passaria si `SRV-AD-01` estigués apagat?
    > Els clients no podrien contactar amb aquest controlador de domini per autenticar-se ni accedir als serveis que depenen d'ell. Algunes sessions ja iniciades podrien continuar funcionant amb credencials emmagatzemades a la memòria cache, però no hi hauria disponibilitat del controlador mentre estigués apagat.
4.  Per què un únic controlador de domini és acceptable al laboratori però insuficient en una empresa real?
    > Al laboratori és suficient per practicar i simplificar la configuració. En una empresa real, un únic controlador és un punt únic de fallada. Un segon controlador permetria mantenir el servei disponible si el primer falla.
5.  Per què els departaments no s’han creat com a dominis diferents?
    > Perquè els departaments formen part de la mateixa empresa i poden gestionar-se dins d'un únic domini mitjançant unitats organitzatives (OU) i grups. Això simplifica l'administració i la gestió dels permisos.

# Planificació de la implantació

Ordeneu les accions següents:

- crear els usuaris.

- comprovar el DNS.

- assignar els usuaris als grups.

- instal·lar AD DS.

- crear les unitats organitzatives.

- preparar la xarxa del servidor.

- unir el client al domini.

- crear el bosc i el domini.

- crear els grups.

- comprovar el funcionament del domini.

Justifiqueu breument l’ordre escollit.

1. Preparar la xarxa del servidor.
2. Instal·lar AD DS.
3. Crear el bosc i el domini.
4. Comprovar el DNS.
5. Crear les unitats organitzatives.
6. Crear els grups.
7. Crear els usuaris.
8. Assignar els usuaris als grups.
9. Unir el client al domini.
10. Comprovar el funcionament del domini.

**Justificació**

> Primer es prepara la xarxa del servidor perquè tingui una configuració estable. Després s'instal·la AD DS i es crea el bosc i el domini. A continuació, es comprova que el DNS funcioni correctament, ja que és necessari per localitzar els serveis del domini. Un cop el domini està operatiu, es creen les unitats organitzatives, els grups i els usuaris. Després s'assignen els usuaris als grups corresponents i s'uneix el client al domini. Finalment, es comprova que l'autenticació i l'accés als serveis funcionin correctament.
