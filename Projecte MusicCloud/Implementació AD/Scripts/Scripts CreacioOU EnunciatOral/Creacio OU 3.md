# Script 3

```powershell
$nomOU = $args[0]
$ruta = "$args[1]

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
“ .\Creacio OU 3.ps1” “Usuaris” “OU=Musiccloud DC=musiccloud, DC=local”
```
