object Form6: TForm6
  Left = -1675
  Top = 490
  Width = 419
  Height = 477
  Caption = 'Form6'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 160
    Top = 48
    Width = 9
    Height = 16
    Caption = #209
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 248
    Top = 48
    Width = 18
    Height = 16
    Caption = #207#238
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 96
    Top = 96
    Width = 23
    Height = 16
    Caption = #195#238#228
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 88
    Top = 72
    Width = 41
    Height = 16
    Caption = #204#229#241#255#246
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 16
    Top = 128
    Width = 116
    Height = 16
    Caption = #209#242#224#242#252#241#255' '#240#224#241#245#238#228#238#226
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 72
    Top = 8
    Width = 258
    Height = 20
    Caption = #209#244#238#240#236#232#240#238#226#224#242#252' '#238#242#247#184#242' '#239#238' '#226#240#229#236#229#237#232
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 216
    Width = 385
    Height = 217
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ComboBox4: TComboBox
    Left = 136
    Top = 128
    Width = 161
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = ComboBox4DblClick
  end
  object ComboBox5: TComboBox
    Left = 136
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
    Left = 136
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
    Left = 224
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
    Left = 224
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
  object Button5: TButton
    Left = 312
    Top = 120
    Width = 75
    Height = 25
    Caption = #206#225#237#238#226#232#242#252
    TabOrder = 6
  end
  object Button6: TButton
    Left = 104
    Top = 168
    Width = 209
    Height = 25
    Caption = #194#251#226#229#241#242#232
    TabOrder = 7
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
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
