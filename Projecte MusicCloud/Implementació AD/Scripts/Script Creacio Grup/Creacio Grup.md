# Script Grup

```powershell

param(
    [Parameter(Mandatory=$true)]
    [string]$nomGrup,

    [Parameter(Mandatory=$false)]
    [string]$ruta = "DC=musiccloud,DC=local",

    [Parameter(Mandatory=$false)]
    [string]$scope = "Global",

    [Parameter(Mandatory=$false)]
    [string]$categoria = "Security"
)

function Comprovar-Ruta {
    param(
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

function Crear-Grup {
    param(
        [string]$nomGrup,
        [string]$ruta,
        [string]$scope,
        [string]$categoria
    )

    try {
        $Grup = Get-ADGroup -Identity $nomGrup -ErrorAction Stop
    }
    catch {
        $Grup = $null
    }

    if ($Grup -eq $null) {
        try {
            New-ADGroup -Name $nomGrup -Path $ruta -GroupScope $scope -GroupCategory $categoria -ErrorAction Stop | Out-Null
        }
        catch {
            continue
        }
    }
}

if (Comprovar-Ruta -ruta $ruta) {
    Crear-Grup -nomGrup $nomGrup -ruta $ruta -scope $scope -categoria $categoria
}
else {
    exit
}

```

## Comanda per executar el script

> Aquest script permet crear un grup de seguretat a Active Directory. Primer, comprova si la ruta indicada existeix. Si existeix, verifica si el grup ja està creat i, si no existeix, el crea amb l'àmbit global i la categoria de seguretat. Si la ruta no existeix o el grup ja està creat, no realitza cap acció. D'aquesta manera, evita crear grups duplicats i permet executar el script sense mostrar missatges per pantalla.

### **Exemple:** Crear el grup GG_Informatica dins de la UO Grups

```powershell
& '.\Creacio Grup.ps1' -nomGrup "GG_Informatica" -ruta "OU=Grups,OU=MusicCloud,DC=musiccloud,DC=local"
```
