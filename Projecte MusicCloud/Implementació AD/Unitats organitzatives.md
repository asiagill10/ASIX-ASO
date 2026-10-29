# Enunciat

## Objectiu

Crear l’estructura inicial d’unitats organitzatives del domini `musiccloud.local`.

## Escenari

MusicCloud ja disposa del domini:

```text
musiccloud.local
```

El servidor `SRV-AD-01` ja és controlador de domini.

Ara cal crear una estructura d’unitats organitzatives que permeti organitzar els objectes de l’empresa.

## Estructura que cal crear

Creeu l’estructura següent:

```text
musiccloud.local
└── MusicCloud
    ├── Usuaris
    │   ├── Administracio
    │   ├── Comercial
    │   ├── Desenvolupament
    │   ├── Sistemes
    │   └── Direccio
    ├── Equips
    │   ├── Clients
    │   └── Servidors
    └── Grups
```

## Part 1. Creació de la UO principal

Creeu una unitat organitzativa principal anomenada:

```text
MusicCloud
```

Aquesta UO serà el contenidor principal de l’estructura de l’empresa.

**Comandes Usades**

> S'ha executat la següent comanda per crear la unitat organitzativa principal.

```powershell
New-ADOrganizationalUnit -Name "MusicCloud" -Path "DC=musiccloud,DC=local"
```

## Part 2. Creació de les UO de primer nivell

Dins de la UO `MusicCloud`, creeu les UO següents:

```text
Usuaris
Equips
Grups
```

**Comandes Usades**

> S'han executat les següents comandes per crear les UO de primer nivell.

```powershell
New-ADOrganizationalUnit -Name "Usuaris" -Path "OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Equips" -Path "OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Grups" -Path "OU=MusicCloud,DC=musiccloud,DC=local"
```

## Part 3. Creació de les UO de departaments

Dins de la UO `Usuaris`, creeu les UO següents:

```text
Administracio
Comercial
Desenvolupament
Sistemes
Direccio
```

**Comandes Usades**

> S'han executat les següents comandes per crear les UO de departaments.

```powershell
New-ADOrganizationalUnit -Name "Administracio" -Path "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Comercial" -Path "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Desenvolupament" -Path "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Sistemes" -Path "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Direccio" -Path "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"
```

## Part 4. Creació de les UO d’equips

Dins de la UO `Equips`, creeu les UO següents:

```text
Clients
Servidors
```

**Comandes Usades**

> S'han executat les següents comandes per crear les UO d’equips.

```powershell
New-ADOrganizationalUnit -Name "Clients" -Path "OU=Equips,OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name "Servidors" -Path "OU=Equips,OU=MusicCloud,DC=musiccloud,DC=local"
```

## Part 5. Verificació

Executeu una consulta que mostri totes les unitats organitzatives del domini.

La sortida ha de mostrar, com a mínim, les UO creades en aquesta pràctica.

**Comandes Usades**

> S'ha executat la següent comanda per verificar totes les unitats organitzatives del domini.

```powershell
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName | Sort-Object DistinguishedName
```

> La sortida és la següent.

```text
Name               DistinguishedName
----               -----------------
Administracio      OU=Administracio,OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local
Clients            OU=Clients,OU=Equips,OU=MusicCloud,DC=musiccloud,DC=local
Comercial          OU=Comercial,OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local
Desenvolupament    OU=Desenvolupament,OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local
Direccio           OU=Direccio,OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local
Domain Controllers OU=Domain Controllers,DC=musiccloud,DC=local
Equips             OU=Equips,OU=MusicCloud,DC=musiccloud,DC=local
Grups              OU=Grups,OU=MusicCloud,DC=musiccloud,DC=local
MusicCloud         OU=MusicCloud,DC=musiccloud,DC=local
Servidors          OU=Servidors,OU=Equips,OU=MusicCloud,DC=musiccloud,DC=local
Sistemes           OU=Sistemes,OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local
Usuaris            OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local
```

## Part 6. Preguntes

Responeu breument:

1. Per què és útil crear una UO principal anomenada MusicCloud?
   > Permet agrupar els objectes de l'empresa dins d'una estructura comuna, facilitant-ne l'organització, l'administració i l'aplicació de polítiques.
2. Per què se separen Usuaris, Equips i Grups?
   > Perquè són tipus d'objectes diferents. Separar-los facilita l'administració, l'aplicació de polítiques i la gestió dels permisos.
3. Per què els departaments s’han creat dins de Usuaris?
   > Per organitzar els comptes d'usuari segons el departament al qual pertanyen i facilitar-ne l'administració.
4. Per què no és recomanable deixar tots els usuaris dins del contenidor Users?
   > Perquè el contenidor predeterminat ofereix menys flexibilitat per organitzar els usuaris i aplicar polítiques de grup específiques. Les OU permeten crear una estructura adaptada a les necessitats de l'empresa i vincular-hi polítiques de grup (GPO).

## Part 7. Creació scripts

- 7.1. Crea un script per eliminar totes les OUs creades en la pràctica
- 7.2. Crea un script que crei l'OU principal (musiccloud).
- 7.3. Crea un script que crei l'OU principal i les OUs descendents: Usuaris, Equips i Grups
- 7.4. Crea un script que creï l'OU principal si no existeix i que creï únicament les UO descendents que encara no existeixin. El script s'ha de poder executar més d'una vegada sense generar errors ni duplicar objectes.
