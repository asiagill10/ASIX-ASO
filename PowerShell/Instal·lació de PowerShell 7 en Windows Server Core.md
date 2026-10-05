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
