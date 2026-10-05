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
