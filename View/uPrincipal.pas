unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uControleSistema, Vcl.ComCtrls,
  Vcl.Menus, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    anque1: TMenuItem;
    Bomba1: TMenuItem;
    Combustivel1: TMenuItem;
    Sair1: TMenuItem;
    Abastecimento1: TMenuItem;
    Relatrio1: TMenuItem;
    Abastecimento2: TMenuItem;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Combustivel1Click(Sender: TObject);
    procedure anque1Click(Sender: TObject);
    procedure Bomba1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Abastecimento2Click(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uBomba, uTanque, uCombustivel, uAbastecimento, uRelAbastecimento;

procedure TfrmPrincipal.Abastecimento2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmAbastecimento, frmAbastecimento);
  try
    frmAbastecimento.ShowModal;
  finally
    frmAbastecimento.Release;
  end;
end;

procedure TfrmPrincipal.anque1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmTanque, frmTanque);
  try
    frmTanque.ShowModal;
  finally
    frmTanque.Release;
  end;
end;

procedure TfrmPrincipal.Bomba1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmBomba, frmBomba);
  try
    frmBomba.ShowModal;
  finally
    frmBomba.Release;
  end;
end;

procedure TfrmPrincipal.Combustivel1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCombustivel, frmCombustivel);
  try
    frmCombustivel.ShowModal;
  finally
    frmCombustivel.Release;
  end;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Fechar Aplicação', 'Finalizando...',
    MB_YESNO + MB_ICONQUESTION) = IdYes then
    Application.Terminate
  else
    Abort;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TControleSistemal.GetInstance();
end;

procedure TfrmPrincipal.Relatrio1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRelAbastecimento, frmRelAbastecimento);
  try
    frmRelAbastecimento.ShowModal;
  finally
    frmRelAbastecimento.Release;
  end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
