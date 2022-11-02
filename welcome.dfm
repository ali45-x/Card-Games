object frmwelcome: Tfrmwelcome
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  ClientHeight = 270
  ClientWidth = 498
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 113
    Top = 183
    Width = 154
    Height = 16
    Caption = 'Enter your Playername:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 113
    Top = 232
    Width = 248
    Height = 25
    Caption = 'Continue'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 498
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = clBtnText
    ParentBackground = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 433
      Top = 0
      Width = 65
      Height = 65
      Align = alRight
      BevelOuter = bvNone
      Caption = '?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -64
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Panel4Click
      ExplicitTop = -8
    end
    object Panel6: TPanel
      Left = 8
      Top = 0
      Width = 137
      Height = 65
      BevelOuter = bvNone
      TabOrder = 1
      object Label5: TLabel
        Left = 50
        Top = 0
        Width = 12
        Height = 23
        Caption = #9827
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 50
        Top = 15
        Width = 10
        Height = 23
        Caption = #9830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 50
        Top = 29
        Width = 11
        Height = 23
        Caption = #9829
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 50
        Top = 44
        Width = 10
        Height = 23
        Caption = #9824
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 68
        Top = 0
        Width = 19
        Height = 23
        Caption = #1421
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 0
        Top = 0
        Width = 19
        Height = 65
        Align = alLeft
        Caption = #1421
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitHeight = 23
      end
      object Label9: TLabel
        Left = 25
        Top = 0
        Width = 19
        Height = 23
        Caption = #1421
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 93
        Top = 0
        Width = 19
        Height = 23
        Caption = #1421
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 66
        Top = 44
        Width = 68
        Height = 21
        Caption = 'ri Peaks'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -19
        Font.Name = 'Britannic Bold'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Memo1: TMemo
    Left = 2
    Top = 89
    Width = 478
    Height = 26
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      'Welcome to you best TriPeaks Game at CAMST.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object Memo2: TMemo
    Left = 26
    Top = 121
    Width = 454
    Height = 32
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      
        'If you do not know how it goes then Hit the Help Button and all ' +
        'will be '
      'explained ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 113
    Top = 205
    Width = 248
    Height = 21
    TabOrder = 4
    TextHint = 'Playername'
    OnDropDown = ComboBox1DropDown
  end
end
