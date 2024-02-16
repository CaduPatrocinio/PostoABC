unit uRelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, System.DateUtils,
   uAbastecimentoModel, uControleAbastecimento, uEnumerado, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Grids, Vcl.DBGrids,
  RLReport;

type
  TfrmRelAbastecimento = class(TForm)
    StatusBar1: TStatusBar;
    DtIncio: TDateTimePicker;
    DtFim: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TButton;
    btnSair: TButton;
    DsRel: TDataSource;
    FdqRel: TFDQuery;
    FdqRelDATA: TDateField;
    FdqRelTANQUE: TStringField;
    FdqRelBOMBA: TStringField;
    FdqRelTOTAL: TFMTBCDField;
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand2: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText1: TRLDBText;
    RLBand3: TRLBand;
    RLLabel6: TRLLabel;
    RLLabel2: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBResult1: TRLDBResult;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure RLDBResult1Compute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
  private
    { Private declarations }
  FControleAbastecimento: TAbastecimentoControl;

  public
    { Public declarations }
  end;

var
  frmRelAbastecimento: TfrmRelAbastecimento;

implementation
uses uControleSistema, uDados;

{$R *.dfm}


procedure TfrmRelAbastecimento.btnOkClick(Sender: TObject);
var Sql : String;
begin
 if DtIncio.Date < DtFim.Date then
  begin
   FControleAbastecimento.AbastecimentoModel.DataInicial := DtIncio.Date;
   FControleAbastecimento.AbastecimentoModel.DataFinal   := DtFim.Date;

   Sql := 'SELECT CAST(A.DT_ABASTECIMENTO AS DATE) AS Data, T.DESCRICAO AS Tanque, B.DESCRICAO AS Bomba,'+
           'A.VALOR_TOTAL  As Total '+
           'FROM ABASTECIMENTO A '+
           'LEFT JOIN BOMBA B ON B.ID_BOMBA = A.ID_BOMBA '+
           'LEFT JOIN TANQUE T ON T.ID_TANQUE = B.ID_TANQUE '+
           'WHERE CAST(A.DT_ABASTECIMENTO AS DATE) BETWEEN '+
            QuotedStr(FormatDateTime('MM/DD/YYYY',DtIncio.Date)) +
           'AND '+
            QuotedStr(FormatDateTime('MM/DD/YYYY',DtFim.Date))+
           ' ORDER BY A.DT_ABASTECIMENTO, T.DESCRICAO, B.DESCRICAO';

   FdqRel.Close;
   FdqRel.Open(Sql);
   RLReport1.Preview();
  end
  else
    ShowMessage('A data inicial n�o pode ser maior que a data final!');
end;

procedure TfrmRelAbastecimento.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelAbastecimento.FormCreate(Sender: TObject);
begin
  FControleAbastecimento := TAbastecimentoControl.Create;
  DtIncio.Date := StartOfTheMonth(Date);
  DtFim.Date := Date;
end;
procedure TfrmRelAbastecimento.RLDBResult1Compute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value := FdqRelTOTAL.AsCurrency ;
end;

end.
