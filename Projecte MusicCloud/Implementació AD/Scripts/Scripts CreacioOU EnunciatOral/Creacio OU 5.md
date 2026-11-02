# Script 5

```powershell
param (
    [Parameter (Mandatory=$true)]
    [string]$nomOU,

    [string]$ruta = "DC=musiccloud, DC=local"
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

> En aquest script, el paràmetre $nomOU és obligatori i, per tant, sempre hem d'indicar el nom de la unitat organitzativa que volem crear. En canvi, el paràmetre $ruta és opcional, ja que té assignada una ruta per defecte (DC=musiccloud,DC=local). Si no especifiquem cap ruta en executar el script, s'utilitzarà automàticament la ruta per defecte.

### **Exemple 1.** Especifiquem el nom de l'OU i una ruta personalitzada:

```powershell
“ .\Crear OU.ps1” -NomOU “Musiccloud”  -Ruta “OU=Musiccloud DC=musiccloud, DC=local”
```

### **Exemple 2.** Especifiquem únicament el nom de l'OU. S'utilitzarà la ruta per defecte:

```powershell
“ .\Crear OU.ps1” -NomOU “Musiccloud”
```
