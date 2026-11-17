param(
    [Parameter(Mandatory=$true)]
    [string]$fitxer = ".\unitats.csv",

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

function Comprovar-OU {
    param(
        [string]$nom,
        [string]$ruta
    )

    try {
        Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

function Crear-OU {
    param(
        [string]$nom,
        [string]$ruta
    )

    New-ADOrganizationalUnit -Name $nom -Path $ruta -ErrorAction Stop | Out-Null
}