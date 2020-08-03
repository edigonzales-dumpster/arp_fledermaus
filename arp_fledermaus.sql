CREATE SCHEMA IF NOT EXISTS arp_fledermaus;
CREATE SEQUENCE arp_fledermaus.t_ili2db_seq;;
-- SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort
CREATE TABLE arp_fledermaus.fledermausfundrte_fledermausfundort (
  T_Id bigint PRIMARY KEY DEFAULT nextval('arp_fledermaus.t_ili2db_seq')
  ,bezeichnungkt varchar(50) NULL
  ,quartierid varchar(11) NULL
  ,beobachtungid varchar(11) NULL
  ,artennamedeutsch text NULL
  ,quartierlink varchar(1023) NULL
  ,beobachtunglink varchar(1023) NULL
  ,qex date NULL
  ,inaktiv integer NULL
  ,verwaist integer NULL
  ,x_lv95 decimal(10,3) NOT NULL
  ,y_lv95 decimal(10,3) NOT NULL
)
;
COMMENT ON TABLE arp_fledermaus.fledermausfundrte_fledermausfundort IS 'Fundorte der Fledermäuse. Import aus CSV-Datei.';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.bezeichnungkt IS 'Kantonsnummer';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.quartierid IS 'Identifikator des Quartiers';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.beobachtungid IS 'Identifikator der Beobachtung';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.artennamedeutsch IS 'Deutsche Bezeichnung der Fledermausart';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.quartierlink IS 'HTTP-Link zum Quartier (www.swissbat.fledermausschutz.ch)';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.beobachtunglink IS 'HTTP-Link zur Beobachtung (www.swissbat.fledermausschutz.ch)';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.qex IS 'Datum an dem das Quartier zerstört wurde';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.inaktiv IS 'Ist Quartier aktiv? ja/nein';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.verwaist IS 'Ist Quartier verwaist? ja/nein';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.x_lv95 IS 'Ostwert der Koordinate des Quartiers resp. der Beobachtung';
COMMENT ON COLUMN arp_fledermaus.fledermausfundrte_fledermausfundort.y_lv95 IS 'Nordwert der Koordinate des Quartiers resp. der Beobachtung';
CREATE TABLE arp_fledermaus.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
  ,domains varchar(1024) NULL
)
;
CREATE INDEX T_ILI2DB_BASKET_dataset_idx ON arp_fledermaus.t_ili2db_basket ( dataset );
CREATE TABLE arp_fledermaus.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE arp_fledermaus.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE arp_fledermaus.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(1024) NULL
)
;
CREATE TABLE arp_fledermaus.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_fledermaus.T_ILI2DB_MODEL (
  filename varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (modelName,iliversion)
)
;
CREATE TABLE arp_fledermaus.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE arp_fledermaus.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,ColOwner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (SqlName,ColOwner)
)
;
CREATE TABLE arp_fledermaus.T_ILI2DB_COLUMN_PROP (
  tablename varchar(255) NOT NULL
  ,subtype varchar(255) NULL
  ,columnname varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_fledermaus.T_ILI2DB_TABLE_PROP (
  tablename varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE arp_fledermaus.T_ILI2DB_META_ATTRS (
  ilielement varchar(255) NOT NULL
  ,attr_name varchar(1024) NOT NULL
  ,attr_value varchar(1024) NOT NULL
)
;
ALTER TABLE arp_fledermaus.fledermausfundrte_fledermausfundort ADD CONSTRAINT fledrmsfndrt_fldrmsfndort_inaktiv_check CHECK( inaktiv BETWEEN 0 AND 1);
ALTER TABLE arp_fledermaus.fledermausfundrte_fledermausfundort ADD CONSTRAINT fledrmsfndrt_fldrmsfndort_verwaist_check CHECK( verwaist BETWEEN 0 AND 1);
ALTER TABLE arp_fledermaus.fledermausfundrte_fledermausfundort ADD CONSTRAINT fledrmsfndrt_fldrmsfndort_x_lv95_check CHECK( x_lv95 BETWEEN 2400000.0 AND 2800000.0);
ALTER TABLE arp_fledermaus.fledermausfundrte_fledermausfundort ADD CONSTRAINT fledrmsfndrt_fldrmsfndort_y_lv95_check CHECK( y_lv95 BETWEEN 1100000.0 AND 1400000.0);
ALTER TABLE arp_fledermaus.T_ILI2DB_BASKET ADD CONSTRAINT T_ILI2DB_BASKET_dataset_fkey FOREIGN KEY ( dataset ) REFERENCES arp_fledermaus.T_ILI2DB_DATASET DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX T_ILI2DB_DATASET_datasetName_key ON arp_fledermaus.T_ILI2DB_DATASET (datasetName)
;
CREATE UNIQUE INDEX T_ILI2DB_MODEL_modelName_iliversion_key ON arp_fledermaus.T_ILI2DB_MODEL (modelName,iliversion)
;
CREATE UNIQUE INDEX T_ILI2DB_ATTRNAME_SqlName_ColOwner_key ON arp_fledermaus.T_ILI2DB_ATTRNAME (SqlName,ColOwner)
;
INSERT INTO arp_fledermaus.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort','fledermausfundrte_fledermausfundort');
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.quartierid','quartierid','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.qex','qex','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.beobachtungid','beobachtungid','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.inaktiv','inaktiv','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.beobachtunglink','beobachtunglink','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.verwaist','verwaist','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.quartierlink','quartierlink','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.bezeichnungKt','bezeichnungkt','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.artennameDeutsch','artennamedeutsch','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.x_LV95','x_lv95','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort.y_LV95','y_lv95','fledermausfundrte_fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO arp_fledermaus.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('SO_ARP_Fledermausfundorte_20200728.Fledermausfundorte.Fledermausfundort',NULL);
INSERT INTO arp_fledermaus.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('fledermausfundrte_fledermausfundort','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO arp_fledermaus.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('SO_ARP_Fledermausfundorte_20200728.ili','2.3','SO_ARP_Fledermausfundorte_20200728','INTERLIS 2.3;

/** !!------------------------------------------------------------------------------
 *  !! Version    | wer | Änderung
 *  !!------------------------------------------------------------------------------
 *  !! 2020-07-28 | sz  | Ersterfassung
 *  !!==============================================================================
 */
!!@ technicalContact=mailto:agi@bd.so.ch
MODEL SO_ARP_Fledermausfundorte_20200728 (de)
AT "http://www.geo.so.ch/models/ARP"
VERSION "2020-07-28"  =

  TOPIC Fledermausfundorte =

    /** Fundorte der Fledermäuse. Import aus CSV-Datei.
     */
    CLASS Fledermausfundort =
      /** Kantonsnummer
       */
      bezeichnungKt : TEXT*50;
      /** Identifikator des Quartiers
       */
      quartierid : TEXT*11;
      /** Identifikator der Beobachtung
       */
      beobachtungid : TEXT*11;
      /** Deutsche Bezeichnung der Fledermausart
       */
      artennameDeutsch : TEXT;
      /** HTTP-Link zum Quartier (www.swissbat.fledermausschutz.ch)
       */
      quartierlink : INTERLIS.URI;
      /** HTTP-Link zur Beobachtung (www.swissbat.fledermausschutz.ch)
       */
      beobachtunglink : INTERLIS.URI;
      /** Datum an dem das Quartier zerstört wurde
       */
      qex : INTERLIS.XMLDate;
      /** Ist Quartier aktiv? ja/nein
       */
      inaktiv : 0 .. 1;
      /** Ist Quartier verwaist? ja/nein
       */
      verwaist : 0 .. 1;
      /** Ostwert der Koordinate des Quartiers resp. der Beobachtung
       */
      x_LV95 : MANDATORY 2400000.000 .. 2800000.000;
      /** Nordwert der Koordinate des Quartiers resp. der Beobachtung
       */
      y_LV95 : MANDATORY 1100000.000 .. 1400000.000;
      UNIQUE quartierid;
      UNIQUE beobachtungid;
      MANDATORY CONSTRAINT DEFINED(quartierid) OR DEFINED(beobachtungid);
      MANDATORY CONSTRAINT DEFINED(quartierlink) OR DEFINED(beobachtunglink);
    END Fledermausfundort;

  END Fledermausfundorte;

END SO_ARP_Fledermausfundorte_20200728.
','2020-08-03 17:02:03.657');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createMetaInfo','True');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.beautifyEnumDispName','underscore');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.interlis.ili2c.ilidirs','model/.;http://models.geo.admin.ch');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.arrayTrafo','coalesce');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKeyIndex','yes');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.nameOptimization','topic');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.localisedTrafo','expand');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.jsonTrafo','coalesce');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.numericCheckConstraints','create');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.sender','ili2pg-4.3.1-23b1f79e8ad644414773bb9bd1a97c8c265c5082');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKey','yes');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.sqlgen.createGeomIndex','True');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsAuthority','EPSG');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsCode','2056');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createEnumDefs','multiTable');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.maxSqlNameLength','60');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uuidDefaultValue','uuid_generate_v4()');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.inheritanceTrafo','smart1');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.catalogueRefTrafo','coalesce');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiPointTrafo','coalesce');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.StrokeArcs','enable');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO arp_fledermaus.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multilingualTrafo','expand');
INSERT INTO arp_fledermaus.T_ILI2DB_META_ATTRS (ilielement,attr_name,attr_value) VALUES ('SO_ARP_Fledermausfundorte_20200728','technicalContact','mailto:agi@bd.so.ch');
