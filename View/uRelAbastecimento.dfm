object frmRelAbastecimento: TfrmRelAbastecimento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Abastecimento'
  ClientHeight = 154
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 25
    Top = 11
    Width = 58
    Height = 15
    Caption = 'Data Inicial'
  end
  object Label2: TLabel
    Left = 179
    Top = 11
    Width = 52
    Height = 15
    Caption = 'Data Final'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 135
    Width = 342
    Height = 19
    Panels = <>
    ExplicitTop = 663
    ExplicitWidth = 815
  end
  object DtIncio: TDateTimePicker
    Left = 23
    Top = 32
    Width = 150
    Height = 23
    Date = 45338.000000000000000000
    Time = 0.444443032407434700
    TabOrder = 1
  end
  object DtFim: TDateTimePicker
    Left = 179
    Top = 32
    Width = 150
    Height = 23
    Date = 45338.000000000000000000
    Time = 0.444443032407434700
    TabOrder = 2
  end
  object btnOk: TButton
    Left = 25
    Top = 88
    Width = 129
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnSair: TButton
    Left = 200
    Top = 88
    Width = 129
    Height = 25
    Caption = '&Sair'
    TabOrder = 4
    OnClick = btnSairClick
  end
  object RLReport1: TRLReport
    Left = 0
    Top = 183
    Width = 794
    Height = 1123
    DataSource = DsRel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    FooterMeasuring = fmBeforeDetail
    object RLGroup1: TRLGroup
      Left = 38
      Top = 38
      Width = 718
      Height = 83
      DataFields = 'DATA'
      FooterMeasuring = fmBeforeDetail
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        BandType = btColumnHeader
        Color = cl3DLight
        ParentColor = False
        Transparent = False
        object RLLabel1: TRLLabel
          Left = 4
          Top = 0
          Width = 35
          Height = 15
          Caption = 'Data'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLLabel3: TRLLabel
          Left = 113
          Top = 0
          Width = 49
          Height = 14
          Caption = 'Tanque'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLLabel4: TRLLabel
          Left = 348
          Top = 0
          Width = 42
          Height = 14
          Caption = 'Bomba'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
        object RLLabel2: TRLLabel
          Left = 530
          Top = 0
          Width = 42
          Height = 14
          Caption = 'Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 16
        Width = 718
        Height = 17
        object RLDBText3: TRLDBText
          Left = 115
          Top = 1
          Width = 49
          Height = 14
          DataField = 'TANQUE'
          DataSource = DsRel
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 348
          Top = 1
          Width = 42
          Height = 15
          DataField = 'BOMBA'
          DataSource = DsRel
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 4
          Top = 1
          Width = 35
          Height = 14
          DataField = 'DATA'
          DataSource = DsRel
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object RLDBText2: TRLDBText
          Left = 530
          Top = 0
          Width = 42
          Height = 15
          Alignment = taRightJustify
          DataField = 'TOTAL'
          DataSource = DsRel
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 19
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLLabel6: TRLLabel
          Left = 394
          Top = 2
          Width = 98
          Height = 16
          Caption = 'Total do dia:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBResult1: TRLDBResult
          Left = 498
          Top = 3
          Width = 133
          Height = 14
          DataField = 'TOTAL'
          DataSource = DsRel
          DisplayMask = 'R$ #,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          Info = riSum
          ParentFont = False
          Text = ''
          OnCompute = RLDBResult1Compute
        end
      end
    end
  end
  object DsRel: TDataSource
    DataSet = FdqRel
    Left = 175
    Top = 74
  end
  object FdqRel: TFDQuery
    Active = True
    Connection = DmDados.FDConnection
    Transaction = DmDados.FDTransacao
    SQL.Strings = (
      
        'SELECT CAST(A.DT_ABASTECIMENTO AS DATE) AS Data, T.DESCRICAO AS ' +
        'Tanque, B.DESCRICAO AS Bomba,A.VALOR_TOTAL As Total'
      ' FROM ABASTECIMENTO A'
      ' LEFT JOIN BOMBA B ON B.ID_BOMBA = A.ID_BOMBA'
      ' LEFT JOIN TANQUE T ON T.ID_TANQUE = B.ID_TANQUE'
      
        ' WHERE CAST(A.DT_ABASTECIMENTO AS DATE) BETWEEN '#39'02/01/2024'#39'AND ' +
        #39'02/16/2024'#39
      'ORDER BY A.DT_ABASTECIMENTO')
    Left = 112
    Top = 73
    object FdqRelDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object FdqRelTANQUE: TStringField
      FieldName = 'TANQUE'
      Origin = 'TANQUE'
      Size = 40
    end
    object FdqRelBOMBA: TStringField
      FieldName = 'BOMBA'
      Origin = 'BOMBA'
      Size = 80
    end
    object FdqRelTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
end
