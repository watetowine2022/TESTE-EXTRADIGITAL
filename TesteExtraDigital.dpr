program TesteExtraDigital;

uses
  Vcl.Forms,
  uFrmPrincipal in 'View\uFrmPrincipal.pas' {FrmPrincipal},
  uFrmCadEmpresa in 'View\uFrmCadEmpresa.pas' {FrmCadastroEmp},
  uEmpresaModel in 'Model\uEmpresaModel.pas',
  uEmpresaController in 'Controller\uEmpresaController.pas',
  uDmConexao in 'DAO\uDmConexao.pas' {DmConexao: TDataModule},
  uDmEmpresa in 'DAO\uDmEmpresa.pas' {DmEmpresa: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.
