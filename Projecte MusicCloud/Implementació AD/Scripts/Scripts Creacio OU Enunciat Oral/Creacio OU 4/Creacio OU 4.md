# Script 4

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

> Aquest script permet modificar l'ordre dels paràmetres en executar-lo sense que això afecti el seu funcionament. Això és possible perquè indiquem explícitament el nom de cada paràmetre (-nomOU i -ruta), de manera que PowerShell identifica correctament quin valor correspon a cadascun, independentment de l'ordre en què s'especifiquin.

### **Exemple 1.** Primer indiquem el nom de l'OU i després la ruta:

```powershell
& '.\Crear OU 4.ps1 -NomOU' “Musiccloud”  -Ruta “OU=Musiccloud DC=musiccloud, DC=local”
```

### **Exemple 2.** Primer indiquem la ruta i després el nom de l'OU:

```powershell
& '.\Creacio OU 4.ps1'  -Ruta “OU=Musiccloud DC=musiccloud, DC=local” -NomOU “Musiccloud”
```
