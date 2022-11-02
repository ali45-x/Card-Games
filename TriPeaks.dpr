program TriPeaks;

uses
  Forms,
  welcome in 'welcome.pas' {frmwelcome},
  home in 'home.pas' {Fhome},
  Stats in 'Stats.pas' {frmstats},
  Database_u in 'Database_u.pas' {DataM: TDataModule},
  help_u in 'help_u.pas' {frmHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmwelcome, frmwelcome);
  Application.CreateForm(TFrmhome, Frmhome);
  Application.CreateForm(Tfrmstats, frmstats);
  Application.CreateForm(TDataM, DataM);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.Run;
end.
