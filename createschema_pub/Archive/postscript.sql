COMMENT ON SCHEMA
   arp_fledermaus_pub
IS
   'Fundstellen von Fledermäusen (Quartiere und Beobachtungen). Fragen: odile.bruggisser@bd.so.ch / stefan.ziegler@bd.so.ch'
;
CREATE ROLE arp_fledermaus_pub_read
;
GRANT USAGE ON SCHEMA arp_fledermaus_pub TO arp_fledermaus_pub_read, ogc_server, sogis_service, gretl
;
GRANT SELECT ON ALL TABLES IN SCHEMA arp_fledermaus_pub TO arp_fledermaus_pub_read, ogc_server, sogis_service
;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA arp_fledermaus_pub TO gretl
;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA arp_fledermaus_pub TO gretl
;
GRANT arp_fledermaus_pub_read TO bjsvw, barpa, edden
;
