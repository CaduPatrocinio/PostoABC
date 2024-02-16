unit uCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  uControleCombustivel, uEnumerado;

type
  TfrmCombustivel = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    edtCodCombustivel: TEdit;
    edtCombustivel: TEdit;
    DbgCombustivel: TDBGrid;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    FdmtCombustivel: TFDMemTable;
    DsCombustivel: TDataSource;
    edtPercImposto: TEdit;
    edtPreco: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    btnCancelar: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DbgCombustivelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbgCombustivelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    FControleCombustivel: TCombustivelControl;

    procedure CarregarCombustivel;
    procedure CarregarEdits;
  public
    { Public declarations }
  end;

var
  frmCombustivel: TfrmCombustivel;

implementation

{$R *.dfm}

procedure TfrmCombustivel.btnAlterarClick(Sender: TObject);
begin
  FControleCombustivel.CombustivelModel.Acao          := uEnumerado.tacAlterar;
  FControleCombustivel.CombustivelModel.IdCombustivel := StrToInt(edtCodCombustivel.Text);
  FControleCombustivel.CombustivelModel.Combustivel   := edtCombustivel.Text;
  FControleCombustivel.CombustivelModel.VlLitro       := StrToFloat(edtPreco.Text);
  FControleCombustivel.CombustivelModel.PercImposto   := StrToFloat(edtPercImposto.Text);
  if FControleCombustivel.Salvar() then
    ShowMessage('Alterado com sucesso.');
  Self.CarregarCombustivel();
end;

procedure TfrmCombustivel.btnCancelarClick(Sender: TObject);
begin
  CarregarEdits();
end;

procedure TfrmCombustivel.btnExcluirClick(Sender: TObject);
var VCodigo: String;
begin
  VCodigo := InputBox('Excluir', 'Digite o c�digo da bomba', EmptyStr);
  if VCodigo.Trim <> EmptyStr then
  begin
    if (Application.MessageBox(PChar('Deseja excluir o registro?'), 'Confirma��o', MB_YESNO
      + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes) then
    begin
     FControleCombustivel.CombustivelModel.Acao := uEnumerado.tacExcluir;
     FControleCombustivel.CombustivelModel.IdCombustivel := StrToInt(edtCodCombustivel.Text);
     if FControleCombustivel.Salvar() then
       ShowMessage('Excluido com sucesso.');
     Self.CarregarCombustivel();
    end;
  end;
end;

procedure TfrmCombustivel.btnNovoClick(Sender: TObject);
begin
  FControleCombustivel.CombustivelModel.IdCombustivel := FControleCombustivel.CombustivelModel.GetId(1);
  edtCodCombustivel.Text := FControleCombustivel.CombustivelModel.IdCombustivel.ToString();
  edtCombustivel.Clear;
  edtCombustivel.SetFocus();
end;

procedure TfrmCombustivel.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCombustivel.btnSalvarClick(Sender: TObject);
begin
  FControleCombustivel.CombustivelModel.Acao        := uEnumerado.tacIncluir;
  FControleCombustivel.CombustivelModel.Combustivel := edtCombustivel.Text;
  FControleCombustivel.CombustivelModel.VlLitro     := StrToFloat(edtPreco.Text);
  FControleCombustivel.CombustivelModel.PercImposto := StrToFloat(edtPercImposto.Text);
  if FControleCombustivel.Salvar() then
    ShowMessage('Incluido com sucesso.');
  Self.CarregarCombustivel();
end;

procedure TfrmCombustivel.CarregarCombustivel;
var VQry: TFDQuery;
begin
  FdmtCombustivel.Close;
  VQry := FControleCombustivel.Obter;
  try
    VQry.FetchAll;
    FdmtCombustivel.Data := VQry.Data;
  finally
    VQry.Close;
    VQry.Free;
  end;
end;

procedure TfrmCombustivel.CarregarEdits;
begin
  edtCodCombustivel.Text := FdmtCombustivel.Fields[0].AsString;
  edtCombustivel.Text    := FdmtCombustivel.Fields[1].AsString;
  edtPreco.Text          := FdmtCombustivel.Fields[2].AsString;
  edtPercImposto.Text    := FdmtCombustivel.Fields[3].AsString;
end;

procedure TfrmCombustivel.DbgCombustivelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Self.CarregarEdits();
end;

procedure TfrmCombustivel.DbgCombustivelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Self.CarregarEdits();
end;

procedure TfrmCombustivel.FormCreate(Sender: TObject);
begin
  FControleCombustivel := TCombustivelControl.Create;
end;

procedure TfrmCombustivel.FormDestroy(Sender: TObject);
begin
  FControleCombustivel.Free;
end;

procedure TfrmCombustivel.FormShow(Sender: TObject);
begin
  Self.CarregarCombustivel();
  if FdmtCombustivel.RecordCount > 0 then
  begin
    Self.CarregarEdits();
  end;
end;

end.
