# Fitxa 2 — Organització del servei de directori de MusicCloud

## Objectiu

En aquesta sessió hem decidit com organitzar els diferents objectes de MusicCloud dins d'un servei de directori.

Aquesta fitxa forma part de la **documentació de disseny del sistema**. Les decisions que hi indiquis s'utilitzaran posteriorment durant la implantació.

# 1. Objectes que hem de gestionar

MusicCloud necessita gestionar de manera centralitzada diferents tipus d'objectes.

Indica quins tipus d'objectes consideres que ha de contenir el servei de directori.

| Tipus d'objecte                 | Exemples a MusicCloud                                                                                          |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Usuaris                         | Comptes dels treballadors (com Dídac Gassó o Laia Macias,) i usuaris externs (com Pere Espinalt o Neus Bages). |
| Grups                           | Grups de departaments, responsables, administradors i projectes.                                               |
| Equips                          | Ordinadors dels treballadors i altres equips clients de l'empresa.                                             |
| Servidors                       | Servidors que proporcionen els diferents serveis de MusicCloud.                                                |
| Comptes d'aplicacions o serveis | Comptes utilitzats per aplicacions o serveis que necessiten autenticar-se al directori.                        |

Hi afegiries algun altre tipus d'objecte?

- Sí. També es podrien gestionar altres recursos, com ara impressores o altres dispositius de xarxa, si més endavant MusicCloud ho necessita.

---

# 2. Organització mitjançant unitats organitzatives

Proposa les **unitats organitzatives (OU)** principals que utilitzaries a MusicCloud.

| OU        | Què contindrà?                              | Per què la crees?                                                              |
| --------- | ------------------------------------------- | ------------------------------------------------------------------------------ |
| Usuaris   | Comptes dels treballadors i usuaris externs | Per organitzar els comptes dels usuaris de l'empresa.                          |
| Grups     | Grups de seguretat i altres grups           | Per mantenir organitzats els grups utilitzats per gestionar els permisos.      |
| Equips    | Ordinadors clients de MusicCloud            | Per gestionar i organitzar els equips de l'empresa.                            |
| Servidors | Comptes dels servidors                      | Per separar els servidors dels equips clients i facilitar-ne l'administració.  |
| Serveis   | Comptes d'aplicacions i serveis             | Per organitzar els comptes utilitzats pels serveis i aplicacions de l'empresa. |

## 2.1. Organització dels usuaris

Dibuixa l'estructura que utilitzaries per organitzar els usuaris de MusicCloud.

```text
MusicCloud
│
└── Usuaris
    ├── Direccio
    │   ├── Aina Ciurans
    │   └── Rut Tornils
    │
    ├── Administracio
    │   ├── Dídac Gassó
    │   └── Laia Macias
    │
    ├── SuportTecnic
    │   ├── Estel Birosta
    │   ├── Aina Zuriguel
    │   └── Lluïsa Richart
    │
    ├── ProduccioMusical
    │   ├── Roser Alberch
    │   ├── Guillem Adella
    │   ├── Meritxell Reglat
    │   ├── Alícia Monclús
    │   ├── Carles Molins
    │   └── Eulàlia Galcera
    │
    ├── Informatica
    │   ├── Talia Costas
    │   └── Alex Soriano
    │
    └── Externs
        ├── Pere Espinalt
        └── Neus Bages
```

---

# 3. OU o grup?

Indica quina opció utilitzaries principalment en cada cas.

| Necessitat                                                | OU  | Grup |
| --------------------------------------------------------- | :-: | :--: |
| Organitzar els treballadors d'Administració               |  X  |  ☐   |
| Donar accés a la carpeta d'Administració                  |  ☐  |  X   |
| Organitzar els ordinadors clients                         |  X  |  ☐   |
| Identificar les persones que participen en Campanya Estiu |  ☐  |  X   |
| Organitzar els servidors                                  |  X  |  ☐   |
| Donar privilegis als administradors del sistema           |  ☐  |  X   |
| Organitzar els comptes utilitzats per aplicacions         |  X  |  ☐   |

### Explica amb les teves paraules la diferència principal entre una OU i un grup.

**OU:**

- Una OU serveix principalment per organitzar objectes dins del directori, com usuaris, equips o servidors. També permet aplicar determinades configuracions i polítiques als objectes que conté. En general, la seva estructura és més estàtica, ja que s'utilitza per representar una organització estable, com els diferents departaments de l'empresa.

**Grup:**

- Un grup serveix principalment per agrupar usuaris o altres objectes que comparteixen unes mateixes necessitats, especialment per facilitar l'assignació de permisos i privilegis. La seva composició és més dinàmica, ja que els membres poden canviar segons les funcions, els projectes o els permisos que necessitin.

Per exemple, un usuari pot estar situat a l'OU d'_Administració_ perquè pertany a aquest departament, però al mateix temps formar part dels grups _Administracio_, _Responsables_ o _Projecte_Campanya_Estiu_ segons les seves funcions i necessitats d'accés.

# 4. Un mateix usuari: ubicació i pertinença

Considera aquest cas:

**Dídac Gassó**

- treballa a Administració;
- participa en el projecte Campanya Estiu.

Indica:

**En quina OU ubicaries el seu compte?**

- Ubicaria el compte de Dídac a l'OU corresponent al seu departament:

```text
MusicCloud
└── Usuaris
    └── Administracio
        └── Dídac Gassó
```

**A quins grups podria pertànyer?**

Dídac podria pertànyer, com a mínim, als grups:

- `Administracio`
- `Projecte_Campanya_Estiu`

Aquests grups li permetrien obtenir els permisos corresponents al seu departament i al projecte en què participa.

### Per què no és contradictori que estigui en una OU però pertanyi a diversos grups?

- No és contradictori perquè l'**OU i els grups tenen funcions diferents**. L'OU indica com està organitzat el compte dins del directori, mentre que els grups permeten agrupar l'usuari segons les seves necessitats d'accés.

Per tant, Dídac pot estar ubicat a l'OU **Administracio** i, al mateix temps, pertànyer a diversos grups.

# 5. Servei de directori

Explica breument què entens per **servei de directori**.

- Un servei de directori és un sistema que permet emmagatzemar i gestionar de manera centralitzada informació sobre els usuaris, grups, equips, servidors i altres objectes d'una organització.

Quin problema resol a MusicCloud?

- A MusicCloud permet centralitzar la gestió dels usuaris i dels recursos informàtics. D'aquesta manera, es poden administrar els comptes, grups i accessos des d'un mateix sistema, en lloc de gestionar-los individualment a cada equip.

# 6. LDAP

Completa les frases següents.

**LDAP és:**

- Un protocol que permet accedir, consultar i gestionar informació emmagatzemada en un servei de directori.

**LDAP no és:**

- Un servei de directori concret ni és sinònim d'Active Directory. És un protocol que pot ser utilitzat per diferents serveis de directori.

Indica si les afirmacions són certes o falses.

| Afirmació                                                 |  C  |  F  |
| --------------------------------------------------------- | :-: | :-: |
| LDAP és sinònim d'Active Directory                        |  ☐  |  X  |
| LDAP permet accedir i consultar informació d'un directori |  X  |  ☐  |
| OpenLDAP és una implementació d'un servei de directori    |  X  |  ☐  |
| Active Directory utilitza LDAP, entre altres tecnologies  |  X  |  ☐  |

---

# 7. DIT de MusicCloud

Dibuixa la proposta final de **Directory Information Tree (DIT)** de MusicCloud.

Ha de mostrar, com a mínim:

- usuaris;
- grups;
- equips;
- servidors;
- comptes d'aplicacions o serveis;
- les subdivisions que consideris necessàries.

```text
MusicCloud
│
├── Usuaris
│   ├── Direccio
│   │   ├── Aina Ciurans
│   │   └── Rut Tornils
│   │
│   ├── Administracio
│   │   ├── Dídac Gassó
│   │   └── Laia Macias
│   │
│   ├── Suport_Tecnic
│   │   ├── Estel Birosta
│   │   ├── Aina Zuriguel
│   │   └── Lluïsa Richart
│   │
│   ├── Produccio_Musical
│   │   ├── Roser Alberch
│   │   ├── Guillem Adella
│   │   ├── Meritxell Reglat
│   │   ├── Alícia Monclús
│   │   ├── Carles Molins
│   │   └── Eulàlia Galcera
│   │
│   ├── Informatica
│   │   ├── Talia Costas
│   │   └── Alex Soriano
│   │
│   └── Externs
│       ├── Pere Espinalt
│       └── Neus Bages
│
├── Grups
│   ├── Departaments
│   │   ├── GG_Direccio
│   │   ├── GG_Administracio
│   │   ├── GG_Suport_Tecnic
│   │   ├── GG_Produccio_Musical
│   │   ├── GG_Informatica
│   │   └── GG_Externs
│   │
│   ├── Projectes
│   │   └── GG_Projecte_Campanya_Estiu
│   │
│   └── Funcions
│       ├── GG_Caps_Departament
│       ├── GG_Responsables_Administracio
│       └── GG_Administradors_Sistema
│
├── Equips
│   ├── Sobretaula
│   ├── Portatils
│   ├── Servidors
│   ├── Impressores
│   └── Mobils
│
├── Xarxa
│   ├── SAIS
│   ├── NAS
│   ├── Firewalls
│   ├── Routers
│   └── Switchs
│
├── Software
│   └── Llicencies
│
└── Comptes_Servei
    ├── Aplicacions
    └── Copies_Seguretat
```

# 8. Justificació del disseny

Escull **dues decisions** del teu DIT que consideris importants i justifica-les.

### Decisió 1

---

**Justificació:**

---

---

### Decisió 2

---

**Justificació:**

---

---

---

# 9. Comprovació final

Respon breument.

### a) Per què no seria una bona idea guardar tots els usuaris, grups, equips i servidors al mateix nivell sense organitzar-los?

---

---

### b) Per què no hauríem d'utilitzar les OU per substituir els grups de permisos?

---

---

### c) Si MusicCloud passa de 14 a 500 treballadors, quina característica del disseny que has fet avui facilitarà més l'administració?

---

---

---

# Documentació final del sistema

A partir de les decisions preses durant la sessió, deixa definida la proposta que utilitzarem inicialment per a MusicCloud.

## Estructura d'unitats organitzatives

```text
MusicCloud
│
│
│
│
```

## Criteri utilitzat per organitzar els objectes

---

---

## Criteri utilitzat per diferenciar OU i grups
