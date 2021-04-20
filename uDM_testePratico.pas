unit uDM_testePratico;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type
  TDM_DB = class(TDataModule)
    FD_SQLlocal: TFDConnection;
    FvCliente: TFDQuery;
    FtCliente: TFDQuery;
    FvEndereco: TFDQuery;
    FDAutoIncField5: TFDAutoIncField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    fvCEPS: TFDQuery;
    FDAutoIncField7: TFDAutoIncField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    FD_JSON: TFDQuery;
    FD_JSONnome: TWideStringField;
    FD_JSONfantansia: TWideStringField;
    FD_JSONcapital_social: TWideStringField;
    FD_JSONcnpj: TWideStringField;
    FD_JSONultima_atualizacao: TWideStringField;
    FD_JSONnatureza_juridica: TWideStringField;
    FD_JSONdata_situacao: TWideStringField;
    FD_JSONlogradouro: TWideStringField;
    FD_JSONnumero: TWideStringField;
    FD_JSONcomplemento: TWideStringField;
    FD_JSONbairro: TWideStringField;
    FD_JSONcep: TWideStringField;
    FD_JSONuf: TWideStringField;
    FD_JSONtelefone: TWideStringField;
    FD_JSONemail: TWideStringField;
    FD_JSONmunicipio: TWideStringField;
    FD_JSONporte: TWideStringField;
    FD_JSONabertura: TWideStringField;
    FD_JSONstatus: TWideStringField;
    FD_JSONatividades: TWideMemoField;
    FD_JSONatividades_secundarias: TWideMemoField;
    FD_JSONqsas: TWideMemoField;
    FD_JSONqsa_qual: TWideStringField;
    FD_JSONqsa_nome: TWideStringField;
    FD_JSONa_dsd: TWideStringField;
    FD_JSONa_code: TWideStringField;
    FD_JSONas_dsd: TWideStringField;
    FD_JSONas_code: TWideStringField;
    FvClienteID: TFDAutoIncField;
    FvClientenome: TStringField;
    FvClienteemail: TStringField;
    FvClientetelefone: TStringField;
    FvClientecelular: TStringField;
    FvClientetipo_entidade: TIntegerField;
    FvClientestatus: TBooleanField;
    FvClientefantansia: TStringField;
    FvClientenumero_fiscal: TStringField;
    FvClientenatureza_juridica: TStringField;
    FvClienteultima_atualizacao: TStringField;
    FvClientedata_situacao: TDateField;
    FvClientecapital_social: TFMTBCDField;
    FvClienteporte: TStringField;
    FvClienteabertura: TSQLTimeStampField;
    FvClienteID_ENDERECO: TIntegerField;
    FvClientecep: TStringField;
    FvClientelogradouro: TStringField;
    FvClientenumero: TStringField;
    FvClientecomplemento: TStringField;
    FvClientebairro: TStringField;
    FvClientecidade: TStringField;
    FvClienteestado: TStringField;
    FtClienteID: TFDAutoIncField;
    FtClientenome: TStringField;
    FtClienteemail: TStringField;
    FtClientetelefone: TStringField;
    FtClientecelular: TStringField;
    FtClientetipo_entidade: TIntegerField;
    FtClientestatus: TBooleanField;
    FtClientefantansia: TStringField;
    FtClientenumero_fiscal: TStringField;
    FtClientenatureza_juridica: TStringField;
    FtClienteultima_atualizacao: TStringField;
    FtClientedata_situacao: TDateField;
    FtClientecapital_social: TFMTBCDField;
    FtClienteporte: TStringField;
    FtClienteabertura: TSQLTimeStampField;
    FtClienteid_endereco: TIntegerField;
    FtClientecep: TStringField;
    FtClientelogradouro: TStringField;
    FtClientenumero: TStringField;
    FtClientecomplemento: TStringField;
    FtClientebairro: TStringField;
    FtClientecidade: TStringField;
    FtClienteestado: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_DB: TDM_DB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses CadCliente, Main,
  InscricaoFiscal;

{$R *.dfm}

end.
