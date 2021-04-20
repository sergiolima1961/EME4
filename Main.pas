unit Main;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Actions,
  Vcl.ActnList,
  System.ImageList,
  Vcl.ImgList,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TfMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PanelWorkArea: TPanel;
    Label1: TLabel;
    Button1: TButton;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ActionCadContato: TAction;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ActionCadContatoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FFormActive: TForm;
    procedure LoadForm(AClass: TFormClass);
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses
  CadCliente, uDM_testePratico;

procedure TfMain.ActionCadContatoExecute(Sender: TObject);
begin
  Self.LoadForm(TfCadCliente);
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_db.FD_SQLlocal.close;
  close;
  Halt(0);
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  DM_db.FD_SQLlocal.Open();
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  Label1.Caption := Label1.Caption;

end;

procedure TfMain.LoadForm(AClass: TFormClass);
var
  slQuery: TStringList;
begin
  slQuery := TStringList.Create;

  if Assigned(Self.FFormActive) then
  begin
    Self.FFormActive.close;
    Self.FFormActive.Free;
    Self.FFormActive := nil;
  end;

  Self.FFormActive := AClass.Create(nil);
  Self.FFormActive.Parent := Self.PanelWorkArea;
  Self.FFormActive.BorderStyle := TFormBorderStyle.bsNone;

  Self.FFormActive.Top := 0;
  Self.FFormActive.Left := 0;
  Self.FFormActive.Align := TAlign.alClient;

  fMain.Caption := Self.FFormActive.Caption;

  Self.FFormActive.Show;
end;

end.
