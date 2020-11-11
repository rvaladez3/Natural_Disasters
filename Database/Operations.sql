-- CREATE TABLE Fires
-- (
--     f_acresBurned DECIMAL(7,0) NOT NULL,
--     f_active STRING NOT NULL,
--     f_adminUnit VARCHAR(20) NOT NULL,
--     f_airTankers VARCHAR(20) NOT NULL,
--     f_archiveYear DECIMAL(4,0) NOT NULL,
--     f_calfireIncident VARCHAR(5,0) NOT NULL,
--     f_canonicaUrl VARCHAR(25) not null,
--     f_conditionStatement VARCHAR(40) not null,
--     f_controlStatement VARCHAR(25) not null,
--     f_counties VARCHAR(15) not NULL,
--     f_countyIds DECIMAL(4,0) not NULL,
--     f_crewsInvolved DECIMAL(4,0) NOT NULL,
--     f_dozers DECIMAL(4,0) NOT NULL,
--     f_engines DECIMAL(4,0) NOT NULL,
--     f_extinguished DATE not NULL,
--     f_fatalities DECIMAL(3,0) not NULL,
--     f_featured boolean NOT NULL,
--     f_final Boolean not NULL,
--     f_helicopters VARCHAR(6,0) not NULL,
--     f_injuries DECIMAL(3, 0) NOT NULL,
--     f_latitude DECIMAL(8,3) NOT NULL,
--     f_location VARCHAR(15) not NULL,
--     f_longitude DECIMAL(8,3) NOT NULL,
--     f_majorIncident Boolean not null,
--     f_name VARCHAR(30) not null,
--     f_percentContained DECIMAL(3,0) not null,
--     f_personelInvolved DECIMAL(5,1) not NULL,
--     f_public Boolean not null,
--     f_searchDescription VARCHAR(25) not null,
--     f_searchKeywords VARCHAR(30) not null,
--     f_started Date not null,
--     f_status VARCHAR(15) not null,
--     f_structuresDamaged DECIMAL(4,0) NOT NULL,
--     f_stucturedDestroyed DECIMAL(8, 2) not null,
--     f_structuredEvacuated DECIMAL(3,0),
--     f_structuresThreatend DECIMAL(5,1) not null
-- );

-- CREATE TABLE Earthquakes
-- (
--     e_date DATE not null,
--     e_time DATETIME not null,
--     e_latitude DECIMAL(5,2) not null,
--     e_longitude DECIMAL(4,0) not null,
--     e_type VARCHAR(10) not null,
--     e_depth DECIMAL(4,0) not null,
--     e_depthError DECIMAL(4,1) not null,
--     e_depthSiesmecStations DECIMAL(4) not null,
--     e_Magnitude DECIMAL(4,2) not null,
--     e_MagnitudeType VARCHAR(5) not null,
--     e_magnitudeError DECIMAL(3,2) not null,
--     e_magnitudeSiesmecStation DECIMAL(3) not null,
--     e_AzimuthalGap DECIMAL(3) not null,
--     e_HorizontalDistance DECIMAL(4,2) not null,
--     e_HorizontalError DECIMAL(5,3) not null,
--     e_RootMeanSquare DECIMAL(4,2) not null,
--     e_source VARCHAR(6) not null,
--     e_locationSource VARCHAR(6) not null,
--     e_magnitudeSource VARCHAR(5) not null,
--     e_status VARCHAR(8) not null
-- );


-- CREATE TABLE WorldDisaster
-- (
--     wd_FemaDeclaration VARCHAR(15) not NULL,
--     wd_disasterNumber VARCHAR(15) not null,
--     wd_state VARCHAR(4) not null,
--     wd_declarationType VARCHAR(4) not null,
--     wd_declarationDate Date not null,
--     wd_fyDeclared DECIMAL(4) not null,
--     wd_incidentType VARCHAR(20) not null,
--     wd_declarationTitle VARCHAR(30) not null,
--     wd_ihProgramDeclared DECIMAL(4,3) not null,
--     wd_iaProgramDeclared DECIMAL(4,3) not null,
--     wd_paProgramDeclared DECIMAL(4,3) not null,
--     wd_hmProgramDeclared DECIMAL(4,3) not null,
--     wd_incidentbeginDate DATE not null,
--     wd_incidentEndDate DATE not null,
--     wd_disasterCloseoutDate DATE not null,
--     wd_fips DECIMAL(8,2) not null,
--     wd_placeCode DECIMAL(8,2) not null,
--     wd_designatedArea VARCHAR(30) not null,
--     wd_declarationRequestNumber DECIMAL(8,2) not null,
--     wd_uniqueId INTEGER not NULL

-- );

-- .mode 'csv'
-- .serperator "\t"
-- .import './Fires/California_Fire_Incidents.csv' Fires
-- .import './Earthquakes/database.csv' Earthquakes
-- .import './Disasters/us_disasters_m5.csv' WorldDisaster

-- CREATE TABLE sqlitestudio_temp_table AS SELECT *
--                                           FROM Earthquakes;

-- DROP TABLE Earthquakes;

-- CREATE TABLE Earthquakes (
--     e_earthquakeIdNum         INTEGER        PRIMARY KEY AUTOINCREMENT
--                                              NOT NULL,
--     e_date                    DATE           NOT NULL,
--     e_time                    DATETIME       NOT NULL,
--     e_latitude                DECIMAL (5, 2) NOT NULL,
--     e_longitude               DECIMAL (4, 0) NOT NULL,
--     e_type                    VARCHAR (10)   NOT NULL,
--     e_depth                   DECIMAL (4, 0) NOT NULL,
--     e_depthSiesmecStations    DECIMAL (4)    NOT NULL,
--     e_Magnitude               DECIMAL (4, 2) NOT NULL,
--     e_MagnitudeType           VARCHAR (5)    NOT NULL,
--     e_source                  VARCHAR (6)    NOT NULL,
--     e_locationSource          VARCHAR (6)    NOT NULL,
--     e_magnitudeSource         VARCHAR (5)    NOT NULL,
--     e_status                  VARCHAR (8)    NOT NULL
-- );

-- INSERT INTO Earthquakes (
--                             e_earthquakeIdNum,
--                             e_date,
--                             e_time,
--                             e_latitude,
--                             e_longitude,
--                             e_type,
--                             e_depth,
--                             e_Magnitude,
--                             e_MagnitudeType,
--                             e_source,
--                             e_locationSource,
--                             e_magnitudeSource,
--                             e_status
--                         )
--                         SELECT e_earthquakeIdNum,
--                                e_date,
--                                e_time,
--                                e_latitude,
--                                e_longitude,
--                                e_type,
--                                e_depth,
--                                e_Magnitude,
--                                e_MagnitudeType,
--                                e_source,
--                                e_locationSource,
--                                e_magnitudeSource,
--                                e_status
--                           FROM sqlitestudio_temp_table;

-- DROP TABLE sqlitestudio_temp_table;

-- CREATE TABLE sqlitestudio_temp_table AS SELECT *
--                                           FROM WorldDisaster;

-- DROP TABLE WorldDisaster;

-- CREATE TABLE WorldDisaster (
--     wd_FemaDeclaration   VARCHAR (15)   NOT NULL,
--     wd_disasterNumber    VARCHAR (15)   NOT NULL,
--     wd_state             VARCHAR (4)    NOT NULL,
--     wd_declarationType   VARCHAR (4)    NOT NULL,
--     wd_declarationDate   DATE           NOT NULL,
--     wd_fyDeclared        DECIMAL (4)    NOT NULL,
--     wd_incidentType      VARCHAR (20)   NOT NULL,
--     wd_declarationTitle  VARCHAR (30)   NOT NULL,
--     wd_incidentbeginDate DATE           NOT NULL,
--     wd_incidentEndDate   DATE           NOT NULL,
--     wd_placeCode         DECIMAL (8, 2) NOT NULL,
--     wd_designatedArea    VARCHAR (30)   NOT NULL
-- );

-- INSERT INTO WorldDisaster (
--                               wd_FemaDeclaration,
--                               wd_disasterNumber,
--                               wd_state,
--                               wd_declarationType,
--                               wd_declarationDate,
--                               wd_fyDeclared,
--                               wd_incidentType,
--                               wd_declarationTitle,
--                               wd_incidentbeginDate,
--                               wd_incidentEndDate,
--                               wd_placeCode,
--                               wd_designatedArea
--                           )
--                           SELECT wd_FemaDeclaration,
--                                  wd_disasterNumber,
--                                  wd_state,
--                                  wd_declarationType,
--                                  wd_declarationDate,
--                                  wd_fyDeclared,
--                                  wd_incidentType,
--                                  wd_declarationTitle,
--                                  wd_incidentbeginDate,
--                                  wd_incidentEndDate,
--                                  wd_placeCode,
--                                  wd_designatedArea
--                             FROM sqlitestudio_temp_table;

-- DROP TABLE sqlitestudio_temp_table;

-- CREATE TABLE sqlitestudio_temp_table AS SELECT *
--                                           FROM Fires;

-- DROP TABLE Fires;

-- CREATE TABLE Fires (
--     f_fireIdNum       INTEGER        NOT NULL
--                                      PRIMARY KEY AUTOINCREMENT,
--     f_acresBurned     DECIMAL (7, 0) NOT NULL,
--     f_active          STRING         NOT NULL,
--     f_adminUnit       VARCHAR (20)   NOT NULL,
--     f_archiveYear     DECIMAL (4, 0) NOT NULL,
--     f_calfireIncident VARCHAR (5, 0) NOT NULL,
--     f_counties        VARCHAR (15)   NOT NULL,
--     f_countyIds       DECIMAL (4, 0) NOT NULL,
--     f_crewsInvolved   DECIMAL (4, 0) NOT NULL,
--     f_extinguished    DATE           NOT NULL,
--     f_fatalities      DECIMAL (3, 0) NOT NULL,
--     f_injuries        DECIMAL (3, 0) NOT NULL,
--     f_latitude        DECIMAL (8, 3) NOT NULL,
--     f_location        VARCHAR (15)   NOT NULL,
--     f_longitude       DECIMAL (8, 3) NOT NULL,
--     f_majorIncident   BOOLEAN        NOT NULL,
--     f_name            VARCHAR (30)   NOT NULL,
--     f_searchKeywords  VARCHAR (30)   NOT NULL,
--     f_started         DATE           NOT NULL,
--     f_status          VARCHAR (15)   NOT NULL
-- );

-- INSERT INTO Fires (
--                       f_acresBurned,
--                       f_active,
--                       f_adminUnit,
--                       f_archiveYear,
--                       f_calfireIncident,
--                       f_counties,
--                       f_countyIds,
--                       f_crewsInvolved,
--                       f_extinguished,
--                       f_fatalities,
--                       f_injuries,
--                       f_latitude,
--                       f_location,
--                       f_longitude,
--                       f_majorIncident,
--                       f_name,
--                       f_searchKeywords,
--                       f_started,
--                       f_status
--                   )
--                   SELECT f_acresBurned,
--                          f_active,
--                          f_adminUnit,
--                          f_archiveYear,
--                          f_calfireIncident,
--                          f_counties,
--                          f_countyIds,
--                          f_crewsInvolved,
--                          f_extinguished,
--                          f_fatalities,
--                          f_injuries,
--                          f_latitude,
--                          f_location,
--                          f_longitude,
--                          f_majorIncident,
--                          f_name,
--                          f_searchKeywords,
--                          f_started,
--                          f_status
--                     FROM sqlitestudio_temp_table;

-- DROP TABLE sqlitestudio_temp_table;

-- CREATE TABLE sqlitestudio_temp_table AS SELECT *
--                                           FROM Fires;

-- DROP TABLE Fires;

-- CREATE TABLE Fires (
--     f_fireIdNum       INTEGER          NOT NULL
--                                        PRIMARY KEY AUTOINCREMENT,
--     f_acresBurned     DECIMAL (7, 0)   NOT NULL,
--     f_active          STRING           NOT NULL,
--     f_adminUnit       VARCHAR (20)     NOT NULL,
--     f_archiveYear     DECIMAL (4, 0)   NOT NULL,
--     f_calfireIncident VARCHAR (5, 0)   NOT NULL,
--     f_counties        VARCHAR (15)     NOT NULL,
--     f_countyIds       DECIMAL (4, 0)   NOT NULL,
--     f_crewsInvolved   DECIMAL (4, 0)   NOT NULL,
--     f_extinguished    DATE             NOT NULL,
--     f_fatalities      DECIMAL (3, 0)   NOT NULL,
--     f_injuries        DECIMAL (8, 3)   NOT NULL,
--     f_latitude        DECIMAL (20, 10) NOT NULL,
--     f_location        VARCHAR (50)     NOT NULL,
--     f_longitude       DECIMAL (20, 10) NOT NULL,
--     f_majorIncident   VARCHAR (30)     NOT NULL,
--     f_started         DATE             NOT NULL,
--     f_status          VARCHAR (15)     NOT NULL
-- );

-- INSERT INTO Fires (
--                       f_fireIdNum,
--                       f_acresBurned,
--                       f_active,
--                       f_adminUnit,
--                       f_archiveYear,
--                       f_calfireIncident,
--                       f_counties,
--                       f_countyIds,
--                       f_crewsInvolved,
--                       f_extinguished,
--                       f_fatalities,
--                       f_injuries,
--                       f_latitude,
--                       f_location,
--                       f_longitude,
--                       f_majorIncident,
--                       f_started,
--                       f_status
--                   )
--                   SELECT f_fireIdNum,
--                          f_acresBurned,
--                          f_active,
--                          f_adminUnit,
--                          f_archiveYear,
--                          f_calfireIncident,
--                          f_counties,
--                          f_countyIds,
--                          f_crewsInvolved,
--                          f_extinguished,
--                          f_fatalities,
--                          f_latitude,
--                          f_latitude2,
--                          f_longitude,
--                          f_majorIncident,
--                          f_name,
--                          f_started,
--                          f_status
--                     FROM sqlitestudio_temp_table;

-- DROP TABLE sqlitestudio_temp_table;

-- CREATE TABLE sqlitestudio_temp_table AS SELECT *
--                                           FROM Fires;

-- DROP TABLE Fires;

-- CREATE TABLE Fires (
--     f_fireIdNum       INTEGER          NOT NULL
--                                        PRIMARY KEY AUTOINCREMENT,
--     f_acresBurned     DECIMAL (7, 0)   NOT NULL,
--     f_active          STRING           NOT NULL,
--     f_adminUnit       VARCHAR (20)     NOT NULL,
--     f_archiveYear     DECIMAL (4, 0)   NOT NULL,
--     f_calfireIncident VARCHAR (5, 0)   NOT NULL,
--     f_counties        VARCHAR (15)     NOT NULL,
--     f_countyIds       DECIMAL (4, 0)   NOT NULL,
--     f_crewsInvolved   DECIMAL (4, 0)   NOT NULL,
--     f_extinguished    DATE             NOT NULL,
--     f_fatalities      DECIMAL (3, 0)   NOT NULL,
--     f_injuries        DECIMAL (8, 3)   NOT NULL,
--     f_latitude        DECIMAL (20, 10) NOT NULL,
--     f_location        VARCHAR (50)     NOT NULL,
--     f_longitude       DECIMAL (20, 10) NOT NULL,
--     f_majorIncident   VARCHAR (30)     NOT NULL,
--     f_started         VARCHAR (20)     NOT NULL
-- );

-- INSERT INTO Fires (
--                       f_fireIdNum,
--                       f_acresBurned,
--                       f_active,
--                       f_adminUnit,
--                       f_archiveYear,
--                       f_calfireIncident,
--                       f_counties,
--                       f_countyIds,
--                       f_crewsInvolved,
--                       f_extinguished,
--                       f_fatalities,
--                       f_injuries,
--                       f_latitude,
--                       f_location,
--                       f_longitude,
--                       f_majorIncident,
--                       f_started
--                   )
--                   SELECT f_fireIdNum,
--                          f_acresBurned,
--                          f_active,
--                          f_adminUnit,
--                          f_archiveYear,
--                          f_calfireIncident,
--                          f_counties,
--                          f_countyIds,
--                          f_crewsInvolved,
--                          f_extinguished,
--                          f_fatalities,
--                          f_injuries,
--                          f_latitude,
--                          f_location,
--                          f_longitude,
--                          f_majorIncident,
--                          f_started
--                     FROM sqlitestudio_temp_table
--                     WHERE f_archiveYear > 2012 AND f_archiveYear < 2019;

-- DROP TABLE sqlitestudio_temp_table;






-- INSERT INTO Fires (
--                       f_fireIdNum,
--                       f_acresBurned,
--                       f_active,
--                       f_adminUnit,
--                       f_archiveYear,
--                       f_calfireIncident,
--                       f_counties,
--                       f_countyIds,
--                       f_crewsInvolved,
--                       f_extinguished,
--                       f_fatalities,
--                       f_injuries,
--                       f_latitude,
--                       f_location,
--                       f_longitude,
--                       f_majorIncident,
--                       f_started
--                    )
--                    SELECT f_fireIdNum,
--                          f_acresBurned,
--                          f_active,
--                          f_adminUnit,
--                          f_archiveYear,
--                          f_calfireIncident,
--                          f_counties,
--                          f_countyIds,
--                          f_crewsInvolved,
--                          f_extinguished,
--                          f_fatalities,
--                          f_injuries,
--                          f_latitude,
--                          f_location,
--                          f_longitude,
--                          f_majorIncident,
--                          f_started
--                          FROM sqlitestudio_temp_table
--                          WHERE sqlitestudio_temp_table.f_archiveYear > 2012 AND sqlitestudio_temp_table.f_archiveYear < 2019

-- DROP TABLE sqlitestudio_temp_table

SELECT *
FROM Earthquakes
WHERE e_earthquakeIdNum >= 21557 

-- CREATE TABLE sqlitestudio_temp_table AS SELECT *
--                                           FROM WorldDisaster;
-- DROP table WorldDisaster;

-- CREATE TABLE WorldDisaster (
--     wd_FemaDeclaration   VARCHAR (15)   NOT NULL,
--     wd_disasterNumber    VARCHAR (15)   NOT NULL,
--     wd_state             VARCHAR (4)    NOT NULL,
--     wd_declarationType   VARCHAR (4)    NOT NULL,
--     wd_declarationDate   DATE           NOT NULL,
--     wd_fyDeclared        DECIMAL (4)    NOT NULL,
--     wd_incidentType      VARCHAR (20)   NOT NULL,
--     wd_declarationTitle  VARCHAR (30)   NOT NULL,
--     wd_incidentbeginDate DATE           NOT NULL,
--     wd_incidentEndDate   DATE           NOT NULL,
--     wd_placeCode         DECIMAL (8, 2) NOT NULL,
--     wd_designatedArea    VARCHAR (30)   NOT NULL
-- );

--INSERT INTO WorldDisaster SELECT * FROM sqlitestudio_temp_table WHERE sqlitestudio_temp_table.wd_incidentbeginDate > "2013%" AND sqlitestudio_temp_table.wd_incidentbeginDate < "2018%";

-- DROP TABLE sqlitestudio_temp_table;

-- CREATE TABLE sqlitestudio_temp_table AS SELECT * 
--                                         FROM Earthquakes

-- DROP TABLE Earthquakes

-- CREATE TABLE Earthquakes (
--     e_earthquakeIdNum         INTEGER        PRIMARY KEY AUTOINCREMENT
--                                              NOT NULL,
--     e_date                    DATE           NOT NULL,
--     e_time                    DATETIME       NOT NULL,
--     e_latitude                DECIMAL (5, 2) NOT NULL,
--     e_longitude               DECIMAL (4, 0) NOT NULL,
--     e_type                    VARCHAR (10)   NOT NULL,
--     e_depth                   DECIMAL (4, 0) NOT NULL,
--     e_Magnitude               DECIMAL (4, 2) NOT NULL,
--     e_MagnitudeType           VARCHAR (5)    NOT NULL,
--     e_source                  VARCHAR (6)    NOT NULL,
--     e_locationSource          VARCHAR (6)    NOT NULL,
--     e_magnitudeSource         VARCHAR (5)    NOT NULL,
--     e_status                  VARCHAR (8)    NOT NULL
-- );

-- INSERT INTO Earthquakes SELECT * FROM sqlitestudio_temp_table WHERE sqlitestudio_temp_table.e_earthquakeIdNum >= 21557;

-- DROP TABLE sqlitestudio_temp_table;
CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM Hurricanes;

DROP TABLE Hurricanes;

CREATE TABLE Hurricanes (
    H_key             INTEGER (4, 0),
    H_Id              VARCHAR (9, 0),
    H_Name            VARCHAR (10, 0),
    H_dates           DATE,
    H_time            INTEGER (4, 0),
    H_event           VARCHAR (1, 0),
    H_status          VARCHAR (2, 0),
    H_latitude        VARCHAR (5, 0),
    H_longitude       VARCHAR (6, 0),
    H_maximumWind     INTEGER (3, 0),
    H_minimumPressure INTEGER (4, 0),
    H_LowWindNE       INTEGER (3, 0),
    H_LowWindSE       INTEGER (3, 0),
    H_LowWindSW       INTEGER (3, 0),
    H_ModerateWindNE  INTEGER (3, 0),
    H_ModerateWindSE  INTEGER (3, 0),
    H_ModerateWindSW  INTEGER (3, 0),
    H_ModerateWindNW  INTEGER (3, 0),
    H_HighWindNE      INTEGER (3, 0),
    H_HighWindSE      INTEGER (3, 0),
    H_HighWindSW      INTEGER (3, 0),
    H_HighWindNW      INTEGER (3, 0) 
);

INSERT INTO Hurricanes (
                           H_key,
                           H_Id,
                           H_Name,
                           H_dates,
                           H_time,
                           H_event,
                           H_status,
                           H_latitude,
                           H_longitude,
                           H_maximumWind,
                           H_minimumPressure,
                           H_LowWindNE,
                           H_LowWindSE,
                           H_LowWindSW,
                           H_ModerateWindNE,
                           H_ModerateWindSE,
                           H_ModerateWindSW,
                           H_ModerateWindNW,
                           H_HighWindNE,
                           H_HighWindSE,
                           H_HighWindSW,
                           H_HighWindNW
                       )
                       SELECT H_key,
                              H_Id,
                              H_Name,
                              H_dates,
                              H_time,
                              H_event,
                              H_status,
                              H_latitude,
                              H_longitude,
                              H_maximumWing,
                              H_minimumPressure,
                              H_LowWindNE,
                              H_LowWingSE,
                              H_LowWindSW,
                              H_ModerateWindNE,
                              H_ModerateWindSE,
                              H_ModerateWindSW,
                              H_ModerateWindNW,
                              H_HighWindNE,
                              H_HighWindSE,
                              H_HighWindSW,
                              H_HighWindNW
                         FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;
