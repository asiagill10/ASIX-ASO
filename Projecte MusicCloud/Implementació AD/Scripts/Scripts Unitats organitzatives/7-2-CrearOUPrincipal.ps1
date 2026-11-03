$ruta = "DC=musiccloud,DC=local"

try {
    New-ADOrganizationalUnit -Name "MusicCloud" -Path $ruta -ErrorAction Stop

    Write-Host "S'ha creat correctament l'OU MusicCloud."
}
catch {
    Write-Host "No s'ha pogut crear l'OU MusicCloud."
    Write-Host $_.Exception.Message
}