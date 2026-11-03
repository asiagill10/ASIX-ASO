$ruta = "DC=musiccloud,DC=local"

try {
    New-ADOrganizationalUnit -Name "MusicCloud" -Path $ruta -ErrorAction Stop

    Write-Host "S'ha creat l'OU MusicCloud."

    $ruta = "OU=MusicCloud,DC=musiccloud,DC=local"

    New-ADOrganizationalUnit -Name "Usuaris" -Path $ruta -ErrorAction Stop
    Write-Host "S'ha creat l'OU Usuaris."

    New-ADOrganizationalUnit -Name "Equips" -Path $ruta -ErrorAction Stop
    Write-Host "S'ha creat l'OU Equips."

    New-ADOrganizationalUnit -Name "Grups" -Path $ruta -ErrorAction Stop
    Write-Host "S'ha creat l'OU Grups."

    Write-Host "S'ha creat tota l'estructura correctament."
}
catch {
    Write-Host "No s'ha pogut completar la creació de l'estructura."
    Write-Host $_.Exception.Message
}
