unit uBombaModel;

interface

uses
  uEnumerado, FireDAC.Comp.Client;
type
  TBombaModel = class
  private
    FAcao: TAcao;
    FIdBomba: Integer;
    FBomba: string;
    FIdTanque: Integer;
    procedure SetAcao(const Value: TAcao);
    procedure SetIdBomba(const Value: Integer);
    procedure SetBomba(const Value: string);
    procedure SetIdTanque(const Value: Integer);
  public
    function Obter: TFDQuery;
    function ObterTanque: TFDQuery;
    function Salvar: Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    property IdBomba: Integer read FIdBomba write SetIdBomba;
    property Bomba: string read FBomba write SetBomba;
    property IdTanque: Integer read FIdTanque write SetIdTanque;
    property Acao: TAcao read FAcao write SetAcao;
  end;

implementation
{ TBambaModel }
uses uBombaDao;

function TBombaModel.GetId(AAutoIncrementar: Integer): Integer;
var VBombaDao: TBombaDao;
begin
  VBombaDao := TBombaDao.Create;
  try
    Result := VBombaDao.GetId(AAutoIncrementar);
  finally
    VBombaDao.Free;
  end;
end;

function TBombaModel.Obter: TFDQuery;
var VBombaDao: TBombaDao;
begin
  VBombaDao := TBombaDao.Create;
  try
    Result := VBombaDao.Obter;
  finally
    VBombaDao.Free;
  end;
end;

function TBombaModel.ObterTanque: TFDQuery;
var VBombaDao: TBombaDao;
begin
  VBombaDao := TBombaDao.Create;
  try
    Result := VBombaDao.Obter;
  finally
    VBombaDao.Free;
  end;
end;

function TBombaModel.Salvar: Boolean;
var VBombaDao: TBombaDao;
begin
  Result := False;
  VBombaDao := TBombaDao.Create;
  try
    case FAcao of
      uEnumerado.tacIncluir: Result := VBombaDao.Incluir(Self);
      uEnumerado.tacAlterar: Result := VBombaDao.Alterar(Self);
      uEnumerado.tacExcluir: Result := VBombaDao.Excluir(Self);
    end;
  finally
    VBombaDao.Free;
  end;
end;

procedure TBombaModel.SetAcao(const Value: TAcao);
begin
  FAcao := Value;
end;
procedure TBombaModel.SetIdBomba(const Value: Integer);
begin
   FIdBomba := Value;
end;

procedure TBombaModel.SetIdTanque(const Value: Integer);
begin
   FIdTanque := Value;
end;

procedure TBombaModel.SetBomba(const Value: string);
begin
  FBomba := Value;
end;
end.
