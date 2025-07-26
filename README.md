# MiniFix

## Co je MiniFix?

MiniFix je jednoduchý bash skript určený pro spuštění na Linux Live USB nebo jiné Linuxové distribuci,
který ti pomůže opravit základní problémy s Windows systémem, když Windows vůbec nenaběhne.

MiniFix umí:

* Automaticky najít a připojit Windows oddíly (NTFS)
* Provede základní opravy boot sektoru pomocí ntfsfix
* Zálohuje Windows registry
* Vyčistí některé dočasné soubory a logy, které mohou bránit startu systému
* Vytvoří log opravy pro pozdější analýzu

---

## Jak MiniFix používat?

1. Připrav si Linux Live USB (např. Ubuntu, SystemRescue nebo jiný distro)
2. Nakopíruj minifix.sh na USB nebo přímo do Live systému
3. Otevři terminál v Linuxu
4. Dej skriptu práva pro spuštění:
   chmod +x minifix.sh
5. Spusť skript jako root (nebo pomocí sudo):
   sudo ./minifix.sh
6. Sleduj výstup v terminálu, skript tě bude informovat o průběhu oprav

---

## Co MiniFix dělá pod kapotou?

* Detekuje připojené disky a vybere ten, kde je Windows (NTFS)
* Mountne systémové oddíly (C:\ a další potřebné)
* Provede opravu boot sektoru pomocí nástroje ntfsfix
* Zálohuje registry ze složky Windows/System32/config do zálohového adresáře
* Vyčistí dočasné soubory a logy, které často způsobují problémy se startem
* Vytvoří log soubor minifix.log pro případnou analýzu nebo sdílení s supportem

---

## Omezení a doporučení

* MiniFix není zázračný lék – nevyřeší všechny problémy s Windows, ale zvládne základní opravy bootování
* Pro složitější opravy doporučujeme použít oficiální Windows Recovery Environment (Windows PE)
* Skript běží pouze na Linuxových systémech, Windows spustit nelze
* Vždy si udělej zálohu důležitých dat před použitím

---

## Licence

Tento projekt je pod licencí MIT — dělej s ním, co chceš, ale žádná záruka!

---

## Kontakt

Máš nápady na vylepšení? Najdi mě na GitHubu nebo napiš zprávu!

---

# Keep your system alive and kicking! 🚀

---
