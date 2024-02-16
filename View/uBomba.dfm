object frmBomba: TfrmBomba
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Bomba'
  ClientHeight = 435
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
    Caption = 'C'#243'digo Bomba'
  end
  object Label2: TLabel
    Left = 12
    Top = 151
    Width = 38
    Height = 15
    Caption = 'Tanque'
  end
  object Label3: TLabel
    Left = 12
    Top = 99
    Width = 108
    Height = 15
    Caption = 'Descri'#231#227'o da Bomba'
  end
  object edtCodBomba: TEdit
    Left = 7
    Top = 67
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtBomba: TEdit
    Left = 7
    Top = 119
    Width = 289
    Height = 23
    TabOrder = 1
  end
  object DbgCombustivel: TDBGrid
    Left = 8
    Top = 214
    Width = 670
    Height = 213
    DataSource = DsBomba
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = DbgCombustivelKeyDown
    OnMouseUp = DbgCombustivelMouseUp
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_BOMBA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_TANQUE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
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
    Left = 333
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
  object DblTanque: TDBLookupComboBox
    Left = 8
    Top = 172
    Width = 288
    Height = 23
    DataField = 'ID_TANQUE'
    DataSource = DsBomba
    KeyField = 'ID_TANQUE'
    ListField = 'DESCRICAO'
    ListSource = DsTanque
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
  object FdmtBomba: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 247
    Top = 47
    object FdmtBombaID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
    end
    object FdmtBombaID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
    end
    object FdmtBombaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
  end
  object DsBomba: TDataSource
    DataSet = FdmtBomba
    Left = 319
    Top = 48
  end
  object FdmtTanque: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 440
    Top = 80
    object FdmtTanqueID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
    end
    object FdmtTanqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
  end
  object DsTanque: TDataSource
    DataSet = FdmtTanque
    Left = 511
    Top = 80
  end
end
