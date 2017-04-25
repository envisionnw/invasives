﻿Operation =6
Option =0
Begin InputTables
    Name ="Quadrat_Species"
End
Begin OutputColumns
    Expression ="Quadrat_Species.Transect_ID"
    GroupLevel =2
    Expression ="Quadrat_Species.PlantCode"
    GroupLevel =2
    Expression ="Quadrat_Species.IsDead"
    GroupLevel =2
    Expression ="Quadrat_Species.NumSampledQuads"
    GroupLevel =2
    Expression ="Quadrat_Species.Quad_Pos"
    GroupLevel =1
    Alias ="MinOfPercentCover"
    Expression ="Min(Quadrat_Species.PercentCover)"
End
Begin Groups
    Expression ="Quadrat_Species.Transect_ID"
    GroupLevel =2
    Expression ="Quadrat_Species.PlantCode"
    GroupLevel =2
    Expression ="Quadrat_Species.IsDead"
    GroupLevel =2
    Expression ="Quadrat_Species.NumSampledQuads"
    GroupLevel =2
    Expression ="Quadrat_Species.Quad_Pos"
    GroupLevel =1
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBoolean "OrderByOn" ="0"
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
Begin
    Begin
        dbText "Name" ="[Transect_ID]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[PlantCode]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="[IsDead]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="<>"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="8"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="10"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="13"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.[Transect_ID]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.Quadrat"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.[PlantCode]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.[IsDead]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="PIVOT"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.[IsSampled]"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.NoExotics"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.Position_m"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Expr1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quad_Pos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1_0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="1_3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2_5"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="2_8"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="3_"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="3_10"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="3_13"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.IsSampled"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.PlantCode"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.IsDead"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Q1"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Q2_5m"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Q1_0m"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Q2_8m"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Q3"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.Transect_ID"
        dbLong "AggregateType" ="-1"
        dbInteger "ColumnWidth" ="3420"
        dbBoolean "ColumnHidden" ="0"
    End
    Begin
        dbText "Name" ="Quadrat_Species.Quad_Pos"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Q1_3m"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Q3_10m"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Q3_13m"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Q2"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Quadrat_Species.NumSampledQuads"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="AvgCover"
        dbInteger "ColumnWidth" ="1860"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =11
    Top =52
    Right =843
    Bottom =478
    Left =-1
    Top =-1
    Right =800
    Bottom =220
    Left =0
    Top =0
    ColumnsShown =559
    Begin
        Left =48
        Top =12
        Right =249
        Bottom =251
        Top =0
        Name ="Quadrat_Species"
        Name =""
    End
End