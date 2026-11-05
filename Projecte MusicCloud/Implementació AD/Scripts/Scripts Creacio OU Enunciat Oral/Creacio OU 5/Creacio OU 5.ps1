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