object DataM: TDataM
  OldCreateOrder = False
  Height = 229
  Width = 348
  object tblStats: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Statistics'
    Left = 48
    Top = 40
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=triPeak.mdb;Persist' +
      ' Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 128
    Top = 40
  end
  object tblUser: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Users'
    Left = 136
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = tblStats
    Left = 120
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = tblUser
    Left = 192
    Top = 152
  end
end
