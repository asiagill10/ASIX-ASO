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

> **[CAPTURA 4: Descàrrega del paquet de PowerShell 7]**

---
