unit UCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type

  TFCadUsuario = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dsUsuario: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;

    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSProdutoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadUsuario: TFCadUsuario;

implementation

{$R *.dfm}

uses uDM_testePratico;

procedure TFCadUsuario.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DM_DB.FvUsuario.Append;
  DM_DB.FvUsuarioSTATUS.AsBoolean := true;
  DBEdit4.Enabled := True;
end;

procedure TFCadUsuario.Button2Click(Sender: TObject);
begin
  DM_DB.FvUsuario.Cancel;
  DBEdit4.Enabled := True;
  Button1.Enabled := True;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
end;

procedure TFCadUsuario.Button3Click(Sender: TObject);
VAR
  vacao: STRING;
begin

  try
    try

      with DM_DB do
      begin

        case DBGrid1.Tag of
          0:
            begin
              if (DM_DB.FvUsuario.FieldByName('Login').Value ='') or
                (DM_DB.FvUsuario.FieldByName('Login').IsNull) then
              begin
                ShowMessage('Ocorreu um erro.' + #13 +
                  'Por favor, Informe a  Login.');
                DBEdit3.SetFocus;
                exit;
              end;
              //
              if (DM_DB.FvUsuario.FieldByName('Usuario').Value = '')
                or (DM_DB.FvUsuario.FieldByName('Usuario').IsNull)
              then
              begin
                ShowMessage('Ocorreu um erro.' + #13 +
                  'Por favor, Informe a Usuario.');
                DBEdit2.SetFocus;
                exit;
              end;
              //
              if (DM_DB.FvUsuario.FieldByName('Senha').Value = '')
                or (DM_DB.FvUsuario.FieldByName('Senha').IsNull)
              then
              begin
                ShowMessage('Ocorreu um erro.' + #13 +
                  'Por favor, Informe a Senha.');
                DBEdit4.SetFocus;
                exit;
              end;
              //
              IF FvUsuario.State = dsInsert THEN
                vacao := 'I';
              //
              if FvUsuario.State = dsEdit then
                vacao := 'A';

            end;
          1:
            begin

              if FvUsuario.FieldByName('Status').NewValue <>
                FvUsuario.FieldByName('Status').OldValue then
                vacao := 'E';

            end;

        end;


        FtUsuario.Params.ParamByName('ACA').Value := vacao;
        FtUsuario.Params.ParamByName('COD').Value :=
          FvUsuario.FieldByName('ID').Value;
        FtUsuario.Params.ParamByName('NOM').Value :=
          FvUsuario.FieldByName('Usuario').Value;
        FtUsuario.Params.ParamByName('LOG').Value :=
          FvUsuario.FieldByName('Login').Value;
        FtUsuario.Params.ParamByName('SEN').Value :=
          FvUsuario.FieldByName('Senha').Value;
        FtUsuario.Params.ParamByName('ATV').Value :=
          FvUsuario.FieldByName('STATUS').Value;

        FtUsuario.ExecSQL;
      end;
    except
      On E: Exception do
      begin
        ShowMessage('Ocorreu um erro.' + #13 +
          'Por favor, entre em contato com o administrador do sistema.');
        exit;
      end;
    end;

    Button1.Enabled := True;
    Button4.Enabled := (Button1.Enabled);
    Button5.Enabled := (Button1.Enabled);
    Button3.Enabled := not(Button1.Enabled);
    Button2.Enabled := not(Button1.Enabled);
    DBGrid1.Tag := 0;
    DBEdit4.Enabled := True;

    with DM_DB do
    begin
      FvUsuario.Cancel;
      FvUsuario.close;
      FvUsuario.open;
    end;

  finally

  end;

end;

procedure TFCadUsuario.Button4Click(Sender: TObject);
begin
  Button1.Enabled := false;
  Button4.Enabled := (Button1.Enabled);
  Button5.Enabled := (Button1.Enabled);
  Button3.Enabled := not(Button1.Enabled);
  Button2.Enabled := not(Button1.Enabled);
  DM_DB.FvUsuario.Edit;
end;

procedure TFCadUsuario.Button5Click(Sender: TObject);
begin
  if DM_DB.FvUsuario.FieldByName('Status').AsBoolean then
  begin
    if MessageDlg('Confirma a Desativar ?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
    begin
      DBGrid1.Tag := 1;
      DM_DB.FvUsuario.Edit;
      DM_DB.FvUsuario.FieldByName('Status').Value := 0;
      Button3Click(Self);
    end;
  end
  Else
  begin
    if MessageDlg('Confirma a Ativação ?', TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = idYes then
    begin
      DBGrid1.Tag := 1;
      DM_DB.FvUsuario.Edit;
      DM_DB.FvUsuario.FieldByName('Status').Value := 1;
      Button3Click(Self);
    end;

  end;
end;

procedure TFCadUsuario.DSProdutoDataChange(Sender: TObject; Field: TField);
begin
  Label16.Caption := FormatFloat('0###', DM_DB.FvUsuario.RecNo) + '/'
    + FormatFloat('0###', DM_DB.FvUsuario.RecordCount);

  if DM_DB.FvUsuario.FieldByName('Status').AsBoolean then
    Button5.Caption := 'Desativar'
  else
    Button5.Caption := 'Ativar'

end;

procedure TFCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_DB.FvUsuario.close;
end;

procedure TFCadUsuario.FormCreate(Sender: TObject);
begin
  DM_DB.FvUsuario.open;
end;

end.
