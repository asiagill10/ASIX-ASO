# Fitxa 1 — Anàlisi inicial de MusicCloud

**Nom i cognoms:** ASIA GILL SAHOTA  
**Data:** 17-9-2026  
**Equip / parella:** INDIVIDUAL

## Objectiu

MusicCloud necessita reorganitzar la seva infraestructura informàtica. Abans d'instal·lar o configurar cap servei, cal entendre:

- qui treballa a l'empresa;
- quines funcions té cada persona;
- quins recursos existeixen;
- qui necessita accedir a cada recurs;
- com podem gestionar aquests accessos de manera eficient.

---

# 1. Conèixer MusicCloud

Consulta la informació disponible sobre els departaments, treballadors i perfils d'usuari de MusicCloud.

Completa la taula següent.

| Persona          | Departament       | Funció / responsabilitat                                              | Necessita privilegis especials? Per què?                                                                                            |
| ---------------- | ----------------- | --------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| Aina Ciurans     | Direcció          | Direcció i gestió general de l'empresa                                | Sí. Necessita accedir a informació general i a determinats recursos confidencials de l'empresa.                                     |
| Rut Tornils      | Direcció          | Direcció i gestió general de l'empresa                                | Sí. Necessita accedir a informació general i a determinats recursos confidencials de l'empresa.                                     |
| Dídac Gassó      | Administració     | Administració i gestió de factures, contractes i documentació interna | No. Necessita els permisos propis del departament d'Administració.                                                                  |
| Laia Macias      | Administració     | Cap d'Administració                                                   | Sí. Necessita els permisos del departament i permisos addicionals per gestionar els recursos propis del departament.                |
| Estel Birosta    | Suport tècnic     | Manteniment de sistemes i gestió d'incidències                        | No. Necessita els permisos habituals del departament de Suport tècnic.                                                              |
| Aina Zuriguel    | Suport tècnic     | Manteniment de sistemes i gestió d'incidències                        | No. Necessita els permisos habituals del departament de Suport tècnic.                                                              |
| Lluïsa Richart   | Suport tècnic     | Cap de Suport tècnic                                                  | Sí. Necessita els permisos del departament i permisos addicionals per gestionar els recursos del seu departament.                   |
| Roser Alberch    | Producció musical | Gestió de continguts musicals                                         | No. Necessita els permisos habituals del departament de Producció musical.                                                          |
| Guillem Adella   | Producció musical | Gestió de continguts musicals                                         | No. Necessita els permisos habituals del departament de Producció musical.                                                          |
| Meritxell Reglat | Producció musical | Cap de Producció musical                                              | Sí. Necessita els permisos del departament i permisos addicionals per gestionar els seus recursos.                                  |
| Alícia Monclús   | Producció musical | Gestió de continguts musicals                                         | No. Necessita els permisos habituals del departament de Producció musical.                                                          |
| Carles Molins    | Producció musical | Gestió de continguts musicals                                         | No. Necessita els permisos habituals del departament de Producció musical.                                                          |
| Eulàlia Galcera  | Producció musical | Gestió de continguts musicals                                         | No. Necessita els permisos habituals del departament de Producció musical.                                                          |
| Talia Costas     | Informàtica       | Cap d'Informàtica                                                     | Sí. Necessita privilegis d'administració per gestionar els sistemes informàtics, els usuaris, els permisos i els serveis.           |
| Alex Soriano     | Informàtica       | Suport i administració del sistema informàtic                         | Sí. Necessita privilegis tècnics per realitzar tasques d'administració dels sistemes.                                               |
| Pere Espinalt    | Extern            | Col·laborador extern                                                  | No. Només necessita accés als recursos específics que se li autoritzin i no ha de tenir accés a la informació interna de l'empresa. |
| Neus Bages       | Extern            | Col·laboradora externa                                                | No. Només necessita accés als recursos específics que se li autoritzin i no ha de tenir accés a la informació interna de l'empresa. |

### 1.1. Reflexió

Quines diferències observes entre un **treballador**, un **departament** i una **funció o responsabilitat**?

--- Un **treballador** és una persona que forma part de l'empresa i que realitza unes tasques determinades.

--- Un **departament** és un conjunt de treballadors que realitzen funcions relacionades dins de l'empresa.

--- Una **funció o responsabilitat** són les tasques i obligacions que té una persona dins de l'empresa. Una persona pot tenir responsabilitats addicionals, com ser cap d'un departament, i això pot fer que necessiti permisos diferents.

Hi ha persones que, pel seu càrrec o funció, necessiten accessos diferents dels altres membres del seu departament?

X Sí  
☐ No

Posa'n algun exemple:

--- Laia Macias pertany al departament d'Administració, però és la cap del departament. Per tant, a més dels permisos habituals d'Administració, necessita accedir a la carpeta `gestio_departament`.

--- Un altre exemple és Talia Costas, que és la cap d'Informàtica i necessita privilegis especials per administrar els sistemes informàtics.

# 2. Recursos de l'empresa

Analitza l'estructura d'informació de MusicCloud.
Classifica alguns dels recursos següents segons la seva finalitat.

| Recurs                                                   | Qui creus que l'hauria d'utilitzar?                | Per a què?                                                                           |
| -------------------------------------------------------- | -------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `/empresa/comu/intercanvi`                               | Treballadors interns i usuaris externs autoritzats | Per intercanviar temporalment documents entre MusicCloud i persones externes.        |
| `/empresa/comu/comunicats`                               | Treballadors de MusicCloud                         | Per consultar comunicacions i informació general de l'empresa.                       |
| `/empresa/departaments/administracio/compartida`         | Treballadors d'Administració                       | Per compartir i gestionar documents relacionats amb les tasques del departament.     |
| `/empresa/departaments/administracio/gestio_departament` | Laia Macias, cap d'Administració                   | Per gestionar informació i documents relacionats amb la coordinació del departament. |
| `/empresa/projectes/campanya_estiu`                      | Treballadors assignats al projecte                 | Per compartir i modificar els fitxers necessaris per desenvolupar el projecte.       |
| `/empresa/administracio_sistema/backups`                 | Personal d'informàtica autoritzat                  | Per gestionar i mantenir les còpies de seguretat dels sistemes de l'empresa.         |

---

# 3. Qui ha de poder fer què?

Per a cada situació, indica quin nivell d'accés consideres adequat.

Utilitza:

- **NA** → sense accés
- **L** → lectura
- **L/E** → lectura i escriptura
- **ADM** → administració

No busquis encara una solució tècnica. Pensa només en les necessitats de l'empresa.

| Situació                                                             | Accés proposat | Justificació                                                                                               |
| -------------------------------------------------------------------- | -------------- | ---------------------------------------------------------------------------------------------------------- |
| Dídac accedeix a la carpeta compartida d'Administració               | **L/E**        | Dídac forma part d'Administració i necessita consultar i modificar els documents del seu departament.      |
| Laia accedeix a la gestió del departament d'Administració            | **L/E**        | Laia és la cap del departament i necessita gestionar els recursos propis del departament.                  |
| Pere, treballador extern, accedeix als comunicats interns            | **NA**         | Els comunicats interns són informació destinada als treballadors de MusicCloud i Pere és un usuari extern. |
| Talia accedeix als backups del sistema                               | **ADM**        | Talia és la cap d'Informàtica i necessita gestionar les còpies de seguretat i el seu manteniment.          |
| Un membre de Producció musical accedeix a la carpeta d'Administració | **NA**         | No necessita accedir a aquesta informació per realitzar les seves funcions.                                |
| Un participant de `campanya_estiu` accedeix als fitxers del projecte | **L/E**        | Els participants necessiten consultar i modificar els fitxers necessaris per desenvolupar el projecte.     |

---

# 4. Primer problema: com assignem els permisos?

Imagina que MusicCloud té només quatre treballadors:

- Anna
- Biel
- Carla
- David

Tots quatre treballen al mateix departament i necessiten accedir a la mateixa carpeta.

Una possible solució seria configurar:

```text
Anna  → lectura/escriptura
Biel  → lectura/escriptura
Carla → lectura/escriptura
David → lectura/escriptura
```

### 4.1.

Què passaria si l'empresa tingués **100 treballadors** amb el mateix tipus d'accés?

--- La gestió dels permisos seria molt més complexa i requeriria configurar cada usuari individualment. Això augmentaria la feina administrativa i el risc de cometre errors.

### 4.2.

Què passaria cada vegada que s'incorporés una persona nova?

--- Caldria configurar manualment els permisos de la nova persona. Això faria que el procés fos més lent i menys eficient.

### 4.3.

Què passaria quan una persona canviés de departament?

--- Caldria eliminar manualment els permisos que tenia al departament anterior i assignar-li els permisos del nou departament. Si algun permís no es retirés correctament, podria continuar tenint accés a informació que ja no necessita.

### 4.4.

Proposa una manera de gestionar aquestes persones conjuntament.

No cal que coneguis encara el nom tècnic de la solució.

--- Es podria crear un conjunt de persones que tinguessin les mateixes necessitats d'accés i assignar els permisos directament a aquest conjunt. D'aquesta manera, no caldria configurar els permisos de cada persona individualment

# 5. Canvis a MusicCloud

Ara es produeixen aquests tres canvis:

### Cas A

Dídac deixa Administració i passa a Producció musical.

Quins accessos hauria de perdre?

--- Hauria de perdre els accessos associats al departament d'Administració, especialment els permisos sobre les carpetes compartides i la documentació interna d'aquest departament.

Quins accessos hauria d'obtenir?

--- Hauria d'obtenir els permisos corresponents al departament de Producció musical, incloent-hi l'accés als recursos compartits que necessita per desenvolupar les seves noves funcions.

### Cas B

S'incorpora una nova treballadora al departament d'Administració.

Quins accessos caldria configurar?

--- Caldria crear el seu usuari i assignar-la al conjunt corresponent d'Administració. Això li permetria obtenir els permisos necessaris per accedir als recursos compartits del departament.

### Cas C

Pere Espinalt deixa de col·laborar amb MusicCloud.

Què hauríem de fer amb els seus accessos?

--- Caldria retirar els seus accessos als recursos de l'empresa i desactivar el seu compte. D'aquesta manera, s'evitaria que pogués continuar accedint a informació de MusicCloud.

# 6. Busquem una solució millor

Suposa ara que podem crear conjunts de persones que comparteixen unes mateixes necessitats d'accés.

Per exemple:

```text
Administració
    ├── Dídac
    ├── Laia
    └── Roser
```

I podem donar permisos directament al conjunt:

```text
Administració → carpeta_administracio → L/E
```

### 6.1.

Quin avantatge té aquesta solució respecte a donar permisos persona per persona?

--- Permet gestionar els permisos de manera centralitzada. En lloc d'assignar els permisos a cada persona individualment, s'assignen al conjunt de persones que tenen les mateixes necessitats.

Això facilita l'administració, redueix possibles errors i permet gestionar un nombre més gran de treballadors de manera eficient

### 6.2.

Si Dídac passa d'Administració a Producció musical, què caldria modificar?

--- Caldria treure Dídac del conjunt d'Administració i afegir-lo al conjunt de Producció musical. Així, els seus permisos s'adaptarien a les seves noves funcions.

### 6.3.

Com anomenaries aquests conjunts de persones?

--- Els anomenaria grups, ja que agrupen usuaris que comparteixen unes mateixes necessitats d'accés.

# 7. Primera proposta per a MusicCloud

A partir de l'organització de l'empresa, proposa els primers conjunts de persones que crearies.

**No cal trobar encara la solució definitiva.**

| Nom proposat       | Qui hi pertanyeria?                                                                              | Per què existeix aquest conjunt?                                              |
| ------------------ | ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------- |
| `Administracio`    | Dídac Gassó i Laia Macias                                                                        | Per gestionar els accessos als recursos del departament d'Administració.      |
| `SuportTecnic`     | Estel Birosta, Aina Zuriguel i Lluïsa Richart                                                    | Per gestionar els accessos als recursos del departament de Suport tècnic.     |
| `ProduccioMusical` | Roser Alberch, Guillem Adella, Meritxell Reglat, Alícia Monclús, Carles Molins i Eulàlia Galcera | Per gestionar els accessos als recursos del departament de Producció musical. |
| `Informatica`      | Talia Costas i Alex Soriano                                                                      | Per gestionar els accessos als recursos del departament d'Informàtica.        |
| `Externs`          | Pere Espinalt i Neus Bages                                                                       | Per gestionar els accessos limitats dels treballadors externs.                |

---

# 8. Cas que complica el model

Laia treballa al departament d'Administració, però també és la responsable del departament.

És suficient que pertanyi només al conjunt `Administració`?

☐ Sí  
X No

Per què?

--- No és suficient perquè Laia necessita els permisos normals del departament d'Administració i, a més, permisos addicionals com a responsable del departament.

Quina possible solució proposes?

--- Es pot mantenir Laia dins del grup `Administracio` i crear un altre grup específic per als responsables, per exemple `Responsables_Administracio`. Així, Laia tindria els permisos habituals del departament i els permisos addicionals corresponents a la seva responsabilitat.

# 9. Un altre cas

Diverses persones de departaments diferents participen temporalment en el projecte:

```text
Campanya Estiu
```

Creus que hauríem de canviar-les de departament?

☐ Sí  
X No

Si no, com podríem donar-los accés als recursos del projecte?

--- Les persones haurien de continuar pertanyent al seu departament original, ja que participar en un projecte temporal no modifica la seva funció dins de l'empresa.

Es podria crear un grup específic anomenat Projecte_Campanya_Estiu i afegir-hi les persones que participen en el projecte. Aquest grup tindria els permisos necessaris sobre els recursos de campanya_estiu.

# 10. Conclusions

Completa les frases amb les teves paraules.

### Usuari

Un usuari representa:

--- Una persona que necessita accedir als recursos informàtics de l'empresa per poder realitzar les seves funcions.

### Recurs

Un recurs és:

--- Un element informàtic, com una carpeta, un fitxer o un servei, al qual els usuaris poden necessitar accedir.

### Permís

Un permís determina:

--- Quines accions pot realitzar un usuari sobre un recurs, com consultar, modificar o administrar la informació.

### Grup

Un grup serveix per:

--- Agrupar usuaris amb necessitats d'accés similars i facilitar la gestió dels permisos.

# 11. Regla de mínim privilegi

Analitza aquesta afirmació:

> Un usuari només hauria de tenir els permisos estrictament necessaris per realitzar la seva feina.

Explica amb les teves paraules què significa.

---

---

Posa un exemple relacionat amb MusicCloud.

---

---

---

# 12. Pregunta final

Imagina que demà MusicCloud passa de 14 treballadors a 500.

Quina de les dues estratègies consideres més adequada?

☐ Assignar permisos individualment a cada usuari.

☐ Organitzar els usuaris segons les seves necessitats i assignar permisos a aquests conjunts.

Justifica la resposta.

---

---

---
