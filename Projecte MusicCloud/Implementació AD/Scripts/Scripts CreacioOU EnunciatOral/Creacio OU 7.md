# Script 7

```powershell
param (
    [Parameter(Mandatory=$true)]
    [string]$nomOU,

    [string]$ruta = "DC=musiccloud,DC=local"
)

try {
    $OU = Get-ADObject -Identity $ruta -ErrorAction Stop
}
catch {
    Write-Host "No existeix $ruta"
    exit
}

if ($nomOU -eq "Usuaris") {
    $subOUs = @(
        "Administracio",
        "Comercial",
        "Desenvolupament",
        "Sistemes",
        "Direccio"
    )
}
elseif ($nomOU -eq "Equips") {
    $subOUs = @(
        "Clients",
        "Servidors"
    )
}
else {
    Write-Host "No hi ha cap estructura definida per a $nomOU"
    exit
}

try {
    $OU = Get-ADOrganizationalUnit -Identity "OU=$nomOU,$ruta" -ErrorAction Stop
}
catch {
    $OU = New-ADOrganizationalUnit -Name $nomOU -Path $ruta -PassThru
}

$rutaOU = $OU.DistinguishedName

foreach ($nom in $subOUs) {
    try {
        $OU = Get-ADOrganizationalUnit -Identity "OU=$nom,$rutaOU" -ErrorAction Stop
        Write-Host "Ja existeix: $nom"
    }
    catch {
        New-ADOrganizationalUnit -Name $nom -Path $rutaOU -ErrorAction Stop
        Write-Host "OU creada: $nom"
    }
}

```

## Comanda per executar el script

> Amb aquest script, el paràmetre $nomOU continua sent obligatori i $ruta continua sent opcional, amb una ruta per defecte. La novetat és que el script identifica el nom de l'OU indicada i determina automàticament quines OU descendents ha de crear. Primer comprova que la ruta existeixi i que l'OU principal estigui creada. Després, crea les OU descendents corresponents, sempre comprovant que no existeixin prèviament.

### **Exemple 1.** Creem l'OU Usuaris i tots els seus departaments dins de MusicCloud

```powershell
" .\CrearOU 7.ps1" nomOU "Usuaris" -ruta "OU=MusicCloud,DC=musiccloud,DC=local"
```

**Resultat Exemple 1:**

```text
MusicCloud
└── Usuaris
    ├── Administracio
    ├── Comercial
    ├── Desenvolupament
    ├── Sistemes
    └── Direccio
```

### **Exemple 2.** Creem l'OU Equips i les seves sub-OU dins de MusicCloud

```powershell
" .\CrearOU 7.ps1" --nomOU "Equips" -ruta "OU=MusicCloud,DC=musiccloud,DC=local"
```

**Resultat Exemple 2:**

```text
MusicCloud
└── Equips
    ├── Clients
    └── Servidors
```
