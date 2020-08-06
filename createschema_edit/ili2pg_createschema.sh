java -jar /usr/local/ili2pg-4.3.1/ili2pg.jar \
--dbschema arp_fledermaus --models SO_ARP_Fledermausfundorte_20200728 \
--defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs \
--createscript arp_fledermaus.sql