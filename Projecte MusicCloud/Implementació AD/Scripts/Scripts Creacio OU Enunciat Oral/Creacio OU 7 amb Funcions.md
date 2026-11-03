# Script 7

```powershell
param(
    [Parameter(Mandatory=$true)]
    [string[]]$nomOU,

    [Parameter(Mandatory=$false)]
    [string]$ruta = "DC=musiccloud,DC=local"
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

function Crear-OU {
    param(
        [string[]]$nomOU,
        [string]$ruta
    )

    foreach ($nom in $nomOU) {

        try {
            $OU = Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
            Write-Host "L'OU $nom ja existeix."
        }
        catch {
            $OU = $null
        }

        if ($OU -eq $null) {
            try {
                New-ADOrganizationalUnit -Name $nom -Path $ruta -ErrorAction Stop
                Write-Host "L'OU '$nom' s'ha creat correctament."
            }
            catch {
                Write-Host "No s'ha pogut crear l'OU '$nom'."
                Write-Host $_.Exception.Message
            }
        }
    }
}

if (Comprovar-Ruta -ruta $ruta) {
    Crear-OU -nomOU $nomOU -ruta $ruta
}
else {
    Write-Host "No existeix la ruta: $ruta"
    exit
}
```

## Comanda per executar el script

> La diferència respecte al script 7 anterior és ara s'ha separat les tasques en funcions per fer que el codi sigui més modular, ordenat i fàcil de reutilitzar.

### **Exemple** Creem tots els departaments dins de Usuaris

```powershell
" .\CrearOU 6.ps1" -nomOU "Administracio","Comercial","Desenvolupament","Sistemes","Direccio" -ruta "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"
```
