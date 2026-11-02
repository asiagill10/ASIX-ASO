# Script 3

```powershell
param (
    [string]$nomOU,
    [string]$ruta
)

try {
    $OU = Get-ADOrganizationalUnit -Identity "OU=$nomOU,$ruta" -ErrorAction Stop
}
catch {
    $OU = $null
}

if (-not $OU) {
    New-ADOrganizationalUnit -Name $nomOU -Path $ruta
}

```

## Comanda per executar el script

> Amb aquest script podem invertir l’ordre i el script seguirà executant-se.

```powershell
“ .\Crear OU.ps1” -NomOU “Musiccloud”  -Ruta “OU=Musiccloud DC=musiccloud, DC=local”
```

```powershell
“ .\Crear OU.ps1”  -Ruta “OU=Musiccloud DC=musiccloud, DC=local” -NomOU “Musiccloud”
```
