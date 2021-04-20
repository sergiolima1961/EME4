program EME4;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  uDM_testePratico in 'uDM_testePratico.pas' {DM_DB: TDataModule},
  CadCliente in 'CadCliente.pas' {fCadCliente},
  InscricaoFiscal in 'InscricaoFiscal.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_DB, DM_DB);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
