Sub StockData():
'Set CurrentWorksheet as Variable
Dim CWS As Worksheet
For Each CWS In Worksheets

'Insert Headers for Data
CWS.Range("I1") = "Ticker"
CWS.Range("J1") = "Yearly Change"
CWS.Range("K1") = "Percent Change"
CWS.Range("L1") = "Total Stock Volume"

'Assigning Variables for Calculations
Dim Tickername As String
Dim TotalOpen As Double
TotalOpen = 0
Dim TotalClose As Double
TotalClose = 0
Dim YearlyChange As Double
YearlyChange = 0
Dim PercentChange As Double
Dim SummaryTableRow As Long
SummaryTableRow = 2
Dim lastrow As Long
lastrow = CWS.Cells(Rows.Count, 1).End(xlUp).Row
    
    Dim i As Long
    
    For i = 2 To lastrow
    TotalOpen = CWS.Cells(SummaryTableRow, 3).Value
    
        'Entering Ticker
        If CWS.Cells(i + 1, 1).Value <> CWS.Cells(i, 1).Value Then
        Tickername = CWS.Cells(i, 1).Value
        CWS.Range("I" & SummaryTableRow).Value = Tickername
        
        'Entering Yearly Change
        TotalClose = Cells(i, 6).Value
        YearlyChange = TotalClose - TotalOpen
        CWS.Range("J" & SummaryTableRow).Value = YearlyChange
        
        'Entering Stock Volume
        TotalStockVolume = TotalStockVolume + CWS.Cells(i, 7).Value
        CWS.Range("L" & SummaryTableRow).Value = TotalStockVolume
        
        'Entering Percent Change
        PercentChange = ((YearlyChange / TotalOpen) * 100)
        CWS.Range("K" & SummaryTableRow).Value = (CStr(PercentChange) & "%")
        
        'Setting up Font and Color Format for YearlyChange
        'Check if Yearly Change is greater than 0
        If (YearlyChange > 0) Then
        'Fill column with Green for positive change
        CWS.Range("J" & SummaryTableRow).Interior.ColorIndex = 4
        'Check if Yearly Change is less than 0
        ElseIf (YearlyChange <= 0) Then
        'Fill column with Red for negative change
        CWS.Range("J" & SummaryTableRow).Interior.ColorIndex = 3
        
        End If
        
        SummaryTableRow = SummaryTableRow + 1
    
        End If
        'Insert Headers for Challenge
        CWS.Range("N2").Value = "Greatest % Increase"
        CWS.Range("N3").Value = "Greatest % Decrease"
        CWS.Range("N4").Value = "Greatest Total Volume"
        CWS.Range("O1").Value = "Ticker"
        CWS.Range("P1").Value = "Value"
        
        'Assigning Variables for Challenge
        Dim MaxTicker As String
        Dim MinTicker As String
        Dim MaxVolumeTicker As String
        Dim MaxPercent As Double
        MaxPercent = 0
        Dim MinPercent As Double
        MinPercent = 0
        Dim MaxVolume As Double
        MaxVolume = 0
        
        'To calculate the Challenge
        If (PercentChange > MaxPercent) Then
        MaxPercent = PercentChange
        MaxTicker = Tickername
        CWS.Range("O2").Value = MaxTicker
        CWS.Range("P2").Value = (CStr(MaxPercent) & "%")
        
        ElseIf (PercentChange < MinPercent) Then
        MinPercent = PercentChange
        MinTicker = Tickername
        CWS.Range("O3").Value = MinTicker
        CWS.Range("P3").Value = (CStr(MinPercent) & "%")
        
        End If
        
        If (TotalStockVolume > MaxVolume) Then
        MaxVolume = TotalStockVolume
        MaxVolumeTicker = Tickername
        CWS.Range("O4").Value = MaxVolumeTicker
        CWS.Range("P4").Value = MaxVolume
        
        End If
   
    Next i
    
   Dim j As Integer
   For j = 1 To CWS.UsedRange.Columns.Count
   CWS.Columns(j).EntireColumn.AutoFit
   Next j

Next CWS
End Sub

