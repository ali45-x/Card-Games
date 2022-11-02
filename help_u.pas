unit help_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls;

type
  TfrmHelp = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelp: TfrmHelp;

implementation
uses home;
{$R *.dfm}

procedure TfrmHelp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 hide;
 frmhome.Show;
end;

procedure TfrmHelp.FormCreate(Sender: TObject);
begin
Memo1.Lines.Clear;
if FileExists('tools\Guide.txt') then
Memo1.Lines.LoadFromFile('tools\Guide.txt');    // reads from textfile for help
end;

end.
