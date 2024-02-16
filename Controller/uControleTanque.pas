unit uControleTanque;

interface

uses
  uTanqueModel, System.SysUtils, FireDAC.Comp.Client;
type
  TTanqueControl = class
  private
    FTanqueModel: TTanqueModel;
  public
    constructor Create;
    destructor Destroy; override;
    function Salvar: Boolean;
    function Obter: TFDQuery;
    function ObterCombustivel: TFDQuery;
    function GetId(AAutoIncrementar: Integer): Integer;
    property TanqueModel: TTanqueModel read FTanqueModel write FTanqueModel;
  end;

implementation
{ TTanqueControl }

constructor TTanqueControl.Create;
begin
  FTanqueModel := TTanqueModel.Create;
end;

destructor TTanqueControl.Destroy;
begin
  FTanqueModel.Free;
end;

function TTanqueControl.GetId(AAutoIncrementar: Integer): Integer;
begin
  Result := FTanqueModel.GetId(AAutoIncrementar);
end;

function TTanqueControl.Obter: TFDQuery;
begin
  Result := FTanqueModel.Obter;
end;

function TTanqueControl.ObterCombustivel: TFDQuery;
begin
  Result := FTanqueModel.Obter;
end;

function TTanqueControl.Salvar: Boolean;
begin
  Result := FTanqueModel.Salvar;
end;
end.

