unit uControleBomba;

interface

uses
  uBombaModel, System.SysUtils, FireDAC.Comp.Client;
type
  TBombaControl = class
  private
    FBombaModel: TBombaModel;
  public
    constructor Create;
    destructor Destroy; override;
    function Salvar: Boolean;
    function Obter: TFDQuery;
    function ObterTanque: TFDQuery;
    function GetId(AAutoIncrementar: Integer): Integer;
    property BombaModel: TBombaModel read FBombaModel write FBombaModel;
  end;

implementation
{ TBombaControl }

constructor TBombaControl.Create;
begin
  FBombaModel := TBombaModel.Create;
end;

destructor TBombaControl.Destroy;
begin
  FBombaModel.Free;
end;

function TBombaControl.GetId(AAutoIncrementar: Integer): Integer;
begin
  Result := FBombaModel.GetId(AAutoIncrementar);
end;

function TBombaControl.Obter: TFDQuery;
begin
  Result := FBombaModel.Obter;
end;

function TBombaControl.ObterTanque: TFDQuery;
begin
  Result := FBombaModel.Obter;
end;

function TBombaControl.Salvar: Boolean;
begin
  Result := FBombaModel.Salvar;
end;
end.

