$nomOU = "MusicCloud"
$ruta = "DC=musiccloud,DC=local"

$OU = Get-ADOrganizationalUnit -Identity "OU=$nomOU,$ruta"

if (-not $OU) {
    New-ADOrganizationalUnit -Name $nomOU -Path $ruta
}
