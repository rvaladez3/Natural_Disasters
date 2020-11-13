<<<<<<< HEAD
<<<<<<< HEAD
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
    f_featured boolean NOT NULL,+
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
    H_maximumWing     INTEGER (3, 0),
    H_minimumPressure INTEGER (4, 0),
    H_LowWindNE       INTEGER (3, 0),
    H_LowWingSE       INTEGER (3, 0),
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

DELETE FROM Hurricanes
WHERE H_key = "key";

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM Sources;

DROP TABLE Sources;

CREATE TABLE Sources (
    S_ID                         INTEGER (4, 0),
    S_year                       INTEGER (4, 0),
    S_Month                      INTEGER (2, 0),
    S_Day                        INTEGER (2, 0),
    S_Hour                       INTEGER (2, 0),
    S_minute                     INTEGER (2, 0),
    S_cause                      INTEGER (2, 0),
    S_validity                   INTEGER (1, 0),
    S_Focal_Depth                INTEGER (3, 0),
    S_Primary_Magnitude          DECIMAL (1, 1),
    S_Region_Code                INTEGER (2, 0),
    S_Country                    VARCHAR (40, 0),
    S_State_Province             CHAR (2, 0),
    S_location                   VARCHAR (35),
    S_latitude                   DECIMAL (3, 3),
    S_longitude                  DECIMAL (3, 3),
    S_Maximum_Height             DECIMAL (3, 3),
    S_Magnitude_IIDA             DECIMAL (1, 1),
    S_Itensity_Soloviev          DECIMAL (1, 1),
    S_Warning_Status             INTEGER (1, 0),
    S_missing                    INTEGER (6, 0),
    S_missing_estimate           INTEGER (1, 0),
    S_Injuries                   INTEGER (3, 0),
    S_injury_estimate            INTEGER (1, 0),
    S_Fatalities                 INTEGER (6, 0),
    S_Fatality_estimate          INTEGER (1, 0),
    S_Damage_Millions_dollars    DECIMAL (6, 3),
    S_Damage_Estimate            INTEGER (1, 0),
    S_Houses_Damaged             INTEGER (6, 0),
    S_House_Damage_Estimate      INTEGER (1, 0),
    S_House_Destroyed            INTEGER (6, 0),
    S_House_Destruction_estimate INTEGER (4, 0),
    S_All_missing                INTEGER (1, 0),
    S_missing_total              INTEGER (5, 0),
    S_all_injuries               INTEGER (6, 0),
    S_injury_total               INTEGER (1, 0),
    S_all_fatalities             INTEGER (6, 0),
    S_fatality_total             INTEGER (1, 0),
    S_all_damage_millions        DECIMAL (6, 3),
    S_damage_total               INTEGER (1, 0),
    
    S_all_house_damaged          INTEGER (6, 0),
    S_house_damage_total         INTEGER (1, 0),
    S_all_house_destroyed        INTEGER (7, 0),
    S_house_destruction_total    INTEGER (1, 0) 
);

INSERT INTO Sources (
                        S_ID,
                        S_year,
                        S_Month,
                        S_Day,
                        S_Hour,
                        S_minute,
                        S_cause,
                        S_validity,
                        S_Focal_Depth,
                        S_Primary_Magnitude,
                        S_Region_Code,
                        S_Country,
                        S_State_Province,
                        S_location,
                        S_latitude,
                        S_longitude,
                        S_Maximum_Height,
                        S_Magnitude_IIDA,
                        S_Itensity_Soloviev,
                        S_Warning_Status,
                        S_missing,
                        S_missing_estimate,
                        S_Injuries,
                        S_injury_estimate,
                        S_Fatalities,
                        S_Fatality_estimate,
                        S_Damage_Millions_dollars,
                        S_Damage_Estimate,
                        S_Houses_Damaged,
                        S_House_Damage_Estimate,
                        S_House_Destroyed,
                        S_House_Destruction_estimate,
                        S_All_missing,
                        S_missing_total,
                        S_all_injuries,
                        S_injury_total,
                        S_all_fatalities,
                        S_fatality_total,
                        S_all_damage_millions,
                        S_damage_total,
                        S_all_house_damaged,
                        S_house_damage_total,
                        S_all_house_destroyed,
                        S_house_destruction_total
                    )
                    SELECT S_id,
                           S_year,
                           S_Month,
                           S_Day,
                           S_Hour,
                           S_minute,
                           S_cause,
                           S_validity,
                           S_Focal_Depth,
                           S_Primary_Magnitude,
                           S_Region_Code,
                           S_Country,
                           S_State_Province,
                           S_location,
                           S_latitude,
                           S_longitude,
                           S_Maximum_Height,
                           S_Magnitude_IIDA,
                           S_Itensity_Soloviev,
                           S_Warning_Status,
                           S_missing,
                           S_missing_estimate,
                           S_Injuries,
                           S_injury_estimate,
                           S_Fatalities,
                           S_Fatality_estimate,
                           S_Damage_Millions_dollars,
                           S_Damage_Estimate,
                           S_Houses_Damaged,
                           S_House_Damage_Estimate,
                           S_House_Destroyed,
                           S_House_Destruction_estimate,
                           S_All_missing,
                           S_missing_total,
                           S_all_injuries,
                           S_injury_total,
                           S_all_fatalities,
                           S_fatality_total,
                           S_all_damage_millions,
                           S_damage_total,
                           S_all_house_damaged,
                           S_house_damage_total,
                           S_all_house_destroyed,
                           S_house_destruction_total
                      FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

CREATE TABLE Waves(
    W_sourceId INT(4),
    W_waveId INT(6),
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
    W_damage_million_dollars DECIMAL(6,3),
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
.import '/Tsunamis/sources.csv' Sources


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
z                           H_LowWindNE,
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

SELECT * FROM Waves
WHERE W_State = "GREECE" and W_year = 1996;

=======
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
    f_featured boolean NOT NULL,+
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
    H_maximumWing     INTEGER (3, 0),
    H_minimumPressure INTEGER (4, 0),
    H_LowWindNE       INTEGER (3, 0),
    H_LowWingSE       INTEGER (3, 0),
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

DELETE FROM Hurricanes
WHERE H_key = "key";

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM Sources;

DROP TABLE Sources;

CREATE TABLE Sources (
    S_ID                         INTEGER (4, 0),
    S_year                       INTEGER (4, 0),
    S_Month                      INTEGER (2, 0),
    S_Day                        INTEGER (2, 0),
    S_Hour                       INTEGER (2, 0),
    S_minute                     INTEGER (2, 0),
    S_cause                      INTEGER (2, 0),
    S_validity                   INTEGER (1, 0),
    S_Focal_Depth                INTEGER (3, 0),
    S_Primary_Magnitude          DECIMAL (1, 1),
    S_Region_Code                INTEGER (2, 0),
    S_Country                    VARCHAR (40, 0),
    S_State_Province             CHAR (2, 0),
    S_location                   VARCHAR (35),
    S_latitude                   DECIMAL (3, 3),
    S_longitude                  DECIMAL (3, 3),
    S_Maximum_Height             DECIMAL (3, 3),
    S_Magnitude_IIDA             DECIMAL (1, 1),
    S_Itensity_Soloviev          DECIMAL (1, 1),
    S_Warning_Status             INTEGER (1, 0),
    S_missing                    INTEGER (6, 0),
    S_missing_estimate           INTEGER (1, 0),
    S_Injuries                   INTEGER (3, 0),
    S_injury_estimate            INTEGER (1, 0),
    S_Fatalities                 INTEGER (6, 0),
    S_Fatality_estimate          INTEGER (1, 0),
    S_Damage_Millions_dollars    DECIMAL (6, 3),
    S_Damage_Estimate            INTEGER (1, 0),
    S_Houses_Damaged             INTEGER (6, 0),
    S_House_Damage_Estimate      INTEGER (1, 0),
    S_House_Destroyed            INTEGER (6, 0),
    S_House_Destruction_estimate INTEGER (4, 0),
    S_All_missing                INTEGER (1, 0),
    S_missing_total              INTEGER (5, 0),
    S_all_injuries               INTEGER (6, 0),
    S_injury_total               INTEGER (1, 0),
    S_all_fatalities             INTEGER (6, 0),
    S_fatality_total             INTEGER (1, 0),
    S_all_damage_millions        DECIMAL (6, 3),
    S_damage_total               INTEGER (1, 0),
    
    S_all_house_damaged          INTEGER (6, 0),
    S_house_damage_total         INTEGER (1, 0),
    S_all_house_destroyed        INTEGER (7, 0),
    S_house_destruction_total    INTEGER (1, 0) 
);

INSERT INTO Sources (
                        S_ID,
                        S_year,
                        S_Month,
                        S_Day,
                        S_Hour,
                        S_minute,
                        S_cause,
                        S_validity,
                        S_Focal_Depth,
                        S_Primary_Magnitude,
                        S_Region_Code,
                        S_Country,
                        S_State_Province,
                        S_location,
                        S_latitude,
                        S_longitude,
                        S_Maximum_Height,
                        S_Magnitude_IIDA,
                        S_Itensity_Soloviev,
                        S_Warning_Status,
                        S_missing,
                        S_missing_estimate,
                        S_Injuries,
                        S_injury_estimate,
                        S_Fatalities,
                        S_Fatality_estimate,
                        S_Damage_Millions_dollars,
                        S_Damage_Estimate,
                        S_Houses_Damaged,
                        S_House_Damage_Estimate,
                        S_House_Destroyed,
                        S_House_Destruction_estimate,
                        S_All_missing,
                        S_missing_total,
                        S_all_injuries,
                        S_injury_total,
                        S_all_fatalities,
                        S_fatality_total,
                        S_all_damage_millions,
                        S_damage_total,
                        S_all_house_damaged,
                        S_house_damage_total,
                        S_all_house_destroyed,
                        S_house_destruction_total
                    )
                    SELECT S_id,
                           S_year,
                           S_Month,
                           S_Day,
                           S_Hour,
                           S_minute,
                           S_cause,
                           S_validity,
                           S_Focal_Depth,
                           S_Primary_Magnitude,
                           S_Region_Code,
                           S_Country,
                           S_State_Province,
                           S_location,
                           S_latitude,
                           S_longitude,
                           S_Maximum_Height,
                           S_Magnitude_IIDA,
                           S_Itensity_Soloviev,
                           S_Warning_Status,
                           S_missing,
                           S_missing_estimate,
                           S_Injuries,
                           S_injury_estimate,
                           S_Fatalities,
                           S_Fatality_estimate,
                           S_Damage_Millions_dollars,
                           S_Damage_Estimate,
                           S_Houses_Damaged,
                           S_House_Damage_Estimate,
                           S_House_Destroyed,
                           S_House_Destruction_estimate,
                           S_All_missing,
                           S_missing_total,
                           S_all_injuries,
                           S_injury_total,
                           S_all_fatalities,
                           S_fatality_total,
                           S_all_damage_millions,
                           S_damage_total,
                           S_all_house_damaged,
                           S_house_damage_total,
                           S_all_house_destroyed,
                           S_house_destruction_total
                      FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

CREATE TABLE Waves(
    W_sourceId INT(4),
    W_waveId INT(6),
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
    W_damage_million_dollars DECIMAL(6,3),
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
.import '/Tsunamis/sources.csv' Sources


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

SELECT * FROM Waves
WHERE W_State = "GREECE" and W_year = 1996;

>>>>>>> e7eee841f2a7c55a8277b3fdc5a3d698baa4f760
SELECT * 
=======
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

-- SELECT *
-- FROM Earthquakes
-- WHERE e_earthquakeIdNum >= 21557 

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

--  CREATE TABLE sqlitestudio_temp_table AS SELECT * 
--                                          FROM Earthquakes
--                                            WHERE e_earthquakeIdNum >= 21557;

--  DROP TABLE Earthquakes

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

-- INSERT INTO Earthquakes SELECT * FROM sqlitestudio_temp_table ;

-- DROP TABLE sqlitestudio_temp_table;
-- CREATE TABLE sqlitestudio_temp_table AS SELECT *
--                                           FROM Hurricanes;

-- DROP TABLE Hurricanes;

-- CREATE TABLE Hurricanes (
--     H_key             INTEGER (4, 0),
--     H_Id              VARCHAR (9, 0),
--     H_Name            VARCHAR (10, 0),
--     H_dates           DATE,
--     H_time            INTEGER (4, 0),
--     H_event           VARCHAR (1, 0),
--     H_status          VARCHAR (2, 0),
--     H_latitude        VARCHAR (5, 0),
--     H_longitude       VARCHAR (6, 0),
--     H_maximumWind     INTEGER (3, 0),
--     H_minimumPressure INTEGER (4, 0),
--     H_LowWindNE       INTEGER (3, 0),
--     H_LowWindSE       INTEGER (3, 0),
--     H_LowWindSW       INTEGER (3, 0),
--     H_ModerateWindNE  INTEGER (3, 0),
--     H_ModerateWindSE  INTEGER (3, 0),
--     H_ModerateWindSW  INTEGER (3, 0),
--     H_ModerateWindNW  INTEGER (3, 0),
--     H_HighWindNE      INTEGER (3, 0),
--     H_HighWindSE      INTEGER (3, 0),
--     H_HighWindSW      INTEGER (3, 0),
--     H_HighWindNW      INTEGER (3, 0) 
-- );

-- INSERT INTO Hurricanes (
--                            H_key,
--                            H_Id,
--                            H_Name,
--                            H_dates,
--                            H_time,
--                            H_event,
--                            H_status,
--                            H_latitude,
--                            H_longitude,
--                            H_maximumWind,
--                            H_minimumPressure,
--                            H_LowWindNE,
--                            H_LowWindSE,
--                            H_LowWindSW,
--                            H_ModerateWindNE,
--                            H_ModerateWindSE,
--                            H_ModerateWindSW,
--                            H_ModerateWindNW,
--                            H_HighWindNE,
--                            H_HighWindSE,
--                            H_HighWindSW,
--                            H_HighWindNW
--                        )
--                        SELECT H_key,
--                               H_Id,
--                               H_Name,
--                               H_dates,
--                               H_time,
--                               H_event,
--                               H_status,
--                               H_latitude,
--                               H_longitude,
--                               H_maximumWing,
--                               H_minimumPressure,
--                               H_LowWindNE,
--                               H_LowWingSE,
--                               H_LowWindSW,
--                               H_ModerateWindNE,
--                               H_ModerateWindSE,
--                               H_ModerateWindSW,
--                               H_ModerateWindNW,
--                               H_HighWindNE,
--                               H_HighWindSE,
--                               H_HighWindSW,
--                               H_HighWindNW
--                          FROM sqlitestudio_temp_table;

-- DROP TABLE sqlitestudio_temp_table;
-- <<<<<<< HEAD

--What earthquakes have occurrded in sites that are close to site where fires have been declared
SELECT *
FROM Earthquakes, Fires
WHERE substr(e_longitude, 1, 4) LIKE substr(f_longitude, 1, 4)

--How many earthquakes and fires have been declared at similar times
SELECT * 
FROM Earthquakes, Fires
WHERE substr(e_date,6,9)  LIKE substr(f_started, 1,4)
    AND substr(substr(e_date, 3,3),1,2) = substr(substr(f_started, 5,6), 2,2)

--How many fires have occured in each county per each year?
SELECT DISTINCT f_counties, substr(f_started, 1,4) AS Year, COUNT(*) as Fire_Count
FROM Fires
GROUP BY f_counties, substr(f_started, 1,4)
ORDER BY substr(f_started, 1,4)

--Where were the fires in each county burned the most acres located
SELECT f_counties,f_location, MAX(f_acresBurned) as Burned
FROM Fires
GROUP BY f_counties

--How many different types disasters were reported per year in each state that have more than one natural disaster occurrences? 
SELECT wd_state, substr(wd_declarationDate, 1,4) as YEAR, COUNT(DISTINCT wd_incidentType) as Types_of_WD
FROM WorldDisaster
GROUP BY substr(wd_declarationDate, 1,4), wd_state
HAVING Types_of_WD > 1

--How many earthquakes were followed by more than one aftershock?
SELECT e_date, COUNT(*) as Tremors
FROM Earthquakes
GROUP BY e_date
HAVING Tremors > 3

--How many earthquakes happened in the morning of the day that have a magnitude greater than 5.0 and occured 10 units or less deep under tha crust of the earth?
SELECT *
FROM Earthquakes
WHERE e_time <= '12%' AND
    e_Magnitude > 5.0 AND
    e_depth <= 10

--

-- =======
-- >>>>>>> e7eee841f2a7c55a8277b3fdc5a3d698baa4f760
-- >>>>>>> 63ae04abab68e165e01fef6ab40cd91316c37804
