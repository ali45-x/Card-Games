unit welcome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, jpeg;

type
  Tfrmwelcome = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Panel4: TPanel;
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
    Memo1: TMemo;
    Memo2: TMemo;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwelcome: Tfrmwelcome;
  sUsername: string;

implementation

uses stats, home, Database_u, help_U;
{$R *.dfm}

procedure Tfrmwelcome.Button1Click(Sender: TObject);
begin
  if combobox1.Text <> '' then // checks info in the edits was entered
  begin
    if not DataM.tblUser.Locate('Username', LowerCase(combobox1.Text), []) then
    // check if username exists
    begin
      DataM.tblUser.Insert; // adds user info to database
      DataM.tblUser['Username'] := LowerCase(combobox1.Text);
      DataM.tblUser.Post;
      frmhelp.show;
    end
    else
    begin
      frmhome.show; // go to game
    end;
    hide;
    sUsername := LowerCase(combobox1.Text);
  end
  else
  begin
    ShowMessage('Enter your name in the edit');
    combobox1.SetFocus; // sets focus to edit
  end;
end;

procedure Tfrmwelcome.ComboBox1DropDown(Sender: TObject);
begin
DataM.tblUser.First;
ComboBox1.Items.Clear;
while not DataM.tblUser.Eof do
 begin
 ComboBox1.Items.Add(DataM.tblUser['Username']);
 DataM.tblUser.Next;
 end;
end;

procedure Tfrmwelcome.FormShow(Sender: TObject);
begin
   Frmhome.Visible := false;
end;

procedure Tfrmwelcome.Panel4Click(Sender: TObject);
begin
ShowMessage('Enter Your playername then,hit continue');
end;

end.
