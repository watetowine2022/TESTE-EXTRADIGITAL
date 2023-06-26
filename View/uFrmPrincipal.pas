unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,uFrmCadEmpresa;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Empresa1: TMenuItem;
    procedure Empresa1Click(Sender: TObject);
  private
    procedure AbrirCadEmpresa;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.AbrirCadEmpresa;
begin
  FrmCadastroEmp := TFrmCadastroEmp.Create(nil);
  try
    FrmCadastroEmp.ShowModal;
  finally
    FreeAndNil(FrmCadastroEmp);
  end;
end;

procedure TFrmPrincipal.Empresa1Click(Sender: TObject);
begin
  AbrirCadEmpresa;
end;

end.
