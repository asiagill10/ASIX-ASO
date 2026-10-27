# Script 1

```powershell
$nomOU = "MusicCloud"
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
.\Creacio OU 1.ps1
```
