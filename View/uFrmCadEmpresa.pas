unit uFrmCadEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, uEmpresaController,uEmpresaModel,
  uDmConexao,uDmEmpresa, Vcl.Mask;

type
  //Controle de Operações
  TOperacao = (opNovo, opAlterar, opNavegar);

  TFrmCadastroEmp = class(TForm)
    PnlBtn: TPanel;
    btnFechar: TButton;
    pgcPrincipal: TPageControl;
    tbConsulta: TTabSheet;
    tbDados: TTabSheet;
    pnlParam: TPanel;
    edtParam: TEdit;
    lblPesq: TLabel;
    btnPesquisar: TButton;
    pnlBotoes: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    dsConsulta: TDataSource;
    edtCodigo: TLabeledEdit;
    edtNomeEmp: TLabeledEdit;
    edtCnpj: TLabeledEdit;
    edtIE: TLabeledEdit;
    cbStatus: TComboBox;
    Label1: TLabel;
    edtDtCad: TLabeledEdit;
    edtDtAbert: TLabeledEdit;
    edtTelCom: TLabeledEdit;
    EdtCel: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtStExclu: TLabeledEdit;
    Label2: TLabel;
    edtObs: TLabeledEdit;
    Label3: TLabel;
    Panel1: TPanel;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    cbStExclus: TComboBox;
    edtDtExclu: TLabeledEdit;
    btnListar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    FOperacao : TOperacao;
  public
    { Public declarations }
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure CarregarCliente;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(aOperacao: TOperacao);
  end;

var
  FrmCadastroEmp: TFrmCadastroEmp;

implementation

{$R *.dfm}


procedure TFrmCadastroEmp.Alterar;
var
  oEmpresa : TEmpresa;
  oEmpresaController : TEmpresaController;
  sErro: string;
begin
  oEmpresa := TEmpresa.Create;
  oEmpresaController := TEmpresaController.Create;
  try
    with oEmpresa do
    begin
      ID             :=strtoint(edtCodigo.Text);
      NomeEmp        := edtNomeEmp.Text;
      NUCnpj         := edtCnpj.Text;
      NUInscricao    :=edtIE.Text;
      DTCadastro     :=edtDtCad.text;
      DTAbertura     :=edtDtAbert.Text;
      TelComercial   :=edtTelCom.Text;
      Celular        :=EdtCel.Text;
      Email          :=edtEmail.Text;
      STExcluido     :=edtStExclu.Text;
      DTExcluido     :=edtDtExclu.Text;
      obs            :=StrtoInt(edtObs.Text);
      SAtivo         := cbStatus.Text;
    end;
    if oEmpresaController.Alterar(oEmpresa, sErro) = false then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oEmpresa);
    FreeAndNil(oEmpresaController);
  end;

end;

procedure TFrmCadastroEmp.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TFrmCadastroEmp.btnCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TFrmCadastroEmp.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFrmCadastroEmp.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFrmCadastroEmp.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroEmp.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TFrmCadastroEmp.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TFrmCadastroEmp.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
end;

procedure TFrmCadastroEmp.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFrmCadastroEmp.CarregarCliente;
var
  oEmpresa : TEmpresa;
  oEmpresaController : TEmpresaController;
begin
  oEmpresa := TEmpresa.Create;
  oEmpresaController := TEmpresaController.Create;
  try
    oEmpresaController.CarregarEmpresa(oEmpresa, dsConsulta.DataSet.FieldByName('idempresa').asInteger);
    with oEmpresa do
    begin
      edtCodigo.Text := IntToStr(ID);
      edtNomeEmp.Text:= NomeEmp;
      edtCnpj.Text   := NUCnpj;
      edtIE.Text     := NUInscricao;
      edtDtCad.text  := DTCadastro;
      edtDtAbert.Text:= DTAbertura;
      edtTelCom.Text := TelComercial;
      EdtCel.Text    := Celular;
      edtEmail.Text  := Email;
      edtStExclu.Text:= STExcluido;
      edtDtExclu.Text:= DTExcluido;
      edtObs.Text    := IntToStr(obs);
      cbStatus.Text  := Sativo;
    end;
  finally
    FreeAndNil(oEmpresa);
    FreeAndNil(oEmpresaController);
  end;

end;

procedure TFrmCadastroEmp.Configuracoes;
begin
  tbConsulta.Visible := false;
  tbDados.Visible    := false;
  pgcPrincipal.ActivePage := tbConsulta;
end;

procedure TFrmCadastroEmp.DBGrid1DblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFrmCadastroEmp.Detalhar;
begin
  CarregarCliente;
  HabilitarControles(opNavegar);
  FOperacao := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TFrmCadastroEmp.Excluir;
var
  oEmpresaController : TEmpresaController;
  sErro: string;
begin
  oEmpresaController :=TEmpresaController.Create;

  try
    if (DmEmpresa.CdsPesquisar.Active) and (Dmempresa.CdsPesquisar.RecordCount >0 ) then
    begin
      if MessageDlg('Deseja excluir esta empresa?',mtConfirmation, [mbyes,mbno],0) = IDYES then
      begin
        if oEmpresaController.Excluir(DmEmpresa.CdsPesquisarIDEMPRESA.AsInteger, sErro)=false then
        raise Exception.Create(sErro);
        oEmpresaController.Pesquisar(edtParam.Text);
      end;


    end
    else
      raise Exception.Create('Não existe registro para ser excluído');

  finally
    FreeAndNil(oEmpresaController);
  end;

end;

procedure TFrmCadastroEmp.FormCreate(Sender: TObject);
begin
 DmEmpresa:= TDmEmpresa.Create(nil);
end;

procedure TFrmCadastroEmp.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmEmpresa);
end;

procedure TFrmCadastroEmp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;

end;

procedure TFrmCadastroEmp.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TFrmCadastroEmp.Gravar;
var
 oEmpresaController : TEmpresaController;
begin
  oEmpresaController := TEmpresaController.Create;
   try
    case FOperacao of
      opNovo: Inserir ;
      opAlterar: Alterar ;
    end;
    oEmpresaController.Pesquisar(edtParam.Text);
   finally
    FreeAndNil(oEmpresaController);
    end;
end;

procedure TFrmCadastroEmp.HabilitarControles;
begin
  case aOperacao of
    opNovo, opAlterar:
    begin
      edtNomeEmp.Enabled := True;
      edtCnpj.Enabled := True;
      edtIE.Enabled := True;
      edtDtCad.Enabled := True;
      edtDtAbert.Enabled := True;
      edtTelCom.Enabled := True;
      EdtCel.Enabled := True;
      edtEmail.Enabled := True;
      edtStExclu.Enabled := True;
      edtDtExclu.Enabled := True;
      edtObs.Enabled := True;
      cbStatus.Enabled := True;
      btnListar.enabled := false;
      btnFechar.enabled := false;
      btnAlterar.enabled := false;
      btnGravar.enabled := true;
      btnCancelar.enabled:=true;
    end;
    opNavegar:
    begin
      edtNomeEmp.Enabled := false;
      edtCnpj.Enabled := false;
      edtIE.Enabled := false;
      edtDtCad.Enabled := false;
      edtDtAbert.Enabled := false;
      edtTelCom.Enabled := false;
      EdtCel.Enabled := false;
      edtEmail.Enabled := false;
      edtStExclu.Enabled := false;
      edtDtExclu.Enabled := false;
      edtObs.Enabled := false;
      cbStatus.Enabled := false;
      btnListar.enabled := true;
      btnFechar.enabled := true;
      btnAlterar.enabled := true;
      btnGravar.enabled := false;
      btnCancelar.enabled:=false;
    end;
    
    
  end;
end;

procedure TFrmCadastroEmp.Inserir;
var
  oEmpresa : TEmpresa;
  oEmpresaController : TEmpresaController;
  sErro : string;
begin
  oEmpresa := TEmpresa.Create;
  oEmpresaController := TEmpresaController.Create;

  try
    with oEmpresa do
    begin
      ID := 0;
      NomeEmp        := edtNomeEmp.Text;
      NUCnpj         := edtCnpj.Text;
      NUInscricao    :=edtIE.Text;
      DTCadastro     :=edtDtCad.text;
      DTAbertura     :=edtDtAbert.Text;
      TelComercial   :=edtTelCom.Text;
      Celular        :=EdtCel.Text;
      Email          :=edtEmail.Text;
      STExcluido     :=edtStExclu.Text;
      DTExcluido     :=edtDtExclu.Text;
      obs            :=StrtoInt(edtObs.Text);
      SAtivo         := cbStatus.Text;

      if oEmpresaController.Inserir(oEmpresa,sErro)=false then
      raise Exception.Create(sErro);
      
    end;
  
  finally
    FreeAndNil(oEmpresa);
    FreeAndNil(oEmpresaController);
  end;
  
  
end;

procedure TFrmCadastroEmp.Listar;
begin
  pgcPrincipal.ActivePage := tbConsulta;
end;

procedure TFrmCadastroEmp.Novo;
begin
  FOperacao := opNovo;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TFrmCadastroEmp.Pesquisar;
var
  oEmpresaController : TEmpresaController;
begin
  oEmpresaController := TEmpresaController.Create;
  try
    oEmpresaController.Pesquisar(edtParam.Text);
  finally
    FreeAndNil(oEmpresaController);
  end;
end;

end.
