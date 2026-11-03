$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"

try {
    $OU = Get-ADOrganizationalUnit -Identity $ruta -ErrorAction Stop

    Remove-ADOrganizationalUnit -Identity $ruta -Recursive -Confirm:$false

    Write-Host "S'ha eliminat l'estructura MusicCloud."
}
catch {
    Write-Host "No s'ha pogut eliminar l'OU."
    Write-Host $_.Exception.Message
}