object frmCombustivel: TfrmCombustivel
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Combustivel'
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
    Width = 109
    Height = 15
    Caption = 'C'#243'digo Combust'#237'vel'
  end
  object Label3: TLabel
    Left = 12
    Top = 99
    Width = 138
    Height = 15
    Caption = 'Descri'#231#227'o do Combust'#237'vel'
  end
  object Label2: TLabel
    Left = 8
    Top = 151
    Width = 65
    Height = 15
    Caption = 'Pre'#231'o Venda'
  end
  object Label4: TLabel
    Left = 135
    Top = 151
    Width = 73
    Height = 15
    Caption = 'Perc. Imposto'
  end
  object edtCodCombustivel: TEdit
    Left = 7
    Top = 67
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object edtCombustivel: TEdit
    Left = 7
    Top = 119
    Width = 289
    Height = 23
    TabOrder = 1
  end
  object DbgCombustivel: TDBGrid
    Left = 8
    Top = 221
    Width = 670
    Height = 213
    DataSource = DsCombustivel
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = DbgCombustivelKeyDown
    OnMouseUp = DbgCombustivelMouseUp
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
  object edtPercImposto: TEdit
    Left = 135
    Top = 172
    Width = 121
    Height = 23
    TabOrder = 8
  end
  object edtPreco: TEdit
    Left = 8
    Top = 172
    Width = 121
    Height = 23
    TabOrder = 9
  end
  object btnCancelar: TBitBtn
    Left = 253
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 10
    OnClick = btnCancelarClick
  end
  object FdmtCombustivel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 247
    Top = 47
  end
  object DsCombustivel: TDataSource
    DataSet = FdmtCombustivel
    Left = 343
    Top = 48
  end
end
