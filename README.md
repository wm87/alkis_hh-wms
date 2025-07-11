# ALKIS WMS für Hamburg

Ein automatisierter Workflow zur Bereitstellung eines OGC-konformen **WMS-Dienstes** (Web Map Service) für die **ALKIS-Daten** (Amtliches Liegenschaftskataster-Informationssystem) der Stadt Hamburg mithilfe von **Bash-Skripten** und **MapServer**.

## 🔍 Projektbeschreibung

Dieses Projekt ermöglicht die einfache Bereitstellung und Visualisierung ausgewählter Hamburger ALKIS-Daten als WMS-Dienst. Die Daten stammen von der Transparenzplattform der Stadt Hamburg und werden im NAS-Format (Normbasierte Austauschschnittstelle) bereitgestellt.

Ziel ist es, den Import, die Transformation und die Ausspielung dieser Daten in einem WebGIS-Dienst zu automatisieren – mit freier Software und reproduzierbaren Skripten.

---

## 🧰 Verwendete Komponenten

- **Bash** – Automatisierung der Verarbeitungsschritte
- **MapServer** – Bereitstellung der Mapfiles
- **ogr2ogr / GDAL** – Umwandlung der NAS-Daten in ALKIS-Schema der Firma Norbit [alkisimport - Fa. norBIT](https://github.com/norBIT/alkisimport/tree/master)
- **NAS-Daten** – Bereitgestellt von:  
  [Transparenzportal Hamburg – ALKIS ausgewählte Daten](https://suche.transparenz.hamburg.de/dataset/alkis-ausgewaehlte-daten-hamburg5)

---

## 🚀 Funktionsumfang

- Erstellung einer Filelist (***import_All.sh***), nach Download der NAS-Daten vom Transparenzportal Hamburg (kann ggf. mit geringem Aufwand automatisiert werden)
- Allgemeine Anpassungen wie EPSG, SCHEMA, AVOIDDUPES, HISTORIE oder USECOPY in ***alkis-import.sh***
- Prozessierung via ***create_alkis_hh.sh***
    - Umwandlung der NAS-Daten in ALKIS-Schemata für Postgres-DB
    - weiteres Infos: [hier](https://www.norbit.de/74)
- Bereitstellung ALKIS-Mapfiles (`.map`-Datei) in schwarz-weiß und in Farbe (**Grundlage**: [GitHub-Projekt](https://github.com/norBIT/alkisplugin))
- Erstellung eines MapServer-Dienstes kann [hier](https://github.com/wm87/wms-opendata/tree/main/mapserver) nachvollzogen werden => **Ziel: Bereitstellung eines OGC WMS-Endpunkts** zur Integration in GIS-Anwendungen wie QGIS

---

## 📁 Verzeichnisstruktur
```text
 .
├──  aaa_template_hh
│   ├──  alkis-schema.gfs
│   ├──  alkis-schema_25832.sql
│   └──  setup_Schema_PostNAS.sh
├──  admin
│   └──  create_alkis_hh.sh
├──  alkisimport_norgis
│   ├──  13068.prj
...
│   ├──  alkis-clean.sql
│   ├──  alkis-compat.sql
│   ├──  alkis-functions.sql
│   ├──  alkis-import.cmd
│   ├──  alkis-import.sh
...
│   ├──  alkis-schema.37.gfs
│   ├──  alkis-schema.gfs
│   ├──  alkis-schema.sql
│   ├──  alkis-trigger.sql
│   ├──  alkis-update.sql
│   ├──  alkis-wertearten-nrw.sql
│   ├──  alkis-wertearten.sql
│   ├──  alkisImport.py
...
├──  filelists
├──  import
│   └──  import_All.sh
├──  mapserver
│   ├──  fonts
│   ├──  svg
│   ├──  wms_alkis_hh_color.map
│   └──  wms_alkis_hh_sw.map
└──  README.md
```

## 📦 Installation & Nutzung

### 1. Voraussetzungen

Installiere u.a. folgende Abhängigkeiten:

```bash
sudo apt install postgresql-17 postgresql-17-postgis-3 gdal-bin postgis mapserver-bin cgi-mapserver unzip
```

## 🗓️ Datenquelle & Lizenz
Quelle: Transparenzportal Hamburg

Lizenz: Daten unterliegen der Datenlizenz Deutschland – Namensnennung – Version 2.0



## 🤝 Mitwirken
Pull Requests, Verbesserungsvorschläge oder Erweiterungen sind willkommen! Bitte stelle sicher, dass du die Datenquellen korrekt zitierst und keine personenbezogenen Daten veröffentlichst.

## 🛡️ Haftungsausschluss
Dieses Projekt ist ein Community-Projekt und nicht offiziell von der Stadt Hamburg oder einem Amt bereitgestellt. Es erfolgt keine Gewährleistung für Aktualität oder Vollständigkeit der dargestellten Daten.