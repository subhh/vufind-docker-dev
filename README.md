# Entwicklungsumgebung VuFind

## Beschreibung

Diese Docker-basierte Entwicklungsumgebung für die Discovery-Systeme der SUB Hamburg wurde stark durch das Projekt
[vufind-docker](https://github.com/dainst/vufind-docker) des Deutschen Archäologischen Instituts inspiriert.

## Verwendungsweise

1. Checkout der Entwicklungsumgebung auf den lokalen Rechner.

```
dmaus@carbon ~ % git clone --recursive https://github.com/subhh/vufind-docker-dev.git katalog-hamburg-dev
```

2. VuFind in Verzeichnis ```vufind``` auschecken

```
dmaus@carbon ~ % cd ~/katalog-hamburg-dev
dmaus@carbon ~/katalog-hamburg-dev % git clone --recursive -b subhh-local --single-branch https://github.com/subhh/vufind.git
```

3. Seitenspezifische Konfiguration als Verzeichnis ```vufind-site``` auschecken oder verlinken.

```
dmaus@carbon ~ % cd ~/katalog-hamburg-dev
dmaus@carbon ~/katalog-hamburg-dev % ln -s ../hamburg-katalog-module vufind-site
```

4. Entwicklungsumgebung starten

```
dmaus@carbon ~/vufind-docker-dev % docker-compose --env-file .env up
```

Um an verschiedenen Instanzen arbeiten zu können muss die Umgebungsvariable ```APP_IDENT``` gesetzt werden. Der Wert der
Variable wird im Namen der Docker-Container verwendet.

5. Abhängigkeiten installieren oder erneuern

Um Abhängigkeiten der Instanz zu installieren oder zu aktualisieren mit dem Applikations-Container verbinden, in das
Installationsverzeichnis wechseln und ```composer``` ausführen.

```
dmaus@carbon ~/vufind-docker-dev % source .env && docker exec -it vufind-application-${APP_IDENT} /bin/bash
root@be951c3169c8:~# cd /opt/sites/vufind
root@be951c3169c8:/opt/sites/vufind# composer update --no-dev
```

## Autoren

David Maus &lt;david.maus@sub.uni-hamburg.de&gt;
