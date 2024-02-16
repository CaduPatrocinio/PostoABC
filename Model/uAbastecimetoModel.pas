unit uAbastecimetoModel;

interface

uses
  uEnumerado, FireDAC.Comp.Client;
type
  TAbastecimentoModel = class
  private
    FAcao: TAcao;
    FIdAbastecimento: Integer;
    FIdBomba: Integer;
    FQtdeLitros: Double;
    FVlLitro: double;
    FPercImposto: double;
    FSubTotal: double;
    FTotalImposto: double;
    FVlTotal: double;
    procedure SetAcao(const Value: TAcao);
    procedure SetIdAbastecimento(const Value: Integer);
    procedure SetIdBomba(const Value: Integer);
    procedure SetQtdeLitro(const Value: Double);
    procedure SetVlLitro(const Value: double);
    procedure SetPercImposto(const Value: double);
    procedure SetSubTotal(const Value: double);
    procedure SetTotalImposto(const Value: double);
    procedure SetVlTotal(const Value: double);
  public
    function Obter: TFDQuery;
    function ObterBomba: TFDQuery;
    function Salvar: Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    property IdAbastecimento: Integer read FIdAbastecimento write SetIdAbastecimento;
    property IdBomba: Integer read FIdBomba write SetIdBomba;
    property QtdeLitros: Double read FQtdeLitros write SetQtdeLitro;
    property VlLitro: double read FVlLitro write SetVlLitro;
    property FPercImposto: double read FPercImposto write SetPercImposto;
    property SubTotal: double read FSubTotal write SetSubTotal;
    property TotalImposto: double read FTotalImposto write SetTotalImposto;
    property VlTotal: double read FVlTotal write SetVlTotal;
    property Acao: TAcao read FAcao write SetAcao;
  end;

implementation
{ TAbastecimentoeModel }
uses uTanqueDao;

function TAbastecimentoModel.GetId(AAutoIncrementar: Integer): Integer;
var VTanqueDao: TTanqueDao;
begin
  VTanqueDao := TTanqueDao.Create;
  try
    Result := VTanqueDao.GetId(AAutoIncrementar);
  finally
    VTanqueDao.Free;
  end;
end;

function TAbastecimentoModel.Obter: TFDQuery;
var VTanqueDao: TTanqueDao;
begin
  VTanqueDao := TTanqueDao.Create;
  try
    Result := VTanqueDao.Obter;
  finally
    VTanqueDao.Free;
  end;
end;

function TAbastecimentoModel.ObterBomba: TFDQuery;
var VTanqueDao: TTanqueDao;
begin
  VTanqueDao := TTanqueDao.Create;
  try
    Result := VTanqueDao.Obter;
  finally
    VTanqueDao.Free;
  end;
end;

function TAbastecimentoModel.Salvar: Boolean;
var VTanqueDao: TTanqueDao;
begin
  Result := False;
  VTanqueDao := TTanqueDao.Create;
  try
    case FAcao of
      uEnumerado.tacIncluir: Result := VTanqueDao.Incluir(Self);
      uEnumerado.tacAlterar: Result := VTanqueDao.Alterar(Self);
      uEnumerado.tacExcluir: Result := VTanqueDao.Excluir(Self);
    end;
  finally
    VTanqueDao.Free;
  end;
end;

procedure TAbastecimentoModel.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;
procedure TAbastecimentoModel.SetIdAbastecimento(const Value: Integer);
begin
   FIdAbastecimento := Value;
end;

procedure TAbastecimentoModel.SetIdCombustivel(const Value: Integer);
begin
  FIdCombustivel := Value;
end;

procedure TAbastecimentoModel.SetTanque(const Value: string);
begin
  FTanque := value;
end;

procedure TAbastecimentoModel.SetCapacidade(const Value: double);
begin
  FCapacidade := value;
end;
end.


