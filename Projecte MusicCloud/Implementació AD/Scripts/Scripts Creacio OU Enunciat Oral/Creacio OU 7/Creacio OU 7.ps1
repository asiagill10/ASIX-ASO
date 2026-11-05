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