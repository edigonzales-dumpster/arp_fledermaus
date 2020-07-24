# arp_fledermaus

## TODO

- "Import"-Modell erstellen und mit ili2pg anlegen. Geht das wegen ili2db-Intelligenz? Wie wurde das bei Infoflora gemacht? 
- Kann CSV importiert mit GRETL importiert werden? Unnötiges Komma in der Headerzeile.
- Kann CSV ggü einem ili-Modell geprüft werden?


## Database
```
docker run --rm --name edit-db -p 54321:5432 --hostname primary -e PG_DATABASE=edit -e PG_LOCALE=de_CH.UTF-8 -e PG_PRIMARY_PORT=5432 -e PG_MODE=primary -e PG_USER=admin -e PG_PASSWORD=admin -e PG_PRIMARY_USER=repl -e PG_PRIMARY_PASSWORD=repl -e PG_ROOT_PASSWORD=secret -e PG_WRITE_USER=gretl -e PG_WRITE_PASSWORD=gretl -e PG_READ_USER=ogc_server -e PG_READ_PASSWORD=ogc_server -v ~/pgdata-fledermaus:/pgdata:delegated sogis/oereb-db:latest
```