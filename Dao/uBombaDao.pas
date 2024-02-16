unit uBombaDao;

interface

uses
  FireDAC.Comp.Client, uConexao, System.SysUtils, uBombaModel;
type
  TBombaDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;
    function Incluir(ABombaModel: TBombaModel): Boolean;
    function Alterar(ABombaModel: TBombaModel): Boolean;
    function Excluir(ABombaModel: TBombaModel): Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    function Obter: TFDQuery;
    function ObterTanque: TFDQuery;
  end;

implementation

{ TBombaDao }
uses uControleSistema;

function TBombaDao.Alterar(ABombaModel: TBombaModel): Boolean;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('UPDATE BOMBA SET DESCRICAO = :BOMBA, ID_TANQUE = :ID_TANQUE WHERE (ID_BOMBA = :ID_BOMBA)', [ABombaModel.Bomba, ABombaModel.IdTanque, ABombaModel.IdBomba]);
    Result := True;
  finally
    VQry.Free;
  end;
end;

constructor TBombaDao.Create;
begin
  FConexao := TControleSistemal.GetInstance().Conexao;
end;

function TBombaDao.Excluir(ABombaModel: TBombaModel): Boolean;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('DELETE FROM BOMBA WHERE (ID_BOMBA = :ID_BOMBA)', [ABombaModel.IdBomba]);
    Result := True;
  finally
    VQry.Free;
  end;
end;

function TBombaDao.GetId(AAutoIncrementar: Integer): Integer;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.Open('SELECT GEN_ID(GEN_BOMBA_ID, ' + IntToStr(AAutoIncrementar) + ' ) FROM RDB$DATABASE');
    try
      Result := VQry.Fields[0].AsInteger;
    finally
      VQry.Close;
    end;
  finally
    VQry.Free;
  end;
end;

function TBombaDao.Incluir(ABombaModel: TBombaModel): Boolean;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('INSERT INTO BOMBA (ID_BOMBA, DESCRICAO, ID_TANQUE) VALUES (:ID_BOMBA, :DESCRICA0, :ID_TANQUE)', [ABombaModel.IdBomba, ABombaModel.Bomba, ABombaModel.IdTanque]);
    Result := True;
  finally
    VQry.Free;
  end;
end;

function TBombaDao.Obter: TFDQuery;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  VQry.Open('SELECT ID_BOMBA, DESCRICAO, ID_TANQUE FROM BOMBA ORDER BY ID_BOMBA');
  Result := VQry;
end;

function TBombaDao.ObterTanque: TFDQuery;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  VQry.Open('SELECT ID_TANQUE, DESCRICAO FROM TANQUE ORDER BY ID_TANQUE');
  Result := VQry;
end;

end.
