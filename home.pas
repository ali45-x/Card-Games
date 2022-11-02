unit home;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GIFImg, pngimage, StdCtrls, jpeg, ExtCtrls,math, Buttons;

type
  Tfrmhome = class(TForm)
    pnlMain: TPanel;
    pnlpile: TPanel;
    imgplay: TImage;
    imgnext: TImage;
    lbldeals: TLabel;
    pnlShow: TPanel;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    btnclick: TButton;
    pnltop: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    pnlwhat: TPanel;
    TimerCheck: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure imgnextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnclickClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure pnlwhatMouseEnter(Sender: TObject);
    procedure pnltopMouseLeave(Sender: TObject);
    procedure TimerCheckTimer(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure  HoverCard(Sender: TObject);
  procedure  PlayCard(Sender :TObject);
  procedure  MixNum;
  procedure  RestartGame;
  function   imgname(i:integer):string;
  procedure  UnveilCards(i:integer;ival:integer);
  function   isOver:Boolean;
  procedure  EditUsersInfo;
  end;

var
  frmhome: Tfrmhome;
  arrcard:array[1..52] of TImage;
  arrcardHolder:array[1..52] of TPanel;
  i,ileft,iShuffle,icardsleft,iWhat,inow,iscore:integer;
  arrNumber,arrValue: array[1..52] of Integer;
  MessageVisible:Boolean;

implementation
uses welcome,stats,help_u,Database_u;
{$R *.dfm}

procedure Tfrmhome.btnclickClick(Sender: TObject);
begin
if CheckBox1.Checked=true then
 begin
   MessageVisible:= false;             // user does not want to see the message
 end;
 pnlShow.Left:= -4000;
end;

procedure Tfrmhome.Button5Click(Sender: TObject);
begin
frmwelcome.Show;
hide;
end;

procedure Tfrmhome.Button6Click(Sender: TObject);
begin
Hide;
frmhelp.Show;
end;

procedure Tfrmhome.pnltopMouseLeave(Sender: TObject);
begin
pnltop.hide;
pnlwhat.Show;
end;

procedure Tfrmhome.pnlwhatMouseEnter(Sender: TObject);
begin
pnltop.Show;
pnlwhat.Hide;
end;

procedure Tfrmhome.Panel4Click(Sender: TObject);
begin
frmHelp.Show;
hide;
end;

procedure Tfrmhome.Panel6Click(Sender: TObject);
begin
frmstats.show;
hide;
with DataM do
 begin
   DataM.tblStats.Filter:= 'Username='+ QuotedStr(sUsername);
   DataM.tblStats.Filtered:= true; // filtering
   DataM.tblStats.Sort:= 'Score DESC';      // sorts database
 end;
end;

procedure Tfrmhome.PlayCard(Sender: TObject);
var
bplay:Boolean;          // when a card is clicked this is what happens
begin
for I := 1 to 52 do
  Begin
    if Sender=arrcard[i] then         // finds which card is clicked
    begin
     bplay:= false;
     if ((arrValue[i]+1)= arrValue[inow]) or (((arrValue[i]-1) = arrValue[inow]))   then
      begin
        bplay:= true;                         // checks if the play is valid using math and array of value of card
      end;
      if (arrValue[i]=13) and (arrValue[inow]=1) then bplay:= true;   // aces and king
      if (arrValue[i]=1) and (arrValue[inow]=13) then bplay:= true;
      if bplay=true then
      begin
       iscore:= iscore + 10;
       imgplay.Picture.LoadFromFile(imgname(arrnumber[i]));     // play was valid card is removed
       arrcardHolder[i].Visible:= false;
       inow:= i;
      end else
      if MessageVisible=true then                 // checks if user wants the message
      begin
       while pnlShow.Left<>10                do
        begin
         pnlShow.Left:= pnlShow.Left + 1;        // shows message in pnl form
        end;
        beep;
       end;
    end;
  End;
  if (arrcardHolder[26].Visible=false) and  (arrcardHolder[27].Visible=false) and  (arrcardHolder[28].Visible=false)   then
   begin
     ShowMessage('You have won the Game');   // person finshed all the cards
     EditUsersInfo;
     RestartGame;                                         // restars
   end;
end;

procedure Tfrmhome.HoverCard(Sender: TObject);
begin
 for I := 1 to 28 do
   begin
    if (sender = arrcard[i]) and (arrcard[i].Enabled=true) then // when you hover over a card this is what happens
    begin
      arrcardHolder[i].ParentBackground := false;        // active card                 // color changes
    end
    else
     begin
      arrcardHolder[i].ParentBackground := true;       // unactive or blocked cards
     end;
   end;
end;

procedure Tfrmhome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmwelcome.Close;             // close all forms by closing the main form
end;

procedure Tfrmhome.FormCreate(Sender: TObject);
begin
RestartGame;                      // makes cards and shuffles                    // no score for user
end;

function Tfrmhome.isOver: Boolean;
Var
inumleft,j:integer;
arrleft: array[1..52] of Integer;
begin
inumleft:= 0;
Result:= true;
for i := 1 to 28 do
  begin
    if (arrcardHolder[i].Visible=true) and (arrcard[i].Enabled=true) and (imgnext.Visible=false) then
     begin
       Inc(inumleft);
       beep;
       arrleft[inumleft]:= i;         // checks cards left
     end;
  end;

if inumleft<>0 then                                        // if there are cards left
begin
    for j := 1 to inumleft do
      begin
        if ((arrValue[inow]+1)=arrValue[arrleft[j]]) or ((arrValue[inow]-1) = arrValue[arrleft[j]])   then
         begin
          Result:= false;                      // user can still play
         end;
        if (arrValue[arrleft[j]]=13) and (arrValue[inow]=1) then Result:= false;      // user can still play with aces or king
        if (arrValue[arrleft[j]]=1) and (arrValue[inow]=13) then Result:= false;
      end;
end;
if imgnext.Visible=true then
 begin
   Result:= false;                // there are still cards in the pile
 end;

end;

function Tfrmhome.imgname(i: integer): string;
begin
 Result:= 'Tools\deck\deck ('+IntToStr(i)+').png'   // loads card function
end;

procedure Tfrmhome.imgnextClick(Sender: TObject);
begin
if inow <> 52 then
begin
 inow:= iWhat + 1;
 iWhat:= inow;
 lbldeals.Caption:= IntToStr(52-inow) + ' to go'; // number of cards left in the pile
 imgplay.Picture.LoadFromFile(imgname(arrnumber[inow]));   // loads lext card
 if inow = 52 then
   imgnext.Hide;          // no cards left
end else
 begin
   ShowMessage('You have no more options');     // no cards left
 end;
end;

procedure Tfrmhome.RestartGame;
var
ileftinc,itop :integer;             // creates dymamic cards and pnl
begin
 if Assigned(arrcardHolder[28]) then // cards exist
  begin
    for I := 1 to 52 do
      begin
        arrcard[i].Free;
        arrcardHolder[i].Free;               // deletes prvious cards if there was
      end;
  end;
TimerCheck.Interval:= 1;   // for quick reation in game- you could play around if you do not belive
MixNum;
iscore:= 0;          // no score
MessageVisible:= true;
ileft:= -85;
ileftinc:= 123;       // for properties of cards
itop:=339;
iWhat:=29;
for I := 1 to 28 do                            // 28 playable cards others in pile
 begin
   arrcardHolder[i]:= TPanel.Create(self); // creates pnl for img
   with arrcardHolder[i] do
    begin
     parent:= pnlMain;
     ileft:= ileft+ileftinc;
     BevelOuter:= bvNone;
     ParentBackground:= true;
     arrcardHolder[i].BringToFront;
     case i of
     11: begin
          ileft:= 66;
          itop:= itop - 90;             // row 2
          ileftinc:= 132;
         end;
     20: begin
          itop:= itop - 90;         //row3
          ileft:= 120;
          ileftinc:= 175 ;
         end;
     22: begin
          ileft:= 510;
         end;            // row 3 number 2
     24: begin                             // properties of pnl and positioning in peaks-triangles
          ileft:= 905;
         end;          // row 3 number 3
     26: begin
          ileft:= 205;
          itop:= itop  - 90;       // row 4
          ileftinc:= 395;
         end;
     end;
        if i>10 then
         begin
          arrcardHolder[i].SendToBack;          // front cards on top of blocked cards but still overlap
         end;
        Left:= ileft; top:= itop; Width:= 113;  Height:= 160; // places position
     end;
     arrcard[i]:= TImage.Create(self);     // card
     with arrcard[i] do
     begin
      if i<11 then                        // 10 cards in row 1
       begin
        iShuffle:= arrNumber[i];
        arrcard[i].Picture.LoadFromFile(imgname(iShuffle));   // row 1
       end else
        begin
         arrcard[i].Picture.LoadFromFile('tools\deck\behind.png'); // loads img
         arrcard[i].Enabled:= false;        // not in row 1
        end;
      parent:= arrcardHolder[i];
      Width:= 113;  Height:= 160; top:= 0;  Left:= 0;
      Stretch:=true;
      OnMouseEnter := HoverCard;                 // the two procedure for cards
      OnClick:= PlayCard;                    // plays a card
     end;
    end;
   iShuffle:= arrNumber[29];      // temp card
   inow:=  29;
   imgplay.Picture.LoadFromFile(imgname(iShuffle));// top of pile
   lbldeals.Caption:= '23 to go';         // number of cards left
   imgnext.Show;
end;


procedure Tfrmhome.UnveilCards(i, ival: integer);
begin
case ival  of
 1: begin
   if (arrcardHolder[i].Visible=false) and ( (arrcardHolder[i+1].Visible=false)) then
    begin
     arrcard[i+10].Picture.LoadFromFile(imgname(arrnumber[i+10]));
     arrcard[i+10].Enabled:= true;             //  row 7
    end;
   end;
 2 : begin
     if (arrcardHolder[i].Visible=false) and ( (arrcardHolder[i+1].Visible=false)) then
      begin
       arrcard[i+9].Picture.LoadFromFile(imgname(arrnumber[i+9]));
       arrcard[i+9].Enabled:= true;               // row6
      end;
     end;
 3:  begin
     if (arrcardHolder[i].Visible=false) and ( (arrcardHolder[i+1].Visible=false)) then
      begin
       arrcard[i+8].Picture.LoadFromFile(imgname(arrnumber[i+8]));
       arrcard[i+8].Enabled:= true;           // row5
      end;
     end;
 4:  begin
      if (arrcardHolder[i].Visible=false) and ( (arrcardHolder[i+1].Visible=false)) then
       begin
        arrcard[i+7].Picture.LoadFromFile(imgname(arrnumber[i+7]));
        arrcard[i+7].Enabled:= true;
       end;
     end;
 5:  begin
      if (arrcardHolder[i].Visible=false) and ( (arrcardHolder[i+1].Visible=false)) then
       begin
        arrcard[i+6].Picture.LoadFromFile(imgname(arrnumber[i+6]));
        arrcard[i+6].Enabled:= true;                 // row4
       end;
     end;
 6:  begin
      if (arrcardHolder[i].Visible=false) and ( (arrcardHolder[i+1].Visible=false)) then
       begin
        arrcard[i+5].Picture.LoadFromFile(imgname(arrnumber[i+5]));
        arrcard[i+5].Enabled:= true;              // row2
       end;
     end;
 7:  begin
     if (arrcardHolder[i].Visible=false) and ( (arrcardHolder[i+1].Visible=false)) then
      begin
       arrcard[i+4].Picture.LoadFromFile(imgname(arrnumber[i+4]));
       arrcard[i+4].Enabled:= true;              // row2
      end;
     end;
end;
end;


procedure Tfrmhome.MixNum;
var
ishuffle,ival,k,p:integer;
bdup: Boolean;
begin
ishuffle:= 0;
for i := 1 to 52 do
  begin
    arrNumber[i]:= 0;
  end;
 while ishuffle<>52 do
  begin
   bdup:= false;
   ival:= RandomRange(1,53);      // randomizes card order so each game is different
   for I := 1 to 52 do
     begin
      if (ival=arrNumber[i]) or  (ival>52) then       // checking for duplicated
       begin
        bdup:= true;
       end;
     end;
    if bdup=false then
     begin
       Inc(ishuffle);                    // sets shuffled numbers for cards
       arrNumber[ishuffle]:= ival;
        if (ival>0)  and (ival<5)   then  begin arrValue[ishuffle]:= 1;   end;         // all 1'
        if (ival>4)  and (ival<9)   then  begin arrValue[ishuffle]:= 2;   end;        // all 1'
        if (ival>8)  and (ival<13)  then  begin arrValue[ishuffle]:= 3;   end;        // .. so on till king with value of 13
        if (ival>12) and (ival<17)  then  begin arrValue[ishuffle]:= 4;   end;
        if (ival>16) and (ival<21)  then  begin arrValue[ishuffle]:= 5;   end;
        if (ival>20) and (ival<25)  then  begin arrValue[ishuffle]:= 6;   end;
        if (ival>24) and (ival<29)  then  begin arrValue[ishuffle]:= 7;   end;
        if (ival>28) and (ival<33)  then  begin arrValue[ishuffle]:= 8;   end;
        if (ival>32) and (ival<37)  then  begin arrValue[ishuffle]:= 9;   end;
        if (ival>36) and (ival<41)  then  begin arrValue[ishuffle]:= 10;  end;
        if (ival>40) and (ival<45)  then  begin arrValue[ishuffle]:= 11;  end;    // jacks
        if (ival>44) and (ival<49)  then  begin arrValue[ishuffle]:= 12;  end;
        if (ival>48) and (ival<53)  then  begin arrValue[ishuffle]:= 13;  end;
     end;
  end;

end;

procedure Tfrmhome.SpeedButton1Click(Sender: TObject);
begin
if MessageDlg('Are you sure abou this?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
 begin
   RestartGame;         // resets all and - validated- confirms action
 end;
end;

procedure Tfrmhome.TimerCheckTimer(Sender: TObject);
begin
if isOver=true then
begin
TimerCheck.Interval:= 1000000;              // shows the reaction of timer so that many messages do not pop up thank you
if MessageDlg('You Lost',mtInformation,[mbOK],0)=mrOk then
 begin
   EditUsersInfo;          // no more moves
   RestartGame;                   // remakes cards
 end;
end;
if Assigned(arrcardHolder[1]) then
begin
 for I := 1  to   9 do begin   UnveilCards(i,1);  end;
 for I := 11 to  12 do begin   UnveilCards(i,2);  end;
 for I := 14 to  15 do begin   UnveilCards(i,3);  end;  // ckecks to make blocked cards  visible using advance math
 for I := 17 to  18 do begin   UnveilCards(i,4);  end;
 for I := 20 to  20 do begin   UnveilCards(i,5);  end;
 for I := 22 to  22 do begin   UnveilCards(i,6);  end;
 for I := 24 to  24 do begin   UnveilCards(i,7);  end;
end;
end;

procedure Tfrmhome.EditUsersInfo;
var
brow,brow2,brow3,borw4:Boolean;
begin
 DataM.tblUser.Filter:= 'Username='+ QuotedStr(LowerCase(sUsername));
 DataM.tblUser.Filtered:= true;
 DataM.tblUser.Edit;
 DataM.tblUser['TimesPlayed']:=  DataM.tblUser['TimesPlayed'] + 1;           // updates the user info once done playing
 DataM.tblUser['TotalScore']:=  DataM.tblUser['TotalScore'] + iscore;// summing  maximum
 DataM.tblUser.Post;              // tbl user is updates
 DataM.tblStats.Insert;
 DataM.tblStats['Username']:= LowerCase(sUsername);
 DataM.tblStats['Score']:= iscore;
 brow:= true;                                        // game info is added to tblstats
 brow2:= false;
 brow3:= false;
 for i := 1 to 10 do
     if arrcardHolder[i].Visible=true then  brow:= false;              //row 1 cleared

 if brow=true then
  begin
   brow2:= true; for I := 11 to 19 do                                 // rows cleared 2
   if arrcardHolder[i].Visible= true then brow2:= false;
  end;

  if brow2=true then
  begin
   brow3:= true; for I := 20 to 25 do                                       // .. so on row 3 and 4 checked after then posted into database
   if arrcardHolder[i].Visible= true then brow3:= false;
  end;
  if (arrcardHolder[26].Visible=false) and  (arrcardHolder[27].Visible=false) and  (arrcardHolder[28].Visible=false) and (brow3=true)  then
     begin
       DataM.tblStats['Rows']:= 4;
     end else if brow3=true then
        begin
         DataM.tblStats['Rows']:= 3;               // rows cleard
        end else if brow2=true then
         begin                                     // not realty in use but advance
          DataM.tblStats['Rows']:= 4;
         end else
         begin
          DataM.tblStats['Rows']:= 1;
         end;
 DataM.tblStats.Post;      // post into tblstats
end;

end.
