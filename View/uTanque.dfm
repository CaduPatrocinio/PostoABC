object frmTanque: TfrmTanque
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Tanque'
  ClientHeight = 442
  ClientWidth = 686
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
    Width = 80
    Height = 15
    Caption = 'C'#243'digo Tanque'
  end
  object Label2: TLabel
    Left = 12
    Top = 151
    Width = 67
    Height = 15
    Caption = 'Combust'#237'vel'
  end
  object Label3: TLabel
    Left = 12
    Top = 99
    Width = 109
    Height = 15
    Caption = 'Descri'#231#227'o do Tanque'
  end
  object edtCodTanque: TEdit
    Left = 8
    Top = 69
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtTanque: TEdit
    Left = 7
    Top = 119
    Width = 289
    Height = 23
    TabOrder = 1
  end
  object DbgTanque: TDBGrid
    Left = 8
    Top = 221
    Width = 670
    Height = 213
    DataSource = DsTanque
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
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
    Left = 335
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Excluir'
    TabOrder = 6
    OnClick = btnExcluirClick
  end
  object btnSair: TBitBtn
    Left = 603
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Sai&r'
    TabOrder = 7
    OnClick = btnSairClick
  end
  object DblCombustivel: TDBLookupComboBox
    Left = 8
    Top = 172
    Width = 266
    Height = 23
    DataField = 'ID_COMBUSTIVEL'
    DataSource = DsTanque
    KeyField = 'ID_COMBUSTIVEL'
    ListField = 'DESCRICAO'
    ListSource = DsCombustivel
    TabOrder = 8
  end
  object btnCancelar: TBitBtn
    Left = 253
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 9
    OnClick = btnCancelarClick
  end
  object FdmtTanque: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 247
    Top = 47
    object FdmtTanqueID_COMBUSTIVEL: TIntegerField
      FieldName = 'ID_COMBUSTIVEL'
    end
    object FdmtTanqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
  end
  object DsTanque: TDataSource
    DataSet = FdmtTanque
    Left = 319
    Top = 48
  end
  object FdmtCombustivel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 423
    Top = 95
    object FdmtCombustivelID_COMBUSTIVEL: TIntegerField
      FieldName = 'ID_COMBUSTIVEL'
    end
    object FdmtCombustivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
  end
  object DsCombustivel: TDataSource
    DataSet = FdmtCombustivel
    Left = 519
    Top = 96
  end
end
