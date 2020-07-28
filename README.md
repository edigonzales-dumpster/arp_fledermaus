# arp_fledermaus

## TODO

- Bemerkungen / Kommentare in Import-Modell!
- Numeric Range für Y-Koordinate nach Datenfix.
- "Import"-Modell erstellen und mit ili2pg anlegen. Geht das wegen ili2db-Intelligenz? Wie wurde das bei Infoflora gemacht? 
- Kann CSV importiert mit GRETL importiert werden? Unnötiges Komma in der Headerzeile.
- Kann CSV ggü einem ili-Modell geprüft werden?


## Database
```
docker run --rm --name edit-db -p 54321:5432 --hostname primary -e PG_DATABASE=edit -e PG_LOCALE=de_CH.UTF-8 -e PG_PRIMARY_PORT=5432 -e PG_MODE=primary -e PG_USER=admin -e PG_PASSWORD=admin -e PG_PRIMARY_USER=repl -e PG_PRIMARY_PASSWORD=repl -e PG_ROOT_PASSWORD=secret -e PG_WRITE_USER=gretl -e PG_WRITE_PASSWORD=gretl -e PG_READ_USER=ogc_server -e PG_READ_PASSWORD=ogc_server -v ~/pgdata-fledermaus:/pgdata:delegated sogis/oereb-db:latest
```

## ili2pg

```
rm -rf /Users/stefan/.ilicache/
```

### Importmodell

```
java -jar /usr/local/ili2pg-4.3.1/ili2pg.jar \
--dbschema arp_fledermaus --models SO_ARP_Fledermausfundorte_20200728 \
--defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs \
--modeldir "model/.;http://models.geo.admin.ch" \
--createscript arp_fledermaus.sql
```

Fehler in Daten:
- Koordinate falsch: "SO0835","102028","","","https://swissbat.fledermausschutz.ch/quartiere/id/102028","","","0","0","2623620","1237"
