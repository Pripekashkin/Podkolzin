object Form6: TForm6
  Left = -718
  Top = 200
  AutoScroll = False
  Caption = #1057#1091#1084#1084#1072
  ClientHeight = 386
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 104
    Top = 48
    Width = 11
    Height = 16
    Caption = #1057
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 176
    Top = 48
    Width = 21
    Height = 16
    Caption = #1055#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 24
    Top = 96
    Width = 23
    Height = 16
    Caption = #1043#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 16
    Top = 72
    Width = 41
    Height = 16
    Caption = #1052#1077#1089#1103#1094
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 16
    Top = 120
    Width = 45
    Height = 16
    Caption = #1057#1090#1072#1090#1100#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 227
    Height = 16
    Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1074#1088#1077#1084#1077#1085#1085#1086#1084#1091' '#1087#1088#1086#1084#1077#1078#1091#1090#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 360
    Top = 592
    Width = 225
    Height = 49
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ComboBox4: TComboBox
    Left = 80
    Top = 120
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = ComboBox4DblClick
  end
  object ComboBox5: TComboBox
    Left = 80
    Top = 72
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
  end
  object ComboBox6: TComboBox
    Left = 80
    Top = 96
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      '2019'
      '2020'
      '2021'
      '2022'
      '2023')
  end
  object ComboBox7: TComboBox
    Left = 152
    Top = 72
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
  end
  object ComboBox8: TComboBox
    Left = 152
    Top = 96
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Items.Strings = (
      '2019'
      '2020'
      '2021'
      '2022'
      '2023')
  end
  object Button6: TButton
    Left = 80
    Top = 144
    Width = 145
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 6
    OnClick = Button6Click
  end
  object Edit1: TEdit
    Left = 424
    Top = 544
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 424
    Top = 568
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'Edit2'
  end
  object StringGrid1: TStringGrid
    Left = 40
    Top = 184
    Width = 249
    Height = 177
    ColCount = 2
    FixedCols = 0
    RowCount = 10
    TabOrder = 9
    ColWidths = (
      155
      54)
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
    Left = 96
    Top = 504
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 504
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 208
    Top = 504
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 288
    Top = 496
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 544
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 208
    Top = 544
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    Left = 152
    Top = 584
  end
  object IBTransaction3: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 208
    Top = 584
  end
end
