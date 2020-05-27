object Form4: TForm4
  Left = -1116
  Top = 96
  Width = 327
  Height = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 48
    Top = 8
    Width = 219
    Height = 20
    Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1072' '#1086#1090#1076#1077#1083#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 16
    Top = 40
    Width = 59
    Height = 13
    Caption = #1044#1077#1081#1089#1090#1074#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 311
    Height = 1
    Caption = 'ToolBar1'
    TabOrder = 0
  end
  object Button3: TButton
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 136
    Top = 112
    Width = 121
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 120
    Top = 48
    Width = 145
    Height = 21
    TabOrder = 3
    OnDblClick = Edit1DblClick
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 64
    Width = 90
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Checked = True
    TabOrder = 4
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 8
    Top = 88
    Width = 90
    Height = 17
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = RadioButton2Click
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 160
    Width = 296
    Height = 217
    DataSource = DataSource1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 528
    object Rf1: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      object Depart1: TMenuItem
        Caption = #1054#1090#1083#1076#1077#1083#1099
        OnClick = Depart1Click
      end
      object Line1: TMenuItem
        Caption = #1057#1090#1072#1100#1080' '#1079#1072#1090#1088#1072#1090
        OnClick = Line1Click
      end
    end
  end
  object ActionList1: TActionList
    Left = 168
    Top = 528
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object ImageList1: TImageList
    Left = 248
    Top = 536
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 368
    Top = 464
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 464
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 480
    Top = 464
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 560
    Top = 456
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 504
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 480
    Top = 504
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 544
  end
  object IBTransaction3: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 480
    Top = 544
  end
end
