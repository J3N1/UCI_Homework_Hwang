Sub StockData():
'Set CurrentWorksheet as Variable
Dim CWS As Worksheet
For Each CWS In Worksheets

'Insert Headers for Data
CWS.Range("I1") = "Ticker"
CWS.Range("J1") = "Yearly Change"
CWS.Range("K1") = "Percent Change"
CWS.Range("L1") = "Total Stock Volume"

'Insert Headers for Challenge
CWS.Range("N2").Value = "Greatest % Increase"
CWS.Range("N3").Value = "Greatest % Decrease"
CWS.Range("N4").Value = "Greatest Total Volume"
CWS.Range("O1").Value = "Ticker"
CWS.Range("P1").Value = "Value"

'Assigning Variables for Calculations
Dim i As Long
Dim Tickername As String
Dim TotalOpen As Double
TotalOpen = 0
Dim TotalClose As Double
TotalClose = 0
Dim YearlyChange As Double
YearlyChange = 0
Dim PercentChange As Double
PercentChange = 0
Dim TotalStockVolume As Double
TotalStockVolume = 0

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

'Data starts on row 2
Dim SummaryTableRow As Long
SummaryTableRow = 2

'Assign variable to the last row
Dim lastrow As Long
lastrow = CWS.Cells(Rows.Count, 1).End(xlUp).Row

    'Assigning Open Price
    TotalOpen = CWS.Cells(2, 3).Value
    'Creating for loop with the assigned variables
    For i = 2 To lastrow
        'Entering Ticker
        If CWS.Cells(i + 1, 1).Value <> CWS.Cells(i, 1).Value Then
            Tickername = CWS.Cells(i, 1).Value
        
            'Entering Yearly Change
            TotalClose = CWS.Cells(i, 6).Value
            YearlyChange = TotalClose - TotalOpen
        
            'Entering Percent Change
            If TotalOpen <> 0 Then
                PercentChange = (YearlyChange / TotalOpen) * 100
            End If

            'Entering Stock Volume
            TotalStockVolume = TotalStockVolume + CWS.Cells(i, 7).Value
            
            'Entering Results into Cells
            CWS.Range("I" & SummaryTableRow).Value = Tickername
            CWS.Range("J" & SummaryTableRow).Value = YearlyChange
            CWS.Range("L" & SummaryTableRow).Value = TotalStockVolume
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
           
            'Print next Tickername row
            SummaryTableRow = SummaryTableRow + 1
        
            'Reset the values for the next ticker
            YearlyChange = 0
            TotalOpen = CWS.Cells(i + 1, 3).Value
            TotalClose = 0
            
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
            
            'Reset the values for the next ticker
            PercentChange = 0
            TotalStockVolume = 0
            
        Else
            TotalStockVolume = TotalStockVolume + CWS.Cells(i, 7).Value
        End If
    Next i
    
    'To Autofit the used columns
    Dim j As Integer
    For j = 1 To CWS.UsedRange.Columns.Count
    CWS.Columns(j).EntireColumn.AutoFit
    Next j
    
Next CWS
End Sub