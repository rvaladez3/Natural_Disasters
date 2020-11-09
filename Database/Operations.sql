CREATE TABLE Fires
(
    f_acresBurned DECIMAL(7,0) NOT NULL,
    f_active STRING NOT NULL,
    f_adminUnit VARCHAR(20) NOT NULL,
    f_airTankers VARCHAR(20) NOT NULL,
    f_archiveYear DECIMAL(4,0) NOT NULL,
    f_calfireIncident VARCHAR(5,0) NOT NULL,
    f_canonicaUrl VARCHAR(25) not null,
    f_conditionStatement VARCHAR(40) not null,
    f_controlStatement VARCHAR(25) not null,
    f_counties VARCHAR(15) not NULL,
    f_countyIds DECIMAL(4,0) not NULL,
    f_crewsInvolved DECIMAL(4,0) NOT NULL,
    f_dozers DECIMAL(4,0) NOT NULL,
    f_engines DECIMAL(4,0) NOT NULL,
    f_extinguished DATE not NULL,
    f_fatalities DECIMAL(3,0) not NULL,
    f_featured boolean NOT NULL,
    f_final Boolean not NULL,
    f_helicopters VARCHAR(6,0) not NULL,
    f_injuries DECIMAL(3, 0) NOT NULL,
    f_latitude DECIMAL(8,3) NOT NULL,
    f_location VARCHAR(15) not NULL,
    f_longitude DECIMAL(8,3) NOT NULL,
    f_majorIncident Boolean not null,
    f_name VARCHAR(30) not null,
    f_percentContained DECIMAL(3,0) not null,
    f_personelInvolved DECIMAL(5,1) not NULL,
    f_public Boolean not null,
    f_searchDescription VARCHAR(25) not null,
    f_searchKeywords VARCHAR(30) not null,
    f_started Date not null,
    f_status VARCHAR(15) not null,
    f_structuresDamaged DECIMAL(4,0) NOT NULL,
    f_stucturedDestroyed DECIMAL(8, 2) not null,
    f_structuredEvacuated DECIMAL(3,0),
    f_structuresThreatend DECIMAL(5,1) not null
);

CREATE TABLE Earthquakes
(
    e_date DATE not null,
    e_time DATETIME not null,
    e_latitude DECIMAL(5,2) not null,
    e_longitude DECIMAL(4,0) not null,
    e_type VARCHAR(10) not null,
    e_depth DECIMAL(4,0) not null,
    e_depthError DECIMAL(4,1) not null,
    e_depthSiesmecStations DECIMAL(4) not null,
    e_Magnitude DECIMAL(4,2) not null,
    e_MagnitudeType VARCHAR(5) not null,
    e_magnitudeError DECIMAL(3,2) not null,
    e_magnitudeSiesmecStation DECIMAL(3) not null,
    e_AzimuthalGap DECIMAL(3) not null,
    e_HorizontalDistance DECIMAL(4,2) not null,
    e_HorizontalError DECIMAL(5,3) not null,
    e_RootMeanSquare DECIMAL(4,2) not null,
    e_source VARCHAR(6) not null,
    e_locationSource VARCHAR(6) not null,
    e_magnitudeSource VARCHAR(5) not null,
    e_status VARCHAR(8) not null
);


CREATE TABLE WorldDisaster
(
    wd_FemaDeclaration VARCHAR(15) not NULL,
    wd_disasterNumber VARCHAR(15) not null,
    wd_state VARCHAR(4) not null,
    wd_declarationType VARCHAR(4) not null,
    wd_declarationDate Date not null,
    wd_fyDeclared DECIMAL(4) not null,
    wd_incidentType VARCHAR(20) not null,
    wd_declarationTitle VARCHAR(30) not null,
    wd_ihProgramDeclared DECIMAL(4,3) not null,
    wd_iaProgramDeclared DECIMAL(4,3) not null,
    wd_paProgramDeclared DECIMAL(4,3) not null,
    wd_hmProgramDeclared DECIMAL(4,3) not null,
    wd_incidentbeginDate DATE not null,
    wd_incidentEndDate DATE not null,
    wd_disasterCloseoutDate DATE not null,
    wd_fips DECIMAL(8,2) not null,
    wd_placeCode DECIMAL(8,2) not null,
    wd_designatedArea VARCHAR(30) not null,
    wd_declarationRequestNumber DECIMAL(8,2) not null,
    wd_uniqueId INTEGER not NULL

);

CREATE TABLE PHurricanes(
    PH_ID VARCHAR(20) not null,
    PH_name VARCHAR(20) not null,
    PH_date date,
    PH_time DECIMAL(4,0),
    PH_event VARCHAR(2),
    PH_Status VARCHAR(2),
    PH_Latitude VARCHAR(5),
    PH_Longitude VARCHAR(5),
    PH_MaxWind DECIMAL(3,0),
    PH_MinPressure Decimal(4,0),
    PH_lowWindNE Decimal(4,0),
    PH_lowWindSE Decimal(4,0),
    PH_lowWindSW Decimal(4,0),
    PH_lowWindNW Decimal(4,0),
    PH_moderateWindNE Decimal(4,0),
    PH_moderateWindSE Decimal(4,0),
    PH_moderateWindSW Decimal(4,0),
    PH_moderateWindNW Decimal(4,0),
    PH_highWindNE Decimal(4,0),
    PH_highWindSE Decimal(4,0),
    PH_highWindSW Decimal(4,0),
    PH_highWindNE Decimal(4,0),
);

CREATE TABLE Souces(

)

CREATE TABLE Waves(
    W_sourceId INT(4),
    W_sourceId INT(6),
    W_year INT(4),
    W_month INT(2),
    W_day INT(2),
    W_country VARCHAR(20),
    W_State VARCHAR(20),
    W_location VARCHAR(40),
    W_latitude VARCHAR(6),
    W_distanceFromSource INT(6),
    W_travelTimeHours INT(2),
    W_travelTimeMinutes INT(2),
    W_validity VARCHAR(1),
    W_measurementType INT(2),
    W_period INT(3,0),
    W_firstmotion CHAR(1,0),
    W_Maximum_Height DECIMAL(3,2),
    W_Horizontal_inudation DECIMAL(5,2),
    W_injuries INT(4,0),
    W_injury_estimate INT(1,0),
    W_fatalities INT(6,0),
    W_fatality_estimate INT(1,0),
    W_damage_millio_dollars DECIMAL(6,3),
    W_damage_estimate INT(1,0),
    W_houses_damaged INT(5,0),
    W_houses_damaged_estimate INT(2,0),
    W_House_destroyed INT(6,0),
    W_House_destruction_estimate INT(1,0),
)

.mode 'column'
.serperator "\t"
.import './Fires/California_Fire_Incidents.csv' Fires
.import './Earthquakes/database.csv' Earthquakes
.import './Disasters/us_disasters_m5.csv' WorldDisaster
.import './Hurricanes/pacific.csv' PHurricanes
.import '/Tsunamis/waves.csv' Waves


CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM Earthquakes;

DROP TABLE Earthquakes;

CREATE TABLE Earthquakes (
    e_earthquakeIdNum         INTEGER        PRIMARY KEY AUTOINCREMENT
                                             NOT NULL,
    e_date                    DATE           NOT NULL,
    e_time                    DATETIME       NOT NULL,
    e_latitude                DECIMAL (5, 2) NOT NULL,
    e_longitude               DECIMAL (4, 0) NOT NULL,
    e_type                    VARCHAR (10)   NOT NULL,
    e_depth                   DECIMAL (4, 0) NOT NULL,
    e_depthSiesmecStations    DECIMAL (4)    NOT NULL,
    e_Magnitude               DECIMAL (4, 2) NOT NULL,
    e_MagnitudeType           VARCHAR (5)    NOT NULL,
    e_source                  VARCHAR (6)    NOT NULL,
    e_locationSource          VARCHAR (6)    NOT NULL,
    e_magnitudeSource         VARCHAR (5)    NOT NULL,
    e_status                  VARCHAR (8)    NOT NULL
);

INSERT INTO Earthquakes (
                            e_earthquakeIdNum,
                            e_date,
                            e_time,
                            e_latitude,
                            e_longitude,
                            e_type,
                            e_depth,
                            e_Magnitude,
                            e_MagnitudeType,
                            e_source,
                            e_locationSource,
                            e_magnitudeSource,
                            e_status
                        )
                        SELECT e_earthquakeIdNum,
                               e_date,
                               e_time,
                               e_latitude,
                               e_longitude,
                               e_type,
                               e_depth,
                               e_Magnitude,
                               e_MagnitudeType,
                               e_source,
                               e_locationSource,
                               e_magnitudeSource,
                               e_status
                          FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM WorldDisaster;

DROP TABLE WorldDisaster;

CREATE TABLE WorldDisaster (
    wd_FemaDeclaration   VARCHAR (15)   NOT NULL,
    wd_disasterNumber    VARCHAR (15)   NOT NULL,
    wd_state             VARCHAR (4)    NOT NULL,
    wd_declarationType   VARCHAR (4)    NOT NULL,
    wd_declarationDate   DATE           NOT NULL,
    wd_fyDeclared        DECIMAL (4)    NOT NULL,
    wd_incidentType      VARCHAR (20)   NOT NULL,
    wd_declarationTitle  VARCHAR (30)   NOT NULL,
    wd_incidentbeginDate DATE           NOT NULL,
    wd_incidentEndDate   DATE           NOT NULL,
    wd_placeCode         DECIMAL (8, 2) NOT NULL,
    wd_designatedArea    VARCHAR (30)   NOT NULL
);

INSERT INTO WorldDisaster (
                              wd_FemaDeclaration,
                              wd_disasterNumber,
                              wd_state,
                              wd_declarationType,
                              wd_declarationDate,
                              wd_fyDeclared,
                              wd_incidentType,
                              wd_declarationTitle,
                              wd_incidentbeginDate,
                              wd_incidentEndDate,
                              wd_placeCode,
                              wd_designatedArea
                          )
                          SELECT wd_FemaDeclaration,
                                 wd_disasterNumber,
                                 wd_state,
                                 wd_declarationType,
                                 wd_declarationDate,
                                 wd_fyDeclared,
                                 wd_incidentType,
                                 wd_declarationTitle,
                                 wd_incidentbeginDate,
                                 wd_incidentEndDate,
                                 wd_placeCode,
                                 wd_designatedArea
                            FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM Fires;

DROP TABLE Fires;

CREATE TABLE Fires (
    f_fireIdNum       INTEGER        NOT NULL
                                     PRIMARY KEY AUTOINCREMENT,
    f_acresBurned     DECIMAL (7, 0) NOT NULL,
    f_active          STRING         NOT NULL,
    f_adminUnit       VARCHAR (20)   NOT NULL,
    f_archiveYear     DECIMAL (4, 0) NOT NULL,
    f_calfireIncident VARCHAR (5, 0) NOT NULL,
    f_counties        VARCHAR (15)   NOT NULL,
    f_countyIds       DECIMAL (4, 0) NOT NULL,
    f_crewsInvolved   DECIMAL (4, 0) NOT NULL,
    f_extinguished    DATE           NOT NULL,
    f_fatalities      DECIMAL (3, 0) NOT NULL,
    f_injuries        DECIMAL (3, 0) NOT NULL,
    f_latitude        DECIMAL (8, 3) NOT NULL,
    f_location        VARCHAR (15)   NOT NULL,
    f_longitude       DECIMAL (8, 3) NOT NULL,
    f_majorIncident   BOOLEAN        NOT NULL,
    f_name            VARCHAR (30)   NOT NULL,
    f_searchKeywords  VARCHAR (30)   NOT NULL,
    f_started         DATE           NOT NULL,
    f_status          VARCHAR (15)   NOT NULL
);

INSERT INTO Fires (
                      f_acresBurned,
                      f_active,
                      f_adminUnit,
                      f_archiveYear,
                      f_calfireIncident,
                      f_counties,
                      f_countyIds,
                      f_crewsInvolved,
                      f_extinguished,
                      f_fatalities,
                      f_injuries,
                      f_latitude,
                      f_location,
                      f_longitude,
                      f_majorIncident,
                      f_name,
                      f_searchKeywords,
                      f_started,
                      f_status
                  )
                  SELECT f_acresBurned,
                         f_active,
                         f_adminUnit,
                         f_archiveYear,
                         f_calfireIncident,
                         f_counties,
                         f_countyIds,
                         f_crewsInvolved,
                         f_extinguished,
                         f_fatalities,
                         f_injuries,
                         f_latitude,
                         f_location,
                         f_longitude,
                         f_majorIncident,
                         f_name,
                         f_searchKeywords,
                         f_started,
                         f_status
                    FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;