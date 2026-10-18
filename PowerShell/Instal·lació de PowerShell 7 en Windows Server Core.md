## 1. Comprovació de la versió actual

Abans d'instal·lar PowerShell 7, s'ha comprovat la versió de PowerShell disponible actualment al servidor.

S'ha executat:

```powershell
$PSVersionTable
```

El servidor disposava inicialment de **Windows PowerShell 5.1**.

### Captura

## ![CAPTURA 1: Resultat de `$PSVersionTable` abans de la instal·lació](./Imatges%20Powershell/PW_ComprovarVersio.png)

---

## 2. Comprovació de l'arquitectura

Abans de descarregar PowerShell 7, s'ha comprovat l'arquitectura del sistema amb:

```powershell
$env:PROCESSOR_ARCHITECTURE
```

El resultat `AMD64` indica que el sistema és de 64 bits, per tant s'ha seleccionat el paquet **PowerShell 7 x64**.

### Captura

## ![CAPTURA 2: Resultat de la comprovació de l'arquitectura](./Imatges%20Powershell/PW_Arquitectura.png)

---

## 3. Creació de la carpeta d'instal·lació

S'ha creat la carpeta on s'instal·larà PowerShell 7:

```powershell
New-Item -ItemType Directory -Path "C:\Program Files\PowerShell\7" -Force
```

Aquesta carpeta s'utilitzarà per emmagatzemar els fitxers de PowerShell 7.

### Captura

## ![CAPTURA 3: Creació de la carpeta d'instal·lació](./Imatges%20Powershell/PW_CrearCarpeta.png)

---

## 4. Descàrrega de PowerShell 7

Com que el servidor no disposa d'interfície gràfica, s'ha descarregat el paquet de PowerShell 7 directament des de PowerShell.

S'ha descarregat la versió **7.6.6 x64** mitjançant:

```powershell
Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShell/releases/download/v7.6.6/PowerShell-7.6.6-win-x64.zip" -OutFile "C:\PowerShell-7.6.6-win-x64.zip"
```

El fitxer s'ha desat a:

```text
C:\PowerShell-7.6.6-win-x64.zip
```

### Captura

## ![CAPTURA 4: Descàrrega del paquet de PowerShell 7](./Imatges%20Powershell/PW_Descarrega.png)

---

# 5. Comprovació de la descàrrega

S'ha comprovat que el fitxer ZIP s'ha descarregat correctament amb:

```powershell
Get-Item "C:\PowerShell-7.6.6-win-x64.zip"
```

El sistema mostra informació del fitxer descarregat.

### Captura

## ![CAPTURA 5: Fitxer ZIP descarregat](./Imatges%20Powershell/PW_Descarrega.png)

---

## 6. Desbloqueig del fitxer

Com que el fitxer prové d'Internet, s'ha utilitzat `Unblock-File`:

```powershell
Unblock-File -Path "C:\PowerShell-7.6.6-win-x64.zip"
```

Aquesta operació permet eliminar el bloqueig de seguretat associat al fitxer descarregat.

### Captura

## ![CAPTURA 6: Desbloqueig del fitxer ZIP](./Imatges%20Powershell/PW_Desbloqueig.png)

---

## 7. Descompressió de PowerShell 7

S'ha descomprimit el paquet dins de la carpeta d'instal·lació:

```powershell
Expand-Archive -Path "C:\PowerShell-7.6.6-win-x64.zip" -DestinationPath "C:\Program Files\PowerShell\7" -Force
```

D'aquesta manera, els fitxers de PowerShell 7 queden disponibles al servidor.

### Captura

## ![CAPTURA 7: Descompressió del paquet](./Imatges%20Powershell/PW_Descomprimir.png)

---

## 8. Comprovació dels fitxers instal·lats

S'ha comprovat el contingut de la carpeta d'instal·lació:

```powershell
Get-ChildItem "C:\Program Files\PowerShell\7"
```

Entre els fitxers instal·lats es troba `pwsh.exe`, que és l'executable de PowerShell 7.

### Captura

## ![CAPTURA 8A: Contingut de la carpeta ](./Imatges%20Powershell/PW_ComprovacioFitxers.png)

## ![CAPTURA 8B: pwsh.exe](./Imatges%20Powershell/PW_pwsh.png)

---

## 9. Inici de PowerShell 7

S'ha iniciat PowerShell 7 mitjançant:

```powershell
& "C:\Program Files\PowerShell\7\pwsh.exe"
```

Un cop iniciada la nova sessió, s'ha comprovat la versió amb:

```powershell
$PSVersionTable
```

El resultat mostra la versió **7.6.6** i l'edició **Core**.

### Captura

## ![CAPTURA 9: $PSVersionTable mostrant PowerShell 7.6.6](./Imatges%20Powershell/PW_Inicipw7.png)

---

## 10. Comprovació de la coexistència amb PowerShell 5.1

PowerShell 7 no substitueix PowerShell 5.1, sinó que les dues versions poden funcionar de manera independent.

Per comprovar-ho, s'ha sortit temporalment de PowerShell 7 amb:

```powershell
exit
```

Posteriorment s'ha comprovat la versió de la sessió anterior:

```powershell
$PSVersionTable.PSVersion
```

El resultat mostra que PowerShell 5.1 continua disponible al servidor.

### Captura

## ![CAPTURA 10: PowerShell 5.1 després de sortir de PowerShell 7](./Imatges%20Powershell/PW_pw5.png)

---

## 11. Comprovació final

Finalment, s'ha tornat a iniciar PowerShell 7:

```powershell
& "C:\Program Files\PowerShell\7\pwsh.exe"
```

I s'ha comprovat novament la versió:

```powershell
$PSVersionTable.PSVersion
```

El resultat confirma que PowerShell 7 està instal·lat i funcionant correctament.

### Captura

## ![CAPTURA 11: Comprovació final de PowerShell 7](./Imatges%20Powershell/PW_pw7comp.png)

---
