# Script 1

```powershell
param (
[string]$nomOU
)

$ruta = "DC=musiccloud,DC=local"

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

```powershell
.\Creacio OU 2.ps1 -nomOU "Usuaris"
```
