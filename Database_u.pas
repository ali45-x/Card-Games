unit Database_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataM = class(TDataModule)
    tblStats: TADOTable;
    ADOConnection1: TADOConnection;
    tblUser: TADOTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataM: TDataM;

implementation

{$R *.dfm}

end.
