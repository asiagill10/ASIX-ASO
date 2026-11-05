# Script 6

```powershell
param (
    [Parameter (Mandatory=$true)]
    [string]$nomOU,


    [string]$ruta = "DC=musiccloud, DC=local"
)


try {
    $OU = Get-ADOrganizationalUnit -Identity "$ruta" -ErrorAction Stop
}
catch{
    Write-Host "No existeix $ruta"
    exit
}


try {
    $OU = Get-ADOrganizationalUnit -Identity "OU=$nomOU,$ruta" -ErrorAction Stop
}
catch{
    $OU = $null
}


if (-not $OU) {
    New-ADOrganizationalUnit -Name $nomOU -Path $ruta
}


```

## Comanda per executar el script

> La novetat d'aquest script respecte de l'anterior és que incorpora una primera comprovació per verificar que la ruta indicada existeix. Si la ruta no existeix, mostra un missatge d'error i finalitza l'execució amb exit. Si existeix, continua amb el procediment habitual de comprovar si l'OU ja existeix i, si no és així, crear-la.

### **Exemple 1.** Indiquem una ruta que existeix

```powershell
" .\CrearOU 6.ps1" -nomOU "Usuaris" -ruta "OU=MusicCloud,DC=musiccloud,DC=local"
```

> El script comprova que la ruta existeix i, si l'OU `Administracio` encara no existeix, la crea.

### **Exemple 2.** Indiquem una ruta que no existeix

```powershell
&" .\Creacio OU 6.ps1" -nomOU "Usuaris" -ruta "OU=Inexistent,DC=musiccloud,DC=local"
```

> El script detecta que la ruta no existeix, mostra el missatge `No existeix` i finalitza l'execució sense crear l'OU.
