program PrjPostoABC;

uses
  Vcl.Forms,
  uPrincipal in 'View\uPrincipal.pas' {frmPrincipal},
  uConexao in 'Dao\uConexao.pas',
  uControleSistema in 'Controller\uControleSistema.pas',
  uBombaDao in 'Dao\uBombaDao.pas',
  uEnumerado in 'Model\uEnumerado.pas',
  uBombaModel in 'Model\uBombaModel.pas',
  uControleBomba in 'Controller\uControleBomba.pas',
  uControleTanque in 'Controller\uControleTanque.pas',
  uTanqueModel in 'Model\uTanqueModel.pas',
  uTanqueDao in 'Dao\uTanqueDao.pas',
  uTanque in 'View\uTanque.pas' {frmTanque},
  uCombustivelDao in 'Dao\uCombustivelDao.pas',
  uCombustivelModel in 'Model\uCombustivelModel.pas',
  uCombustivel in 'View\uCombustivel.pas' {frmCombustivel},
  uControleCombustivel in 'Controller\uControleCombustivel.pas',
  uAbastecimento in 'View\uAbastecimento.pas' {frmAbastecimento},
  uAbastecimentoModel in 'Model\uAbastecimentoModel.pas',
  uAbastecimentoDao in 'Dao\uAbastecimentoDao.pas',
  uBomba in 'View\uBomba.pas' {frmBomba},
  uControleAbastecimento in 'Controller\uControleAbastecimento.pas',
  uRelAbastecimento in 'View\uRelAbastecimento.pas' {frmRelAbastecimento},
  uDados in 'View\uDados.pas' {DmDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmDados, DmDados);
  Application.Run;
end.
