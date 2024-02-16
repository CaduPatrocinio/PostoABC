object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Abastecimento'
  ClientHeight = 442
  ClientWidth = 806
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 12
    Top = 48
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 262
    Top = 48
    Width = 38
    Height = 15
    Caption = 'Bomba'
  end
  object Label3: TLabel
    Left = 469
    Top = 48
    Width = 57
    Height = 15
    Caption = 'Pre'#231'o Litro'
  end
  object Label4: TLabel
    Left = 140
    Top = 48
    Width = 55
    Height = 15
    Caption = 'Data/Hora'
  end
  object Label5: TLabel
    Left = 597
    Top = 48
    Width = 73
    Height = 15
    Caption = 'Perc. Imposto'
  end
  object Label6: TLabel
    Left = 12
    Top = 104
    Width = 56
    Height = 15
    Caption = 'Qtde. Litro'
  end
  object Label7: TLabel
    Left = 140
    Top = 104
    Width = 73
    Height = 15
    Caption = 'Valor Imposto'
  end
  object Label8: TLabel
    Left = 391
    Top = 104
    Width = 25
    Height = 15
    Caption = 'Total'
  end
  object Label9: TLabel
    Left = 268
    Top = 104
    Width = 48
    Height = 15
    Caption = 'Sub Total'
  end
  object edtCodAbstecimento: TEdit
    Left = 8
    Top = 69
    Width = 121
    Height = 23
    Alignment = taRightJustify
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 0
  end
  object edtVlLitro: TEdit
    Left = 469
    Top = 69
    Width = 121
    Height = 23
    Alignment = taRightJustify
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object DbgTanque: TDBGrid
    Left = 8
    Top = 166
    Width = 793
    Height = 259
    DataSource = DsAbastecimento
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = DbgTanqueKeyDown
    OnMouseUp = DbgTanqueMouseUp
    Columns = <
      item
        Expanded = False
        FieldName = 'DT_ABASTECIMENTO'
        Title.Caption = 'Data'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_LITRO'
        Title.Caption = 'Valor Litro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERC_IMPOSTO'
        Title.Caption = 'Perc Imposto'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE_LITROS'
        Title.Caption = 'Qtde. Litro'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUB_TOTAL'
        Title.Caption = 'Sub Total'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_IMPOSTO'
        Title.Caption = 'Total Imposto'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Caption = 'Valor Total'
        Width = 100
        Visible = True
      end>
  end
  object btnNovo: TBitBtn
    Left = 7
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Novo'
    TabOrder = 3
    OnClick = btnNovoClick
  end
  object btnSalvar: TBitBtn
    Left = 172
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object btnAlterar: TBitBtn
    Left = 88
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Alterar'
    TabOrder = 5
    OnClick = btnAlterarClick
  end
  object btnExcluir: TBitBtn
    Left = 334
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Excluir'
    TabOrder = 6
    OnClick = btnExcluirClick
  end
  object btnSair: TBitBtn
    Left = 718
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Sai&r'
    TabOrder = 7
    OnClick = btnSairClick
  end
  object DblBomba: TDBLookupComboBox
    Left = 262
    Top = 69
    Width = 201
    Height = 23
    DataField = 'ID_BOMBA'
    DataSource = DsAbastecimento
    KeyField = 'ID_BOMBA'
    ListField = 'DESCRICAO'
    ListSource = DsBomba
    TabOrder = 8
    OnCloseUp = DblBombaCloseUp
  end
  object edtData: TEdit
    Left = 135
    Top = 69
    Width = 121
    Height = 23
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 9
  end
  object edtPercImposto: TEdit
    Left = 597
    Top = 69
    Width = 121
    Height = 23
    Alignment = taRightJustify
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 10
  end
  object edtQtdeLitro: TEdit
    Left = 8
    Top = 125
    Width = 121
    Height = 23
    Alignment = taRightJustify
    TabOrder = 11
    OnChange = edtQtdeLitroChange
  end
  object edtVlImposto: TEdit
    Left = 135
    Top = 125
    Width = 121
    Height = 23
    Alignment = taRightJustify
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 12
  end
  object edtTotal: TEdit
    Left = 388
    Top = 125
    Width = 121
    Height = 23
    Alignment = taRightJustify
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 13
  end
  object edtSubTotal: TEdit
    Left = 262
    Top = 125
    Width = 121
    Height = 23
    Alignment = taRightJustify
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 14
  end
  object btnCancelar: TBitBtn
    Left = 253
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 15
    OnClick = btnCancelarClick
  end
  object FdmtAbastecimento: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 195
    Top = 215
    object FdmtAbastecimentoID_ABASTECIMENTO: TIntegerField
      FieldName = 'ID_ABASTECIMENTO'
      Origin = 'ID_ABASTECIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FdmtAbastecimentoID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
      Required = True
    end
    object FdmtAbastecimentoDT_ABASTECIMENTO: TSQLTimeStampField
      FieldName = 'DT_ABASTECIMENTO'
      Origin = 'DT_ABASTECIMENTO'
      Required = True
    end
    object FdmtAbastecimentoVALOR_LITRO: TFMTBCDField
      FieldName = 'VALOR_LITRO'
      Origin = 'VALOR_LITRO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object FdmtAbastecimentoPERC_IMPOSTO: TFMTBCDField
      FieldName = 'PERC_IMPOSTO'
      Origin = 'PERC_IMPOSTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 1
    end
    object FdmtAbastecimentoQTDE_LITROS: TIntegerField
      FieldName = 'QTDE_LITROS'
      Origin = 'QTDE_LITROS'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object FdmtAbastecimentoSUB_TOTAL: TFMTBCDField
      FieldName = 'SUB_TOTAL'
      Origin = 'SUB_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object FdmtAbastecimentoVALOR_IMPOSTO: TFMTBCDField
      FieldName = 'VALOR_IMPOSTO'
      Origin = 'VALOR_IMPOSTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object FdmtAbastecimentoVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object DsAbastecimento: TDataSource
    DataSet = FdmtAbastecimento
    Left = 319
    Top = 208
  end
  object FdmtBomba: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 575
    Top = 199
    object FdmtBombaID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FdmtBombaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 80
    end
    object FdmtBombaVALOR_LITRO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_LITRO'
      Origin = 'VALOR_LITRO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FdmtBombaPERC_IMPOSTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PERC_IMPOSTO'
      Origin = 'PERC_IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object DsBomba: TDataSource
    DataSet = FdmtBomba
    Left = 647
    Top = 200
  end
end
