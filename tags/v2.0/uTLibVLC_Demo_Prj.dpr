program uTLibVLC_Demo_Prj;

uses
  Forms,
  uTLibVLC_Demo in 'uTLibVLC_Demo.pas' {FrmMain},
  uTLibVLC in 'uTLibVLC.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
