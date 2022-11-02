unit Stats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, Grids, DBGrids;

type
  Tfrmstats = class(TForm)
    DBGrid1: TDBGrid;
    btnback: TButton;
    btndel: TButton;
    Label1: TLabel;
    Panel1: TPanel;
    Panel6: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    procedure btnbackClick(Sender: TObject);
    procedure btndelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmstats: Tfrmstats;

implementation
uses home,database_u,welcome;
{$R *.dfm}

procedure Tfrmstats.btndelClick(Sender: TObject);
begin
if MessageDlg('Are You sure you want to delete the score',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   DataM.tblStats.Delete; // deletes record
 end;
end;

procedure Tfrmstats.btnbackClick(Sender: TObject);
begin
hide;
frmhome.Show;
end;

procedure Tfrmstats.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmwelcome.Close;
end;

procedure Tfrmstats.FormShow(Sender: TObject);
begin
with DataM do
 begin
   DataM.tblStats.Filter:= 'Username='+ QuotedStr(sUsername);
   DataM.tblStats.Filtered:= true; // filtering
   DataM.tblStats.Sort:= 'Score DESC';      // sorts database
 end;
end;

end.
