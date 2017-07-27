CREATE TABLE [usys_temp_transect] (
  [t_Transect_ID] VARCHAR (50),
  [Event_ID] VARCHAR (50),
  [Transect] SHORT ,
  [Start_Time] DATETIME ,
  [GPS_File_Name] VARCHAR (50),
  [Rcvr_Type] VARCHAR (50),
  [Elevation] SHORT ,
  [E_Coord] DOUBLE ,
  [N_Coord] DOUBLE ,
  [UTM_Zone] SHORT ,
  [Datum] VARCHAR (5),
  [Max_PDOP] DOUBLE ,
  [Corr_Type] VARCHAR (25),
  [GPS_Time] DATETIME ,
  [Update_Status] VARCHAR (25),
  [Feat_Name] VARCHAR (50),
  [Unfilt_Pos] SHORT ,
  [Vert_Prec] DOUBLE ,
  [Horz_Prec] DOUBLE ,
  [Std_Dev] DOUBLE ,
  [Comments] LONGTEXT ,
  [Stop_Time] DATETIME ,
  [Observer] VARCHAR (50),
  [Recorder] VARCHAR (50),
  [IsSampled_Q1] SHORT ,
  [IsSampled_Q2] SHORT ,
  [IsSampled_Q3] SHORT ,
  [NoExotics_Q1] SHORT ,
  [NoExotics_Q2] SHORT ,
  [NoExotics_Q3] SHORT ,
  [sc_Transect_ID] VARCHAR (50),
  [Cryptogram_Q1] SINGLE ,
  [Cryptogram_Q2] SINGLE ,
  [Cryptogram_Q3] SINGLE ,
  [Dead_Root_Bole_Q1] SINGLE ,
  [Dead_Root_Bole_Q2] SINGLE ,
  [Dead_Root_Bole_Q3] SINGLE ,
  [Dead_Wood_Q1] SINGLE ,
  [Dead_Wood_Q2] SINGLE ,
  [Dead_Wood_Q3] SINGLE ,
  [Dung_Q1] SINGLE ,
  [Dung_Q2] SINGLE ,
  [Dung_Q3] SINGLE ,
  [Fungus_Q1] SINGLE ,
  [Fungus_Q2] SINGLE ,
  [Fungus_Q3] SINGLE ,
  [Lichen_Q1] SINGLE ,
  [Lichen_Q2] SINGLE ,
  [Lichen_Q3] SINGLE ,
  [Litter_Duff_Q1] SINGLE ,
  [Litter_Duff_Q2] SINGLE ,
  [Litter_Duff_Q3] SINGLE ,
  [Mineral_Soil_Sediment_Q1] SINGLE ,
  [Mineral_Soil_Sediment_Q2] SINGLE ,
  [Mineral_Soil_Sediment_Q3] SINGLE ,
  [Moss_Q1] SINGLE ,
  [Moss_Q2] SINGLE ,
  [Moss_Q3] SINGLE ,
  [Road_Q1] SINGLE ,
  [Road_Q2] SINGLE ,
  [Road_Q3] SINGLE ,
  [Rock_Q1] SINGLE ,
  [Rock_Q2] SINGLE ,
  [Rock_Q3] SINGLE ,
  [Root_Bole_Q1] SINGLE ,
  [Root_Bole_Q2] SINGLE ,
  [Root_Bole_Q3] SINGLE ,
  [Standing_Water_Flooded_Q1] SINGLE ,
  [Standing_Water_Flooded_Q2] SINGLE ,
  [Standing_Water_Flooded_Q3] SINGLE ,
  [Stream_Q1] SINGLE ,
  [Stream_Q2] SINGLE ,
  [Stream_Q3] SINGLE ,
  [Trash_Junk_Q1] SINGLE ,
  [Trash_Junk_Q2] SINGLE ,
  [Trash_Junk_Q3] SINGLE ,
  [ci_Transect_ID] VARCHAR (50),
  [Cryptogram_CoverID_Q1] LONG ,
  [Cryptogram_CoverID_Q2] LONG ,
  [Cryptogram_CoverID_Q3] LONG ,
  [Dead_Root_Bole_CoverID_Q1] LONG ,
  [Dead_Root_Bole_CoverID_Q2] LONG ,
  [Dead_Root_Bole_CoverID_Q3] LONG ,
  [Dead_Wood_CoverID_Q1] LONG ,
  [Dead_Wood_CoverID_Q2] LONG ,
  [Dead_Wood_CoverID_Q3] LONG ,
  [Dung_CoverID_Q1] LONG ,
  [Dung_CoverID_Q2] LONG ,
  [Dung_CoverID_Q3] LONG ,
  [Fungus_CoverID_Q1] LONG ,
  [Fungus_CoverID_Q2] LONG ,
  [Fungus_CoverID_Q3] LONG ,
  [Lichen_CoverID_Q1] LONG ,
  [Lichen_CoverID_Q2] LONG ,
  [Lichen_CoverID_Q3] LONG ,
  [Litter_Duff_CoverID_Q1] LONG ,
  [Litter_Duff_CoverID_Q2] LONG ,
  [Litter_Duff_CoverID_Q3] LONG ,
  [Mineral_Soil_Sediment_CoverID_Q1] LONG ,
  [Mineral_Soil_Sediment_CoverID_Q2] LONG ,
  [Mineral_Soil_Sediment_CoverID_Q3] LONG ,
  [Moss_CoverID_Q1] LONG ,
  [Moss_CoverID_Q2] LONG ,
  [Moss_CoverID_Q3] LONG ,
  [Road_CoverID_Q1] LONG ,
  [Road_CoverID_Q2] LONG ,
  [Road_CoverID_Q3] LONG ,
  [Rock_CoverID_Q1] LONG ,
  [Rock_CoverID_Q2] LONG ,
  [Rock_CoverID_Q3] LONG ,
  [Root_Bole_CoverID_Q1] LONG ,
  [Root_Bole_CoverID_Q2] LONG ,
  [Root_Bole_CoverID_Q3] LONG ,
  [Standing_Water_Flooded_CoverID_Q1] LONG ,
  [Standing_Water_Flooded_CoverID_Q2] LONG ,
  [Standing_Water_Flooded_CoverID_Q3] LONG ,
  [Stream_CoverID_Q1] LONG ,
  [Stream_CoverID_Q2] LONG ,
  [Stream_CoverID_Q3] LONG ,
  [Trash_Junk_CoverID_Q1] LONG ,
  [Trash_Junk_CoverID_Q2] LONG ,
  [Trash_Junk_CoverID_Q3] LONG 
)
