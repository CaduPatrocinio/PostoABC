unit uCombustivelDao;

interface

uses
  FireDAC.Comp.Client, uConexao, System.SysUtils, uCombustivelModel;
type
  TCombustivelDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;
    function Incluir(ACombustivelModel: TCombustivelModel): Boolean;
    function Alterar(ACombustivelModel: TCombustivelModel): Boolean;
    function Excluir(ACombustivelModel: TCombustivelModel): Boolean;
    function GetId(AAutoIncrementar: Integer): Integer;
    function Obter: TFDQuery;
  end;

implementation
{ CombustivelDao }
uses uControleSistema;

function TCombustivelDao.Alterar(ACombustivelModel: TCombustivelModel): Boolean;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('UPDATE COMBUSTIVEL SET DESCRICAO = :COMBUSTIVEL WHERE (ID_COMBUSTIVEL = :ID_COMBUSTIVEL)', [ACombustivelModel.Combustivel, ACombustivelModel.IdCOMBUSTIVEL]);
    Result := True;
  finally
    VQry.Free;
  end;
end;

constructor TCombustivelDao.Create;
begin
  FConexao := TControleSistemal.GetInstance().Conexao;
end;
function TCombustivelDao.Excluir(ACombustivelModel: TCombustivelModel): Boolean;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('DELETE FROM COMBUSTIVEL WHERE (ID_COMBUSTIVEL = :ID_COMBUSTIVEL)', [ACombustivelModel.IdCOMBUSTIVEL]);
    Result := True;
  finally
    VQry.Free;
  end;
end;

function TCombustivelDao.GetId(AAutoIncrementar: Integer): Integer;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.Open('SELECT GEN_ID(GEN_COMBUSTIVEL_ID, ' + IntToStr(AAutoIncrementar) + ' ) FROM RDB$DATABASE');
    try
      Result := VQry.Fields[0].AsInteger;
    finally
      VQry.Close;
    end;
  finally
    VQry.Free;
  end;
end;

function TCombustivelDao.Incluir(ACombustivelModel: TCombustivelModel): Boolean;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  try
    VQry.ExecSQL('INSERT INTO COMBUSTIVEL (ID_COMBUSTIVEL, DESCRICAO, VALOR_LITRO, PERC_IMPOSTO) VALUES (:ID_COMBUSTIVEL, :DESCRICA0, :VALOR_LITRO, :PERC_IMPOSTO)', [ACombustivelModel.IdCOMBUSTIVEL, ACombustivelModel.COMBUSTIVEL, ACombustivelModel.VlLitro, ACombustivelModel.PercImposto ]);
    Result := True;
  finally
    VQry.Free;
  end;
end;

function TCombustivelDao.Obter: TFDQuery;
var VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();
  VQry.Open('SELECT ID_COMBUSTIVEL, DESCRICAO, VALOR_LITRO, PERC_IMPOSTO FROM COMBUSTIVEL ORDER BY ID_COMBUSTIVEL');
  Result := VQry;
end;
end.
