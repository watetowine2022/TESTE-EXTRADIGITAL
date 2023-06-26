unit uEmpresaController;

interface

uses
  uEmpresaModel,uDmEmpresa,SysUtils;

type
  TEmpresaController = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure Pesquisar(iParam: string);
    procedure CarregarEmpresa(oEmpresa: TEmpresa; iCodigo: Integer);
    function Inserir(oEmpresa: TEmpresa; var sErro: string): boolean;
    function Alterar(oEmpresa: TEmpresa; var sErro: string): boolean;
    function Excluir(iCodigo: Integer; var sErro: string): boolean;

  end;

implementation

{ TEmpresaController }

function TEmpresaController.Alterar(oEmpresa: TEmpresa;
  var sErro: string): boolean;
begin
   DmEmpresa.Alterar(oEmpresa,sErro);
end;

procedure TEmpresaController.CarregarEmpresa(oEmpresa: TEmpresa;
  iCodigo: Integer);
begin
  DmEmpresa.CarregarEmpresa(oEmpresa,iCodigo)
end;

constructor TEmpresaController.Create;
begin
 // DmEmpresa := TDmEmpresa.Create(nil);
end;

destructor TEmpresaController.Destroy;
begin
 // FreeAndNil(DmEmpresa);
  inherited;
end;

function TEmpresaController.Excluir(iCodigo: Integer;
  var sErro: string): boolean;
begin
   Result:= DmEmpresa.Excluir(iCodigo,sErro);
end;

function TEmpresaController.Inserir(oEmpresa: TEmpresa;
  var sErro: string): boolean;
begin
   Result:= DmEmpresa.Alterar(oEmpresa,sErro);
end;

procedure TEmpresaController.Pesquisar(iParam: string);
begin
  DmEmpresa.Consulta(iparam)
end;

end.
