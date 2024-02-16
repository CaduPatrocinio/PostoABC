unit uAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, uControleAbastecimento, uEnumerado;

type
  TfrmAbastecimento = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodAbstecimento: TEdit;
    edtVlLitro: TEdit;
    DbgTanque: TDBGrid;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    FdmtAbastecimento: TFDMemTable;
    DsAbastecimento: TDataSource;
    DblBomba: TDBLookupComboBox;
    edtData: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtPercImposto: TEdit;
    Label6: TLabel;
    edtQtdeLitro: TEdit;
    Label7: TLabel;
    edtVlImposto: TEdit;
    edtTotal: TEdit;
    Label8: TLabel;
    edtSubTotal: TEdit;
    Label9: TLabel;
    FdmtBomba: TFDMemTable;
    DsBomba: TDataSource;
    FdmtAbastecimentoID_ABASTECIMENTO: TIntegerField;
    FdmtAbastecimentoID_BOMBA: TIntegerField;
    FdmtAbastecimentoDT_ABASTECIMENTO: TSQLTimeStampField;
    FdmtAbastecimentoVALOR_LITRO: TFMTBCDField;
    FdmtAbastecimentoPERC_IMPOSTO: TFMTBCDField;
    FdmtAbastecimentoQTDE_LITROS: TIntegerField;
    FdmtAbastecimentoSUB_TOTAL: TFMTBCDField;
    FdmtAbastecimentoVALOR_IMPOSTO: TFMTBCDField;
    FdmtAbastecimentoVALOR_TOTAL: TFMTBCDField;
    FdmtBombaID_BOMBA: TIntegerField;
    FdmtBombaDESCRICAO: TStringField;
    FdmtBombaVALOR_LITRO: TFMTBCDField;
    FdmtBombaPERC_IMPOSTO: TFMTBCDField;
    btnCancelar: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DblBombaCloseUp(Sender: TObject);
    procedure DbgTanqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbgTanqueMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtQtdeLitroChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
    FControleAbastecimento: TAbastecimentoControl;

    procedure CarregarAbastecimento;
    procedure CarregarBomba;
    procedure CarregarEdits;
    procedure LimpaEdits;
    procedure CalculaToral;
  public
    { Public declarations }
  end;

var
  frmAbastecimento: TfrmAbastecimento;

implementation

{$R *.dfm}

procedure TfrmAbastecimento.btnAlterarClick(Sender: TObject);
begin
 { FControleAbastecimento.AbastecimentoModel.Acao     := uEnumerado.tacAlterar;
  FControleAbastecimento.AbastecimentoModel.IdBomba  := StrToInt(edtCodBomba.Text);
  FControleAbastecimento.AbastecimentoModel.Bomba    := edtBomba.Text;
  FControleAbastecimento.AbastecimentoModel.IdTanque := FdmtTanqueID_TANQUE.AsInteger;
  if FControleAbastecimento.Salvar() then
    ShowMessage('Alterado com sucesso.');
  Self.CarregarBomba();      }
end;

procedure TfrmAbastecimento.btnCancelarClick(Sender: TObject);
begin
  CarregarEdits;
end;

procedure TfrmAbastecimento.btnExcluirClick(Sender: TObject);
var VCodigo: String;
begin
  VCodigo := InputBox('Excluir', 'Digite o c�digo do abastecimeto', EmptyStr);
  if VCodigo.Trim <> EmptyStr then
  begin
    if (Application.MessageBox(PChar('Deseja excluir o registro?'), 'Confirma��o', MB_YESNO
      + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes) then
    begin
     FControleAbastecimento.AbastecimentoModel.Acao := uEnumerado.tacExcluir;
     FControleAbastecimento.AbastecimentoModel.IdAbastecimento := StrToInt(edtCodAbstecimento.Text);
     if FControleAbastecimento.Salvar() then
       ShowMessage('Excluido com sucesso.');
     Self.CarregarAbastecimento();
    end;
  end;
end;

procedure TfrmAbastecimento.btnNovoClick(Sender: TObject);
begin
  LimpaEdits;
  FdmtAbastecimento.Insert;
  FControleAbastecimento.AbastecimentoModel.IdAbastecimento := FControleAbastecimento.AbastecimentoModel.GetId(1);
  edtCodAbstecimento.Text := FControleAbastecimento.AbastecimentoModel.IdAbastecimento.ToString();
  DblBomba.SetFocus();
end;

procedure TfrmAbastecimento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAbastecimento.btnSalvarClick(Sender: TObject);
begin
  FControleAbastecimento.AbastecimentoModel.Acao := uEnumerado.tacIncluir;
  FControleAbastecimento.AbastecimentoModel.IdAbastecimento := StrToInt(edtCodAbstecimento.Text);
  FControleAbastecimento.AbastecimentoModel.IdBomba := FdmtBombaID_BOMBA.AsInteger;
  FControleAbastecimento.AbastecimentoModel.VlLitro := FdmtBombaVALOR_LITRO.AsFloat;
  FControleAbastecimento.AbastecimentoModel.PercImposto := FdmtBombaPERC_IMPOSTO.AsFloat;
  FControleAbastecimento.AbastecimentoModel.QtdeLitros  := StrToFloat(edtQtdeLitro.Text);
  FControleAbastecimento.AbastecimentoModel.TotalImposto := StrToFloat(edtVlImposto.Text);
  FControleAbastecimento.AbastecimentoModel.SubTotal := StrToFloat(edtSubTotal.Text);
  FControleAbastecimento.AbastecimentoModel.VlTotal  := StrToFloat(edtTotal.Text);

  if FControleAbastecimento.Salvar() then
    ShowMessage('Incluido com sucesso.');
  Self.CarregarAbastecimento();
end;

procedure TfrmAbastecimento.CalculaToral;
var Preco, Imposto, QtdeLitro, VlImposto, SubTotal, Total : double;
begin
  Preco     := StrToFloat(edtVlLitro.Text);
  Imposto   := StrToFloat(edtPercImposto.Text);
  QtdeLitro := StrToFloat(edtQtdeLitro.Text);
  VlImposto := ((Preco*QtdeLitro*Imposto)/100);
  SubTotal  :=  (Preco*QtdeLitro);
  Total     :=  (SubTotal+VlImposto);
  edtVlImposto.Text := FormatFloat('#,##0.00', VlImposto);
  edtSubTotal.Text  := FormatFloat('#,##0.00', SubTotal);
  edtTotal.Text     := FormatFloat('#,##0.00', Total);
end;

procedure TfrmAbastecimento.CarregarAbastecimento;
var VQry: TFDQuery;
begin
  FdmtAbastecimento.Close;
  VQry := FControleAbastecimento.Obter;
  try
    VQry.FetchAll;
    FdmtAbastecimento.Data := VQry.Data;
  finally
    VQry.Close;
    VQry.Free;
  end;
end;

procedure TfrmAbastecimento.CarregarBomba;
var VQry: TFDQuery;
begin
  FdmtBomba.Close;
  VQry := FControleAbastecimento.ObterBomba;
  try
    VQry.FetchAll;
    FdmtBomba.Data := VQry.Data;
  finally
    VQry.Close;
    VQry.Free;
  end;
end;

procedure TfrmAbastecimento.CarregarEdits;
begin
  edtCodAbstecimento.Text := FdmtAbastecimento.Fields[0].AsString;
  edtData.Text      := FormatDateTime('DD/MM/YYYY - hh:mm', FdmtAbastecimento.Fields[2].AsDateTime);
  edtVlLitro.Text   := FormatFloat('#,##0.00', FdmtAbastecimento.Fields[3].AsFloat);
  edtPercImposto.Text := FormatFloat('#,##0.00', FdmtAbastecimento.Fields[4].AsFloat);
  edtQtdeLitro.Text := FormatFloat('#,##0.00', FdmtAbastecimento.Fields[5].AsFloat);
  edtVlImposto.Text := FormatFloat('#,##0.00', FdmtAbastecimento.Fields[6].AsFloat);
  edtSubTotal.Text  := FormatFloat('#,##0.00', FdmtAbastecimento.Fields[7].AsFloat);
  edtTotal.Text     := FormatFloat('#,##0.00', FdmtAbastecimento.Fields[8].AsFloat);
end;

procedure TfrmAbastecimento.DbgTanqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Self.CarregarEdits();
end;

procedure TfrmAbastecimento.DbgTanqueMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Self.CarregarEdits();
end;

procedure TfrmAbastecimento.DblBombaCloseUp(Sender: TObject);
begin
  edtVlLitro.Text := FormatFloat('#,##0.00', FdmtBombaVALOR_LITRO.AsFloat);
  edtPercImposto.Text := FormatFloat('#,##0.00', FdmtBombaPERC_IMPOSTO.AsFloat);

  if trim(edtQtdeLitro.Text)<> '' then
    Self.CalculaToral;
end;

procedure TfrmAbastecimento.edtQtdeLitroChange(Sender: TObject);
begin
  if (edtQtdeLitro.Text) <>'' then
     Self.CalculaToral;
end;

procedure TfrmAbastecimento.FormCreate(Sender: TObject);
begin
  FControleAbastecimento := TAbastecimentoControl.Create;
end;

procedure TfrmAbastecimento.FormDestroy(Sender: TObject);
begin
  FControleAbastecimento.Free;
end;

procedure TfrmAbastecimento.FormShow(Sender: TObject);
begin
  Self.CarregarAbastecimento();
  Self.CarregarBomba();
  if FdmtBomba.RecordCount > 0 then
  begin
    Self.CarregarEdits();
  end;
end;

procedure TfrmAbastecimento.LimpaEdits;
var i: integer;
begin
  for i := 0 to Self.ControlCount - 1 do
    if (Self.Controls[i] is TEdit) then
      (Controls[i] as TEdit).Clear;
end;

end.
