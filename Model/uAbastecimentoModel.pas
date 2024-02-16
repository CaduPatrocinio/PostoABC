unit uAbastecimentoModel;

interface

uses
  uEnumerado, FireDAC.Comp.Client, System.SysUtils;
type
  TAbastecimentoModel = class
  private
    FAcao: TAcao;
    FIdAbastecimento: Integer;
    FIdBomba: Integer;
    FDataInicial : TDate;
    FDataFinal : TDate;
    FQtdeLitros: Double;
    FVlLitro: double;
    FPercImposto: double;
    FSubTotal: double;
    FTotalImposto: double;
    FVlTotal: double;

    procedure SetAcao(const Value: TAcao);
    procedure SetIdAbastecimento(const Value: Integer);
    procedure SetIdBomba(const Value: Integer);
    procedure SetDataInicial(const Value: TDate);
    procedure SetDataFinal(const Value: TDate);
    procedure SetQtdeLitro(const Value: Double);
    procedure SetVlLitro(const Value: double);
    procedure SetPercImposto(const Value: double);
    procedure SetSubTotal(const Value: double);
    procedure SetTotalImposto(const Value: double);
    procedure SetVlTotal(const Value: double);

  public
    function Obter: TFDQuery;
    function ObterBomba: TFDQuery;
    function Relatorio(Inicio, Fim: TAbastecimentoModel): TFDQuery;
    function Salvar: Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    property IdAbastecimento: Integer read FIdAbastecimento write SetIdAbastecimento;
    property IdBomba: Integer read FIdBomba write SetIdBomba;
    property DataInicial: TDate read FDataInicial write SetDataInicial;
    property DataFinal: TDate read FDataFinal write SetDataFinal;
    property QtdeLitros: Double read FQtdeLitros write SetQtdeLitro;
    property VlLitro: double read FVlLitro write SetVlLitro;
    property PercImposto: double read FPercImposto write SetPercImposto;
    property SubTotal: double read FSubTotal write SetSubTotal;
    property TotalImposto: double read FTotalImposto write SetTotalImposto;
    property VlTotal: double read FVlTotal write SetVlTotal;
    property Acao: TAcao read FAcao write SetAcao;
  end;

implementation
{ TAbastecimentoeModel }

uses uAbastecimentoDao;

function TAbastecimentoModel.GetId(AAutoIncrementar: Integer): Integer;
var VAbastecimentoDao: TAbastecimentoDao;
begin
  VAbastecimentoDao := TAbastecimentoDao.Create;
  try
    Result := VAbastecimentoDao.GetId(AAutoIncrementar);
  finally
    VAbastecimentoDao.Free;
  end;
end;

function TAbastecimentoModel.Obter: TFDQuery;
var VAbastecimentoDao: TAbastecimentoDao;
begin
  VAbastecimentoDao := TAbastecimentoDao.Create;
  try
    Result := VAbastecimentoDao.Obter;
  finally
    VAbastecimentoDao.Free;
  end;
end;

function TAbastecimentoModel.ObterBomba: TFDQuery;
var VAbastecimentoDao: TAbastecimentoDao;
begin
  VAbastecimentoDao := TAbastecimentoDao.Create;
  try
    Result := VAbastecimentoDao.ObterBomba;
  finally
    VAbastecimentoDao.Free;
  end;
end;

function TAbastecimentoModel.Relatorio(Inicio, Fim: TAbastecimentoModel): TFDQuery;
var VAbastecimentoDao: TAbastecimentoDao;
begin
  VAbastecimentoDao := TAbastecimentoDao.Create;
  try
    Result := VAbastecimentoDao.Relatorio(Inicio, Fim);
  finally
    VAbastecimentoDao.Free;
  end;
end;

function TAbastecimentoModel.Salvar: Boolean;
var VAbastecimentoDao: TAbastecimentoDao;
begin
  Result := False;
  VAbastecimentoDao := TAbastecimentoDao.Create;
  try
    case FAcao of
      uEnumerado.tacIncluir: Result := VAbastecimentoDao.Incluir(Self);
      uEnumerado.tacAlterar: Result := VAbastecimentoDao.Alterar(Self);
      uEnumerado.tacExcluir: Result := VAbastecimentoDao.Excluir(Self);
    end;
  finally
    VAbastecimentoDao.Free;
  end;
end;

procedure TAbastecimentoModel.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;
procedure TAbastecimentoModel.SetDataFinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TAbastecimentoModel.SetDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TAbastecimentoModel.SetIdAbastecimento(const Value: Integer);
begin
   FIdAbastecimento := Value;
end;

procedure TAbastecimentoModel.SetIdBomba(const Value: Integer);
begin
   FIdBomba := Value;
end;

procedure TAbastecimentoModel.SetPercImposto(const Value: double);
begin
  FPercImposto := Value;
end;

procedure TAbastecimentoModel.SetQtdeLitro(const Value: Double);
begin
  FQtdeLitros := Value;
end;

procedure TAbastecimentoModel.SetSubTotal(const Value: double);
begin
  FSubTotal := Value;
end;

procedure TAbastecimentoModel.SetTotalImposto(const Value: double);
begin
  FTotalImposto := Value;
end;

procedure TAbastecimentoModel.SetVlLitro(const Value: double);
begin
  FVlLitro := Value;
end;

procedure TAbastecimentoModel.SetVlTotal(const Value: double);
begin
  FVlTotal := Value;
end;

end.



