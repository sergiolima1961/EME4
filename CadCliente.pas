unit CadCliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  // Units Necessárias
  FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  Xml.xmldom, Xml.XmlTransform, Xml.XMLIntf, Xml.XMLDoc,
  FireDAC.VCLUI.Wait, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdTelnet, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdBaseComponent, IdMessage, System.DateUtils,
  IdText, IdAttachmentFile, Vcl.ComCtrls, IdCustomTCPServer,
  IdSocksServer, IdHTTP, Vcl.Grids, Vcl.DBGrids;

type
  TEnderecoCompleto = record
    CEP, logradouro, complemento, bairro, localidade, uf, unidade,
      IBGE: string end;

    TSocial = record nome, email, telefone, celular, tipo_entidade, status,
      id_endereco, fantansia, numero_fiscal, natureza_juridica,
      ultima_atualizacao, data_situacao, capital_social, porte, abertura: string
  end;

type
  TfCadCliente = class(TForm)
    DS_CLIENTE: TDataSource;
    XMLDocument1: TXMLDocument;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Panel1: TPanel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Button_Buscar_Cep: TButton;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Button6: TButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    Label18: TLabel;
    DBEdit17: TDBEdit;
    DBEdit12: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label19: TLabel;
    DBEdit18: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDQuery1AfterInsert(DataSet: TDataSet);
    procedure FDQuery1AfterPost(DataSet: TDataSet);
    procedure FDQuery1AfterCancel(DataSet: TDataSet);
    procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure FDQuery1AfterEdit(DataSet: TDataSet);
    procedure Button4Click(Sender: TObject);
    procedure DS_CLIENTEDataChange(Sender: TObject; Field: TField);
    procedure Button5Click(Sender: TObject);
    procedure Button_Buscar_CepClick(Sender: TObject);
    procedure ConsultaCEP(CEP: String);
    procedure ConsultaSocial(FISCAL: String);
    procedure Button6Click(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }

  var
    dadosEnderecoCompleto: TEnderecoCompleto;
    DataSocial: TSocial;

    procedure mensagemAviso(mensagem: string);

  public
    { Public declarations }
    pAcao: string;
  end;

var
  fCadCliente: TfCadCliente;

implementation

{$R *.dfm}

uses
  Main,
  System.RegularExpressions,
  uDM_testePratico;

procedure TfCadCliente.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  Button6.Enabled := not(Button1.Enabled);
  DBGrid1.Enabled := (Button1.Enabled);
  Button_Buscar_Cep.Enabled := not(Button1.Enabled);

  pAcao := 'I';
  DM_DB.FvCliente.Append;
  DBEdit2.SetFocus;
end;

procedure TfCadCliente.Button2Click(Sender: TObject);
begin
  DM_DB.FvCliente.Cancel;
  Button1.Enabled := true;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  Button6.Enabled := not(Button1.Enabled);
  Button_Buscar_Cep.Enabled := not(Button1.Enabled);
  DBGrid1.Enabled := (Button1.Enabled);

end;

procedure TfCadCliente.Button3Click(Sender: TObject);
begin

  try
    try

      if (DM_DB.FvCliente.FieldByName('nome').Value = '') or
        (DM_DB.FvCliente.FieldByName('nome').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Informe o nome.');
        DBEdit1.SetFocus;
        exit;
      end;
      //
      if (DM_DB.FvCliente.FieldByName('Email').Value = '') or
        (DM_DB.FvCliente.FieldByName('Email').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Informe o E-mail.');
        // DBEdit3.SetFocus;
        exit;
      end;
      //
      if (DM_DB.FvCliente.FieldByName('Telefone').Value = '') or
        (DM_DB.FvCliente.FieldByName('Telefone').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, Informe o Telefone.');
        // DBEdit3.SetFocus;
        exit;
      end;
      //
      if (DM_DB.FvCliente.FieldByName('CEP').Value = 0) or
        (DM_DB.FvCliente.FieldByName('CEP').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 + 'Por favor, Informe o CEP.');
        DBEdit5.SetFocus;
        exit;
      end;
      //

      if (DM_DB.FvCliente.FieldByName('numero_fiscal').Value = '') or
        (DM_DB.FvCliente.FieldByName('numero_fiscal').IsNull) then
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, Informe o Numero Fiscal.');
        DBEdit2.SetFocus;
        exit;
      end;
      //
      DM_DB.FtCliente.close;
      DM_DB.FtCliente.Params.ParamByName('ACAO').Value := pAcao;
      //
      DM_DB.FtCliente.Params.ParamByName('ID').Value :=
        DM_DB.FvCliente.FieldByName('ID').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('NOM').Value :=
        DM_DB.FvCliente.FieldByName('nome').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('EMA').Value :=
        DM_DB.FvCliente.FieldByName('Email').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('TEL').Value :=
        DM_DB.FvCliente.FieldByName('Telefone').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('CEL').Value :=
        DM_DB.FvCliente.FieldByName('Telefone').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('TIP').Value := 100;
      //
      DM_DB.FtCliente.Params.ParamByName('STA').Value :=
        DM_DB.FvCliente.FieldByName('STATUS').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('IDEND').Value :=
        DM_DB.FvCliente.FieldByName('ID_ENDERECO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('CEP').Value :=
        DM_DB.FvCliente.FieldByName('CEP').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('LOG').Value :=
        DM_DB.FvCliente.FieldByName('LOGRADOURO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('NUM').Value :=
        DM_DB.FvCliente.FieldByName('NUMERO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('COM').Value :=
        DM_DB.FvCliente.FieldByName('COMPLEMENTO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('BAI').Value :=
        DM_DB.FvCliente.FieldByName('BAIRRO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('CID').Value :=
        DM_DB.FvCliente.FieldByName('CIDADE').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('EST').Value :=
        DM_DB.FvCliente.FieldByName('ESTADO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('FANTASIA').Value :=
        DM_DB.FvCliente.FieldByName('FANTANSIA').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('NUMF').Value :=
        DM_DB.FvCliente.FieldByName('NUMERO_FISCAL').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('NAT').Value :=
        DM_DB.FvCliente.FieldByName('NATUREZA_JURIDICA').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('ULT').Value :=
        DM_DB.FvCliente.FieldByName('ULTIMA_ATUALIZACAO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('DATS').Value :=
        DM_DB.FvCliente.FieldByName('DATA_SITUACAO').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('CAP').AsCurrency :=
        (DM_DB.FvCliente.FieldByName('CAPITAL_SOCIAL').AsCurrency + 0.00);
      //
      DM_DB.FtCliente.Params.ParamByName('POR').Value :=
        DM_DB.FvCliente.FieldByName('PORTE').Value;
      //
      DM_DB.FtCliente.Params.ParamByName('ABE').Value :=
        DM_DB.FvCliente.FieldByName('ABERTURA').Value;
      //
      DM_DB.FvCliente.Params.ParamByName('IDR').Value := 0;

      DM_DB.FtCliente.ExecSQL;
      //
      Button1.Enabled := true;
      DBGrid1.Enabled := (Button1.Enabled);
      Button4.Enabled := (Button1.Enabled);
      Button5.Enabled := (Button1.Enabled);
      Button3.Enabled := not(Button1.Enabled);
      Button2.Enabled := not(Button1.Enabled);
      Button6.Enabled := not(Button1.Enabled);
      Button_Buscar_Cep.Enabled := not(Button1.Enabled);
      DBGrid1.Enabled := (Button1.Enabled);

      DM_DB.FvCliente.Cancel;;

      DM_DB.FvCliente.Active := false;
      DM_DB.FvCliente.Active := true;
      // DM_DB.FvCliente.Locate('codigo', DBGrid1.Tag, []);

    except
      On E: Exception do
      begin
        ShowMessage('Ocorreu um erro.' + #13 + E.Message + #13 +
          'Por favor, entre em contato com o administrador do sistema.');
        exit;
      end;
    end;

  finally
  end;

end;

procedure TfCadCliente.Button4Click(Sender: TObject);
begin
  DBGrid1.Enabled := false;
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DBGrid1.Enabled := (Button1.Enabled);
  Button_Buscar_Cep.Enabled := not(Button1.Enabled);

  pAcao := 'A';
  DM_DB.FvCliente.Edit;
  DBEdit2.SetFocus;
end;

procedure TfCadCliente.Button5Click(Sender: TObject);
begin

  pAcao := '';
  if MessageDlg('Confirma a Exclusão em Defitivo ?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
  begin
    pAcao := 'E';
    Button3Click(Self);
  end;

end;

procedure TfCadCliente.Button6Click(Sender: TObject);
{
  A dica de hoje é tão simples quanto a da redução dos if's, mas também contribui, e muito, para a tentativa de entregar ao mundo códigos cada vez mais limpos.

  Essa na verdade era uma prática constante minha, mas vamos concordar, concatenar um texto dessa maneira faz com que a leitura fique meio confusa, perceba a quantidade de operadores de adição para adicionar somente duas variáveis, imagina se fossem mais. Para simplificar temos a função "Format", declaramos o texto com parâmetros e o seu preenchimento em um array seguindo a mesma sequência.

  %s - string
  %d - decimal
  %f - float
  %m - money
}
var
  tsql: TFDQuery;
  SqlP: string;
  nID: integer;

begin

  try

    if Length(DM_DB.FvCliente.FieldByName('numero_fiscal').Value) <> 14 then
    begin
      mensagemAviso('CNPJ inválido');
      DBEdit2.SetFocus;
      exit;
    end;
    //
    SqlP := Format(concat('SELECT [id_entidade] [ID] ',
      ' FROM [DBO].[entidade] (nolock) ', ' WHERE numero_fiscal = %S '),
      [#39 + DM_DB.FvCliente.FieldByName('numero_fiscal').AsString + #39]);
    //

    tsql := TFDQuery.Create(nil);
    tsql.Connection := DM_DB.FvCliente.Connection;
    tsql.SQL.Text := SqlP;
    tsql.Active := true;
    //
    if not tsql.Eof then
    begin
      nID := tsql.FieldByName('ID').Value;
      DBEdit2.SetFocus;
      mensagemAviso('CNPJ já utilizado !');
      Button2Click(Self);
      DM_DB.FvCliente.Locate('ID', nID, []);
      exit;
    end;

    DataSocial.numero_fiscal := DM_DB.FvClientenumero_fiscal.AsString;

    ConsultaSocial(DataSocial.numero_fiscal);
    //
    DM_DB.FvCliente.FieldByName('NUMERO').Value :=
      DM_DB.FD_JSON.FieldByName('numero').AsString;
    //
    DM_DB.FvCliente.FieldByName('nome').Value := DataSocial.nome;
    //
    DM_DB.FvCliente.FieldByName('email').Value := DataSocial.email;
    //
    DM_DB.FvCliente.FieldByName('telefone').Value := DataSocial.telefone;
    //
    DM_DB.FvCliente.FieldByName('status').Value := (DataSocial.status = 'OK');
    //
    DM_DB.FvCliente.FieldByName('fantansia').Value := DataSocial.fantansia;
    //
    DM_DB.FvCliente.FieldByName('telefone').Value := DataSocial.telefone;
    //
    DM_DB.FvCliente.FieldByName('natureza_juridica').Value :=
      DataSocial.natureza_juridica;
    //
    if DataSocial.ultima_atualizacao <> '' then
      DM_DB.FvCliente.FieldByName('ultima_atualizacao').Value :=
        StringReplace(StringReplace(DataSocial.ultima_atualizacao, 'T', ' ',
        []), '.', '', []);
    //
    if DataSocial.data_situacao <> '' then
      DM_DB.FvCliente.FieldByName('data_situacao').Value :=
        DataSocial.data_situacao;
    //
    if DataSocial.capital_social <> '' then
      DM_DB.FvCliente.FieldByName('capital_social').Value :=
        StrToFloat(StringReplace(DataSocial.capital_social, '.', ',', []));
    //
    DM_DB.FvCliente.FieldByName('porte').Value := DataSocial.porte;
    //
    if DataSocial.abertura <> '' then
      DM_DB.FvCliente.FieldByName('abertura').Value := DataSocial.abertura;

  finally
    tsql.Active := false;
  end;

end;

procedure TfCadCliente.Button_Buscar_CepClick(Sender: TObject);
begin
  try

    if Length(DM_DB.FvCliente.FieldByName('CEP').Value) <> 8 then
    begin
      mensagemAviso('CEP inválido');
      DBEdit5.SetFocus;
      exit;
    end;

    try
      dadosEnderecoCompleto.CEP := DM_DB.FvCliente.FieldByName('CEP').Value;

      DM_DB.FvCEPS.close;
      DM_DB.FvCEPS.Params.ParamByName('AC').Value := 'C';
      DM_DB.FvCEPS.Params.ParamByName('ID').Value := 0;
      DM_DB.FvCEPS.Params.ParamByName('CEP').Value := dadosEnderecoCompleto.CEP;
      DM_DB.FvCEPS.open;

      if DM_DB.FvCEPS.Eof then
      Begin
        ConsultaCEP(dadosEnderecoCompleto.CEP);
        //
        DBEdit6.Text := UPPERCASE(dadosEnderecoCompleto.logradouro);
        //
        DBEdit11.Text := UPPERCASE(dadosEnderecoCompleto.uf);
        //
        DBEdit7.Text := UPPERCASE(dadosEnderecoCompleto.complemento);
        //
        DBEdit10.Text := UPPERCASE(dadosEnderecoCompleto.localidade);
        //
        DBEdit9.Text := UPPERCASE(dadosEnderecoCompleto.bairro);
      End
      Else
      begin

        dadosEnderecoCompleto.logradouro :=
          DM_DB.FvCEPS.FieldByName('LOGRADOURO').Value;
        //
        dadosEnderecoCompleto.uf := DM_DB.FvCEPS.FieldByName('ESTADO').Value;
        //
        dadosEnderecoCompleto.complemento :=
          DM_DB.FvCEPS.FieldByName('COMPLEMENTO').Value;
        //
        dadosEnderecoCompleto.localidade :=
          DM_DB.FvCEPS.FieldByName('CIDADE').Value;
        //
        dadosEnderecoCompleto.bairro := DM_DB.FvCEPS.FieldByName
          ('BAIRRO').Value;
        //
        DBEdit6.Text := UPPERCASE(dadosEnderecoCompleto.logradouro);
        //
        DBEdit11.Text := UPPERCASE(dadosEnderecoCompleto.uf);
        //
        DBEdit7.Text := UPPERCASE(dadosEnderecoCompleto.complemento);
        //
        DBEdit10.Text := UPPERCASE(dadosEnderecoCompleto.localidade);
        //
        DBEdit9.Text := UPPERCASE(dadosEnderecoCompleto.bairro);
      end;

      //
      DM_DB.FvCliente.FieldByName('LOGRADOURO').Value := DBEdit6.Text;
      //
      DM_DB.FvCliente.FieldByName('COMPLEMENTO').Value := DBEdit7.Text;
      //
      DM_DB.FvCliente.FieldByName('BAIRRO').Value := DBEdit9.Text;
      //
      DM_DB.FvCliente.FieldByName('CIDADE').Value := DBEdit10.Text;
      //
      DM_DB.FvCliente.FieldByName('ESTADO').Value := DBEdit11.Text;
      //
      DM_DB.FvCliente.FieldByName('NUMERO').Value := '';

      DBEdit8.SetFocus;

    except
      mensagemAviso('CEP inválido');
      DBEdit5.SetFocus;
    end;
  finally
  end;

end;

procedure TfCadCliente.FDQuery1AfterCancel(DataSet: TDataSet);
begin
  Button1.Enabled := true;
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterEdit(DataSet: TDataSet);
begin
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterInsert(DataSet: TDataSet);
begin
  Button3.Enabled := Not(Button4.Enabled);
  Button2.Enabled := Not(Button4.Enabled);
end;

procedure TfCadCliente.FDQuery1AfterPost(DataSet: TDataSet);
begin
  Button1.Enabled := true;
  Button3.Enabled := Not(Button1.Enabled);
  Button2.Enabled := Not(Button1.Enabled);
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
end;

procedure TfCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_DB.FvCliente.close;
  DM_DB.FvEndereco.close;
end;

procedure TfCadCliente.FormCreate(Sender: TObject);
begin
  DM_DB.FvCliente.close;
  DM_DB.FvCliente.Params.ParamByName('ACAO').Value := 'C';
  DM_DB.FvCliente.open;
  //
  DM_DB.FvEndereco.Params.ParamByName('AC').Value := 'C';
  DM_DB.FvEndereco.Params.ParamByName('ID').Value := 0;
  DM_DB.FvEndereco.Params.ParamByName('CEP').Value :=
    DM_DB.FvCliente.FieldByName('ID_ENDERECO').Value;
  DM_DB.FvEndereco.open;

end;

procedure TfCadCliente.DS_CLIENTEDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_DB.FvCliente.RecNo) + '/' +
    FormatFloat('0###', DM_DB.FvCliente.RecordCount);
end;

procedure TfCadCliente.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0' .. '9', #8, #13, #27, ^C, ^V, ^X, ^Z]) then
  begin
    Key := #0;
  end;
end;

procedure TfCadCliente.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0' .. '9', #8, #13, #27, ^C, ^V, ^X, ^Z]) then
  begin
    Key := #0;
  end;
end;

procedure TfCadCliente.mensagemAviso(mensagem: string);
begin
  Application.MessageBox(PChar(mensagem), '', MB_OK + MB_ICONERROR);
end;

procedure TfCadCliente.ConsultaCEP(CEP: String);
var
  tempXML: IXMLNode;
  tempNodePAI: IXMLNode;
  tempNodeFilho: IXMLNode;
  i: integer;
begin

  XMLDocument1.Active := false;
  XMLDocument1.FileName := 'https://viacep.com.br/ws/' + Trim(CEP) + '/xml/';
  XMLDocument1.Active := true;
  tempXML := XMLDocument1.DocumentElement;

  tempNodePAI := tempXML.ChildNodes.FindNode('logradouro');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.logradouro := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('bairro');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.bairro := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('localidade');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.localidade := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('uf');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.uf := tempNodeFilho.Text;
  end;

  tempNodePAI := tempXML.ChildNodes.FindNode('complemento');
  for i := 0 to tempNodePAI.ChildNodes.Count - 1 do
  begin
    tempNodeFilho := tempNodePAI.ChildNodes[i];
    dadosEnderecoCompleto.complemento := tempNodeFilho.Text;
  end;

  DBEdit6.Text := Copy(dadosEnderecoCompleto.logradouro, 1,
    Pos(' ', dadosEnderecoCompleto.logradouro) - 1);
  //
  DBEdit6.Text := Copy(dadosEnderecoCompleto.logradouro,
    Pos(' ', dadosEnderecoCompleto.logradouro) + 1,
    Length(dadosEnderecoCompleto.logradouro));

end;

procedure TfCadCliente.ConsultaSocial(FISCAL: String);
var
  IdHTTP1: TIdHTTP;
  Lista: TStringList;
  LHandler: TIdSSLIOHandlerSocketOpenSSL;

begin

  Lista := TStringList.Create;
  try
    IdHTTP1 := TIdHTTP.Create(nil);
    try
      LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      try

        try
          IdHTTP1.IOHandler := LHandler;
          Lista.Delimiter := '&';
          Lista.StrictDelimiter := true;
          IdHTTP1.ConnectTimeout := 1000;
          Lista.DelimitedText := IdHTTP1.URL.URLDecode
            (IdHTTP1.Get('https://www.receitaws.com.br/v1/cnpj/' + FISCAL));

        except
          on E: Exception do
          begin
            ShowMessage('CNPJ não foi localizado na base da receita federal ' +
              ' ou ' + #13 + E.Message + #13 +
              'Por favor, entre em contato com o administrador do sistema.');
            exit;
          end;
        end;

        //
        DM_DB.FD_JSON.close;
        DM_DB.FD_JSON.Params.ParamByName('DSC').Value := Lista.Text;
        DM_DB.FD_JSON.open;
        {

        }
        if DM_DB.FD_JSON.FieldByName('nome').AsString <> '' then
        begin
          DataSocial.nome := DM_DB.FD_JSON.FieldByName('nome').AsString;
          DataSocial.email := DM_DB.FD_JSON.FieldByName('email').AsString;
          DataSocial.telefone := DM_DB.FD_JSON.FieldByName('telefone').AsString;
          DataSocial.status := DM_DB.FD_JSON.FieldByName('status').AsString;
          DataSocial.fantansia := DM_DB.FD_JSON.FieldByName
            ('fantansia').AsString;
          DataSocial.numero_fiscal := DM_DB.FD_JSON.FieldByName('CNPJ')
            .AsString;
          DataSocial.natureza_juridica := DM_DB.FD_JSON.FieldByName
            ('natureza_juridica').AsString;
          DataSocial.ultima_atualizacao := DM_DB.FD_JSON.FieldByName
            ('ultima_atualizacao').AsString;
          DataSocial.data_situacao := DM_DB.FD_JSON.FieldByName
            ('data_situacao').AsString;
          DataSocial.capital_social := DM_DB.FD_JSON.FieldByName
            ('capital_social').AsString;
          DataSocial.porte := DM_DB.FD_JSON.FieldByName('porte').AsString;
          DataSocial.abertura := DM_DB.FD_JSON.FieldByName('abertura').AsString;
          //
          dadosEnderecoCompleto.CEP :=
            StringReplace(StringReplace(DM_DB.FD_JSON.FieldByName('cep')
            .AsString, '.', '', []), '-', '', []);
          dadosEnderecoCompleto.logradouro :=
            DM_DB.FD_JSON.FieldByName('logradouro').AsString;
          dadosEnderecoCompleto.bairro := DM_DB.FD_JSON.FieldByName
            ('bairro').AsString;
          dadosEnderecoCompleto.localidade :=
            DM_DB.FD_JSON.FieldByName('municipio').AsString;
          dadosEnderecoCompleto.uf := DM_DB.FD_JSON.FieldByName('uf').AsString;
          dadosEnderecoCompleto.complemento :=
            DM_DB.FD_JSON.FieldByName('complemento').AsString;
          //
          DM_DB.FvCliente.FieldByName('CEP').Value := dadosEnderecoCompleto.CEP;
          //
          if Length(dadosEnderecoCompleto.CEP) = 8 then
            Button_Buscar_CepClick(Self);

        end;

      finally
        LHandler.Free;
      end;
    finally
      IdHTTP1.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end;

end.
