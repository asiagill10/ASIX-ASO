$unitats = @(
    @{ Nom = "MusicCloud"; Ruta = "DC=musiccloud,DC=local" }

    @{ Nom = "Usuaris"; Ruta = "OU=MusicCloud,DC=musiccloud,DC=local" }
    @{ Nom = "Equips"; Ruta = "OU=MusicCloud,DC=musiccloud,DC=local" }
    @{ Nom = "Grups"; Ruta = "OU=MusicCloud,DC=musiccloud,DC=local" }

    @{ Nom = "Administracio"; Ruta = "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local" }
    @{ Nom = "Comercial"; Ruta = "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local" }
    @{ Nom = "Desenvolupament"; Ruta = "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local" }
    @{ Nom = "Sistemes"; Ruta = "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local" }
    @{ Nom = "Direccio"; Ruta = "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local" }

    @{ Nom = "Clients"; Ruta = "OU=Equips,OU=MusicCloud,DC=musiccloud,DC=local" }
    @{ Nom = "Servidors"; Ruta = "OU=Equips,OU=MusicCloud,DC=musiccloud,DC=local" }
)

foreach ($unitat in $unitats) {

    $rutaOU = "OU=$($unitat.Nom),$($unitat.Ruta)"

    try {
        Get-ADOrganizationalUnit -Identity $rutaOU -ErrorAction Stop | Out-Null

        Write-Host "L'OU '$($unitat.Nom)' ja existeix."
    }
    catch {
        try {
            New-ADOrganizationalUnit -Name $unitat.Nom -Path $unitat.Ruta -ErrorAction Stop

            Write-Host "S'ha creat correctament l'OU '$($unitat.Nom)'."
        }
        catch {
            Write-Host "No s'ha pogut crear l'OU '$($unitat.Nom)'."
            Write-Host $_.Exception.Message
        }
    }
}
Write-Host "Procés de creació finalitzat."