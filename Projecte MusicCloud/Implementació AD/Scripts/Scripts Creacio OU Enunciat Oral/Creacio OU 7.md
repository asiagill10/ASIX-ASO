# Script 7

```powershell
param (
    [Parameter(Mandatory=$true)]
    [string[]]$nomOU,

    [string]$ruta = "DC=musiccloud,DC=local"
)

try {
    Get-ADObject -Identity $ruta -ErrorAction Stop | Out-Null
}
catch {
    Write-Host "No existeix la ruta: $ruta"
    exit
}

foreach ($nom in $nomOU) {

    try {
        $OU = Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
        Write-Host "L'OU ja existeix: $nom"
    }
    catch {
        try {
            New-ADOrganizationalUnit -Name $nom -Path $ruta -ErrorAction Stop
            Write-Host "OU creada correctament: $nom"
        }
        catch {
            Write-Host "No s'ha pogut crear l'OU '$nom': $($_.Exception.Message)"
        }
    }
}

```

## Comanda per executar el script

> La principal novetat és que el paràmetre $nomOU passa a ser una matriu ([string[]]), cosa que permet indicar diversos noms d'unitats organitzatives en una mateixa execució. A més, s'incorpora foreach, que recorre tots els noms indicats i comprova individualment si cada OU existeix. Si ja existeix, no la torna a crear; si no existeix, la crea a la ruta especificada. També s'utilitza Get-ADObject per comprovar que la ruta indicada existeix abans de començar el procés, i s'afegeix un segon bloc try/catch per gestionar possibles errors durant la creació de les OU.

### **Exemple 1.** Creem tots els departaments dins de Usuaris

```powershell
" .\CrearOU 6.ps1" -nomOU "Administracio","Comercial","Desenvolupament","Sistemes","Direccio" -ruta "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"
```

### **Exemple 2.** Creem Clients i Servidors dins d'Equips

```powershell
" .\CrearOU 6.ps1" -nomOU "Clients","Servidors" -ruta "OU=Equips,OU=MusicCloud,DC=musiccloud,DC=local"
```
