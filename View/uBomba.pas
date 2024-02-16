unit uBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  uControleBomba, uEnumerado, Vcl.DBCtrls;

type
  TfrmBomba = class(TForm)
    edtCodBomba: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtBomba: TEdit;
    DbgCombustivel: TDBGrid;
    FdmtBomba: TFDMemTable;
    DsBomba: TDataSource;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    DblTanque: TDBLookupComboBox;
    FdmtBombaID_TANQUE: TIntegerField;
    FdmtBombaID_BOMBA: TIntegerField;
    FdmtBombaDESCRICAO: TStringField;
    FdmtTanque: TFDMemTable;
    FdmtTanqueID_TANQUE: TIntegerField;
    FdmtTanqueDESCRICAO: TStringField;
    DsTanque: TDataSource;
    btnCancelar: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbgCombustivelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbgCombustivelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
   FControleBomba: TBombaControl;

    procedure CarregarBomba;
    procedure CarregarTanque;
    procedure CarregarEdits;
  public
    { Public declarations }
  end;

var
  frmBomba: TfrmBomba;

implementation

{$R *.dfm}

{ TfrmBomba }

procedure TfrmBomba.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBomba.btnAlterarClick(Sender: TObject);
begin
  FControleBomba.BombaModel.Acao     := uEnumerado.tacAlterar;
  FControleBomba.BombaModel.IdBomba  := StrToInt(edtCodBomba.Text);
  FControleBomba.BombaModel.Bomba    := edtBomba.Text;
  FControleBomba.BombaModel.IdTanque := FdmtTanqueID_TANQUE.AsInteger;
  if FControleBomba.Salvar() then
    ShowMessage('Alterado com sucesso.');
  Self.CarregarBomba();
end;

procedure TfrmBomba.btnCancelarClick(Sender: TObject);
begin
  CarregarEdits();
end;

procedure TfrmBomba.btnExcluirClick(Sender: TObject);
var VCodigo: String;
begin
  VCodigo := InputBox('Excluir', 'Digite o c�digo da bomba', EmptyStr);
  if VCodigo.Trim <> EmptyStr then
  begin
    if (Application.MessageBox(PChar('Deseja excluir o registro?'), 'Confirma��o', MB_YESNO
      + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes) then
    begin
     FControleBomba.BombaModel.Acao    := uEnumerado.tacExcluir;
     FControleBomba.BombaModel.IdBomba := StrToInt(edtCodBomba.Text);
     if FControleBomba.Salvar() then
       ShowMessage('Excluido com sucesso.');
     Self.CarregarBomba();
    end;
  end;
end;

procedure TfrmBomba.btnNovoClick(Sender: TObject);
begin
  FControleBomba.BombaModel.IdBomba := FControleBomba.BombaModel.GetId(1);
  edtCodBomba.Text := FControleBomba.BombaModel.IdBomba.ToString();
  edtBomba.Clear;
  edtBomba.SetFocus();
end;

procedure TfrmBomba.btnSalvarClick(Sender: TObject);
begin
  FControleBomba.BombaModel.Acao   := uEnumerado.tacIncluir;
  FControleBomba.BombaModel.Bomba  := edtBomba.Text;
  FControleBomba.BombaModel.IdTanque := FdmtTanqueID_TANQUE.AsInteger;
  if FControleBomba.Salvar() then
    ShowMessage('Incluido com sucesso.');
  Self.CarregarBomba();
end;

procedure TfrmBomba.CarregarBomba;
var VQry: TFDQuery;
begin
  FdmtBomba.Close;
  VQry := FControleBomba.Obter;
  try
    VQry.FetchAll;
    FdmtBomba.Data := VQry.Data;
  finally
    VQry.Close;
    VQry.Free;
  end;
end;

procedure TfrmBomba.CarregarEdits;
begin
  edtCodBomba.Text := FdmtBomba.Fields[0].AsString;
  edtBomba.Text    := FdmtBomba.Fields[2].AsString;
end;

procedure TfrmBomba.CarregarTanque;
var VQry: TFDQuery;
begin
  FdmtTanque.Close;
  VQry := FControleBomba.ObterTanque;
  try
    VQry.FetchAll;
    FdmtTanque.Data := VQry.Data;
  finally
    VQry.Close;
    VQry.Free;
  end;
end;

procedure TfrmBomba.DbgCombustivelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Self.CarregarEdits();
end;

procedure TfrmBomba.DbgCombustivelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Self.CarregarEdits();
end;

procedure TfrmBomba.FormCreate(Sender: TObject);
begin
  FControleBomba := TBombaControl.Create;
end;

procedure TfrmBomba.FormDestroy(Sender: TObject);
begin
  FControleBomba.Free;
end;

procedure TfrmBomba.FormShow(Sender: TObject);
begin
  Self.CarregarBomba();
  Self.CarregarTanque();
  if FdmtBomba.RecordCount > 0 then
  begin
    Self.CarregarEdits();
  end;
end;

end.
