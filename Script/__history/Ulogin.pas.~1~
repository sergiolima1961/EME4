unit Ulogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, IniFiles,
  //
  FireDAC.Comp.Client;
type
  TFLogin = class(TForm)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  var
    FPath: string;
    FDatabase: string;
    FSenha: string;
    FUsuario: string;
    FDriver: string;
    FSecao: string;
  public
    { Public declarations }

    procedure LeINI(); virtual;
    procedure GravaINI(Usuario, Senha,  Banco ,Driver : string); virtual;
    procedure Conectar(var Conexao: TFDConnection); virtual;
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses uDM_testePratico, Main;

procedure TFLogin.Button1Click(Sender: TObject);
begin
  // ativa a tabela
  DM_testepratico.FD_login.close;
  DM_testepratico.FD_login.Params.ParamByName('log').Value := edtUsuario.Text;
  DM_testepratico.FD_login.Params.ParamByName('pw').Value := edtSenha.Text;
  DM_testepratico.FD_login.Open;
  // verifica se os campos coincidem,
  // tanto na tabela, quanto nas edits
  if not DM_testepratico.FD_login.Eof then
  begin
    // mostra outro form
    fMain.Show;
    // esconde o atual
    Self.Hide;
  end
  // se os campos forem vazios
  else if (edtUsuario.Text = '') and (edtSenha.Text = '') then
  begin
    // mostra mensagem
    ShowMessage('Preencha os campos login e senha!');
    edtUsuario.SetFocus;
  end
  else // campos nao conferem
  begin
    // campos nao conferem
    ShowMessage('Usuario ou senha inválidos!');
    edtUsuario.Clear;
    edtSenha.Clear;
  end;
end;

procedure TFLogin.Button2Click(Sender: TObject);
begin
  Halt(0);
end;

procedure TFLogin.FormCreate(Sender: TObject);
var
  ArquivoINI: TIniFile;
begin
  FPath := ExtractFilePath(Application.ExeName) + 'Config.ini';
  FSecao := 'paramentro';
  Conectar(DM_testepratico.fdcDB);
end;

// Lê o arquivo INI e carrega os parâmetros no componente TFDConnection
procedure TFLogin.Conectar(var Conexao: TFDConnection);
begin
  LeINI();

  try
    // Passa os parâmetros para o objeto Conexão
    Conexao.Connected := false;
    Conexao.LoginPrompt := false;
    Conexao.Params.Clear;
    Conexao.Params.Add('user_name=' + FUsuario);
    Conexao.Params.Add('password=' + FSenha);
    Conexao.Params.Add('Database=' + FDatabase);
    Conexao.Params.Add('DriverID=' + FDriver);
    Conexao.Connected := true;
  Except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar parâmetros de conexão!'#13#10 + E.Message);
      Halt(0);
    end;
  end;
end;

// Lê os parâmetros do arquivo INI e atribui para os atributos
procedure TFLogin.LeINI();
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(FPath);
  try
    FDatabase := ArqIni.ReadString(FSecao, 'Database', '');
    FSenha := ArqIni.ReadString(FSecao, 'Password', '');
    FUsuario := ArqIni.ReadString(FSecao, 'User_Name', '');
    FDriver := ArqIni.ReadString(FSecao, 'DriverID', '');
  finally
    ArqIni.Free;
  end;
end;

// Grava os parâmetros recebidos no arquivo INI
procedure TFLogin.GravaINI(Usuario, Senha,  Banco ,Driver : string );
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(FPath);
  try
    ArqIni.WriteString(FSecao, 'User_Name', Usuario);
    ArqIni.WriteString(FSecao, 'Password', Senha);
    ArqIni.WriteString(FSecao, 'Database', Banco);
    ArqIni.WriteString(FSecao, 'DriverID', Driver);
  finally
    ArqIni.Free;
  end;
end;

end.
