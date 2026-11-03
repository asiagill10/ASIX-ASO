# Script 7

```powershell

param (
    [Parameter(Mandatory=$true)]
    [string[]]$nomOU,

    [string]$ruta = "DC=musiccloud,DC=local"
)

function ComprovarRuta {
    param (
        [string]$ruta
    )

    try {
        Get-ADObject -Identity $ruta -ErrorAction Stop | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

function ComprovarOU {
    param (
        [string]$nom,
        [string]$ruta
    )

    try {
        Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

function CrearOU {
    param (
        [string]$nom,
        [string]$ruta
    )

    New-ADOrganizationalUnit -Name $nom -Path $ruta -ErrorAction Stop
}

if (-not (ComprovarRuta -ruta $ruta)) {
    Write-Host "No existeix la ruta: $ruta"
    exit 1
}

foreach ($nom in $nomOU) {

    if (ComprovarOU -nom $nom -ruta $ruta) {
        Write-Host "L'OU '$nom' ja existeix."
    }
    else {
        try {
            CrearOU -nom $nom -ruta $ruta
            Write-Host "L'OU '$nom' s'ha creat correctament."
        }
        catch {
            Write-Host "No s'ha pogut crear l'OU '$nom': $($_.Exception.Message)"
        }
    }
}


```

## Comanda per executar el script

> La diferència respecte al script 7 anterior és ara s'ha separat les tasques en funcions per fer que el codi sigui més modular, ordenat i fàcil de reutilitzar.

### **Exemple** Creem tots els departaments dins de Usuaris

```powershell
" .\CrearOU 6.ps1" -nomOU "Administracio","Comercial","Desenvolupament","Sistemes","Direccio" -ruta "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"
```
