unit uTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  uControleTanque, uEnumerado, Vcl.DBCtrls;

type
  TfrmTanque = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodTanque: TEdit;
    edtTanque: TEdit;
    DbgTanque: TDBGrid;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    FdmtTanque: TFDMemTable;
    DsTanque: TDataSource;
    FdmtCombustivel: TFDMemTable;
    DsCombustivel: TDataSource;
    DblCombustivel: TDBLookupComboBox;
    FdmtTanqueID_COMBUSTIVEL: TIntegerField;
    FdmtTanqueDESCRICAO: TStringField;
    FdmtCombustivelID_COMBUSTIVEL: TIntegerField;
    FdmtCombustivelDESCRICAO: TStringField;
    btnCancelar: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FControleTanque: TTanqueControl;

    procedure CarregarTanque;
    procedure CarregarCombustivel;
    procedure CarregarEdits;
  public
    { Public declarations }
  end;

var
  frmTanque: TfrmTanque;

implementation

{$R *.dfm}

procedure TfrmTanque.btnAlterarClick(Sender: TObject);
begin
  FControleTanque.TanqueModel.Acao     := uEnumerado.tacAlterar;
  FControleTanque.TanqueModel.IdTanque := StrToInt(edtCodTanque.Text);
  FControleTanque.TanqueModel.Tanque   := edtTanque.Text;
  FControleTanque.TanqueModel.IdCombustivel := FdmtCombustivelID_COMBUSTIVEL.AsInteger;
  if FControleTanque.Salvar() then
    ShowMessage('Alterado com sucesso.');
  Self.CarregarTanque();
end;

procedure TfrmTanque.btnCancelarClick(Sender: TObject);
begin
  CarregarEdits();
end;

procedure TfrmTanque.btnExcluirClick(Sender: TObject);
var VCodigo: String;
begin
  VCodigo := InputBox('Excluir', 'Digite o c�digo do tanque', EmptyStr);
  if VCodigo.Trim <> EmptyStr then
  begin
    if (Application.MessageBox(PChar('Deseja excluir o registro?'), 'Confirma��o', MB_YESNO
      + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes) then
    begin
      FControleTanque.TanqueModel.Acao := uEnumerado.tacExcluir;
      FControleTanque.TanqueModel.IdTanque := StrToInt(edtCodTanque.Text);
      if FControleTanque.Salvar() then
        ShowMessage('Excluido com sucesso.');
      Self.CarregarTanque();
    end;
  end;
end;

procedure TfrmTanque.btnNovoClick(Sender: TObject);
begin
  FControleTanque.TanqueModel.IdTanque := FControleTanque.TanqueModel.GetId(1);
  edtCodTanque.Text := FControleTanque.TanqueModel.IdTanque.ToString();
  edtTanque.Clear;
  edtTanque.SetFocus();
end;

procedure TfrmTanque.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTanque.btnSalvarClick(Sender: TObject);
begin
   FControleTanque.TanqueModel.Acao   := uEnumerado.tacIncluir;
   FControleTanque.TanqueModel.Tanque := edtTanque.Text;
   FControleTanque.TanqueModel.IdCombustivel := FdmtCombustivelID_COMBUSTIVEL.AsInteger;

  if FControleTanque.Salvar() then
    ShowMessage('Incluido com sucesso.');
  Self.CarregarTanque();
end;

procedure TfrmTanque.CarregarCombustivel;
var VQry: TFDQuery;
begin
  FdmtCombustivel.Close;
  VQry := FControleTanque.ObterCombustivel;
  try
    VQry.FetchAll;
    FdmtCombustivel.Data := VQry.Data;
  finally
    VQry.Close;
    VQry.Free;
  end;
end;

procedure TfrmTanque.CarregarEdits;
begin
  edtCodTanque.Text := FdmtTanque.Fields[0].AsString;
  edtTanque.Text    := FdmtTanque.Fields[1].AsString;
end;

procedure TfrmTanque.CarregarTanque;
var VQry: TFDQuery;
begin
  FdmtTanque.Close;
  VQry := FControleTanque.Obter;
  try
    VQry.FetchAll;
    FdmtTanque.Data := VQry.Data;
  finally
    VQry.Close;
    VQry.Free;
  end;
end;

procedure TfrmTanque.FormCreate(Sender: TObject);
begin
  FControleTanque := TTanqueControl.Create;
end;

procedure TfrmTanque.FormDestroy(Sender: TObject);
begin
  FControleTanque.Free;
end;

procedure TfrmTanque.FormShow(Sender: TObject);
begin
  Self.CarregarTanque();
  Self.CarregarCombustivel();
  if FdmtTanque.RecordCount > 0 then
  begin
    Self.CarregarEdits();
  end;
end;

end.
