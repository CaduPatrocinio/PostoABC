unit uControleCombustivel;

interface

uses
  uCombustivelModel, System.SysUtils, FireDAC.Comp.Client;
type
  TCombustivelControl = class
  private
    FCombustivelModel: TCombustivelModel;
  public
    constructor Create;
    destructor Destroy; override;
    function Salvar: Boolean;
    function Obter: TFDQuery;
    function ObterTanque: TFDQuery;
    function GetId(AAutoIncrementar: Integer): Integer;
    property CombustivelModel: TCombustivelModel read FCombustivelModel write FCombustivelModel;
  end;

implementation
{ TCombustivelControl }

constructor TCombustivelControl.Create;
begin
  FCombustivelModel := TCombustivelModel.Create;
end;

destructor TCombustivelControl.Destroy;
begin
  FCombustivelModel.Free;
end;

function TCombustivelControl.GetId(AAutoIncrementar: Integer): Integer;
begin
  Result := FCombustivelModel.GetId(AAutoIncrementar);
end;

function TCombustivelControl.Obter: TFDQuery;
begin
  Result := FCombustivelModel.Obter;
end;

function TCombustivelControl.ObterTanque: TFDQuery;
begin
  Result := FCombustivelModel.Obter;
end;

function TCombustivelControl.Salvar: Boolean;
begin
  Result := FCombustivelModel.Salvar;
end;
end.

