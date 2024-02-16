unit uTanqueDao;

interface

uses
  FireDAC.Comp.Client, uConexao, System.SysUtils, uTanqueModel;
type
  TTanqueDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;
    function Incluir(ATanqueModel: TTanqueModel): Boolean;
    function Alterar(ATanqueModel: TTanqueModel): Boolean;
    function Excluir(ATanqueModel: TTanqueModel): Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    function Obter: TFDQuery;
    function ObterCombustivel: TFDQuery;
  end;

implementation
{ TTanqueDao }

uses uControleSistema;

function TTanqueDao.Alterar(ATanqueModel: TTanqueModel): Boolean;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('UPDATE TANQUE SET DESCRICAO = :DESCRICAO, ID_COMBUSTIVEL = :ID_COMBUSTIVEL WHERE (ID_TANQUE = :ID_TANQUE)',
                 [ATanqueModel.Tanque, ATanqueModel.IdCombustivel, ATanqueModel.IdTanque]);
    Result := True;
  finally
    VQry.Free;
  end;
end;

constructor TTanqueDao.Create;
begin
  FConexao := TControleSistemal.GetInstance().Conexao;
end;

function TTanqueDao.Excluir(ATanqueModel: TTanqueModel): Boolean;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('DELETE FROM TANQUE WHERE (ID_TANQUE = :ID_TANQUE)', [ATanqueModel.IdTanque]);
    Result := True;
  finally
    VQry.Free;
  end;
end;

function TTanqueDao.GetId(AAutoIncrementar: Integer): Integer;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.Open('SELECT GEN_ID(GEN_TANQUE_ID, ' + IntToStr(AAutoIncrementar) + ' ) FROM RDB$DATABASE');
    try
      Result := VQry.Fields[0].AsInteger;
    finally
      VQry.Close;
    end;
  finally
    VQry.Free;
  end;
end;

function TTanqueDao.Incluir(ATanqueModel: TTanqueModel): Boolean;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('INSERT INTO TANQUE (ID_TANQUE, DESCRICAO, ID_COMBSTIVEL) VALUES (:ID_TANQUE, :DESCRICA0, :ID_COMBSTIVEL)', [ATanqueModel.IdTanque, ATanqueModel.Tanque, ATanqueModel.IdCombustivel]);
    Result := True;
  finally
    VQry.Free;
  end;
end;

function TTanqueDao.Obter: TFDQuery;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  VQry.Open('SELECT ID_TANQUE, DESCRICAO, ID_COMBUSTIVEL FROM TANQUE ORDER BY ID_TANQUE');
  Result := VQry;
end;

function TTanqueDao.ObterCombustivel: TFDQuery;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  VQry.Open('SELECT ID_COMBUSTIVEL, DESCRICAO FROM COMBUSTIVEL ORDER BY ID_COMBUSTIVEL');
  Result := VQry;
end;

end.

