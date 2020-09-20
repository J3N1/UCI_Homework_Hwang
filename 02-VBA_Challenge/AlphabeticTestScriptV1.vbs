Sub StockData():
'Insert Headers for Data
Range("I1") = "Ticker"
Range("J1") = "Yearly Change"
Range("K1") = "Percent Change"
Range("L1") = "Total Stock Volume"

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
lastrow = Cells(Rows.Count, 1).End(xlUp).Row
    
    Dim i As Long
    
    For i = 2 To lastrow
    TotalOpen = Cells(SummaryTableRow, 3).Value
    
        'Entering Ticker
        If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
        Tickername = Cells(i, 1).Value
        Range("I" & SummaryTableRow).Value = Tickername
        
        'Entering Yearly Change
        TotalClose = Cells(i, 6).Value
        YearlyChange = TotalClose - TotalOpen
        Range("J" & SummaryTableRow).Value = YearlyChange
        
        'Entering Stock Volume
        TotalStockVolume = TotalStockVolume + Cells(i, 7).Value
        Range("L" & SummaryTableRow).Value = TotalStockVolume
        
        'Entering Percent Change
        PercentChange = ((YearlyChange / TotalOpen) * 100)
        Range("K" & SummaryTableRow).Value = PercentChange
        
        'Setting up Font and Color Format for YearlyChange
        'Check if Yearly Change is greater than 0
        If (YearlyChange > 0) Then
        'Fill column with Green for positive change
        Range("J" & SummaryTableRow).Interior.ColorIndex = 4
        'Check if Yearly Change is less than 0
        ElseIf (YearlyChange <= 0) Then
        'Fill column with Red for negative change
        Range("J" & SummaryTableRow).Interior.ColorIndex = 3
        
        End If
        
        SummaryTableRow = SummaryTableRow + 1
    
        End If
        'Insert Headers for Challenge
        Range("N2").Value = "Greatest % Increase"
        Range("N3").Value = "Greatest % Decrease"
        Range("N4").Value = "Greatest Total Volume"
        Range("O1").Value = "Ticker"
        Range("P1").Value = "Value"
        
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
        Range("O2").Value = MaxTicker
        Range("P2").Value = (CStr(MaxPercent) & "%")
        
        ElseIf (PercentChange < MinPercent) Then
        MinPercent = PercentChange
        MinTicker = Tickername
        Range("O3").Value = MinTicker
        Range("P3").Value = (CStr(MinPercent) & "%")
        
        End If
        
        If (TotalStockVolume > MaxVolume) Then
        MaxVolume = TotalStockVolume
        MaxVolumeTicker = Tickername
        Range("O4").Value = MaxVolumeTicker
        Range("P4").Value = MaxVolume
        
        End If
   
    Next i
    
End Sub
