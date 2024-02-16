unit uControleAbastecimento;

interface

uses
  uAbastecimentoModel, System.SysUtils, FireDAC.Comp.Client;
type
  TAbastecimentoControl = class
  private
    FAbastecimentoModel: TAbastecimentoModel;
  public
    constructor Create;
    destructor Destroy; override;
    function Salvar: Boolean;
    function Obter: TFDQuery;
    function ObterBomba: TFDQuery;
    function Relatorio(Inicio, Fim: TAbastecimentoModel): TFDQuery;
    function GetId(AAutoIncrementar: Integer): Integer;
    property AbastecimentoModel: TAbastecimentoModel read FAbastecimentoModel write FAbastecimentoModel;
  end;

implementation
{ TAbastecimentoControl }

constructor TAbastecimentoControl.Create;
begin
  FAbastecimentoModel := TAbastecimentoModel.Create;
end;

destructor TAbastecimentoControl.Destroy;
begin
  FAbastecimentoModel.Free;
end;

function TAbastecimentoControl.GetId(AAutoIncrementar: Integer): Integer;
begin
  Result := FAbastecimentoModel.GetId(AAutoIncrementar);
end;

function TAbastecimentoControl.Obter: TFDQuery;
begin
  Result := FAbastecimentoModel.Obter;
end;

function TAbastecimentoControl.ObterBomba: TFDQuery;
begin
  Result := FAbastecimentoModel.ObterBomba;
end;

function TAbastecimentoControl.Relatorio(Inicio, Fim: TAbastecimentoModel): TFDQuery;
begin
 Result := FAbastecimentoModel.Relatorio(Inicio, Fim);
end;

function TAbastecimentoControl.Salvar: Boolean;
begin
  Result := FAbastecimentoModel.Salvar;
end;
end.

