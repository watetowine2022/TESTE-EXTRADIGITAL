unit uEmpresaModel;

interface

type
  TEmpresa = class
  private
    FID: Integer;
    FNomeEmp: string;
    FNCnpj: string;
    FNIe: string;
    FStatusCad : string;
    FDTCad: string;
    FDTAbert: string;
    FTelCom: string;
    FCel: string;
    FObs: Integer;
    FEmail: string;
    FSTExclu: string;
    FDTExclu: string;

  public
    property ID: Integer           read FID        write FID;
    property NomeEmp: string       read FNomeEmp   write FNomeEmp;
    property NUCnpj: string        read FNCnpj     write FNCnpj;
    property NUInscricao: string   read FNIe       write FNIe;
    property SAtivo : string       read FStatusCad write FStatusCad;
    property DTCadastro : string    read FDTCad     write FDTCad;
    property DTAbertura : string    read FDTAbert   write FDTAbert;
    property TelComercial : string read FTelCom    write FTelCom;
    property Celular : string      read FCel       write FCel;
    property Obs : Integer         read FObs       write FObs;
    property Email : string        read FEmail     write FEmail;
    property STExcluido : string   read FSTExclu   write FSTExclu;
    property DTExcluido : string    read FDTExclu   write FDTExclu;
  end;

implementation

end.

