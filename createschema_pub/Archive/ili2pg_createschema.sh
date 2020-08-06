java -jar /usr/local/ili2pg-4.3.1/ili2pg.jar \
--dbschema arp_fledermaus_pub --models SO_ARP_Fledermausfundorte_Publikation_20200806 \
--defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs \
--createscript arp_fledermaus_pub.sql
