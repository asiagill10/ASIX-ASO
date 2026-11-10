
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
