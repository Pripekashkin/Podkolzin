object Form1: TForm1
  Left = 661
  Top = 233
  Width = 369
  Height = 381
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 56
    Width = 94
    Height = 16
    Caption = 'ID '#237#224#247#224#235#252#237#232#234#224
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 72
    Top = 24
    Width = 41
    Height = 16
    Caption = #206#242#228#229#235
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 168
    Width = 321
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 56
    Top = 128
    Width = 75
    Height = 25
    Caption = #196#238#225#224#226#232#242#252
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 128
    Width = 75
    Height = 25
    Caption = #200#231#236#229#237#232#242#252
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 216
    Top = 128
    Width = 75
    Height = 25
    Caption = #211#228#224#235#232#242#252
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 120
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit2'
  end
  object Button4: TButton
    Left = 256
    Top = 32
    Width = 75
    Height = 25
    Caption = #209#238#245#240#224#237#232#242#252
    TabOrder = 5
    OnClick = Button4Click
  end
  object ComboBox1: TComboBox
    Left = 128
    Top = 24
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'ComboBox1'
    Items.Strings = (
      '1 Depart'
      '2 Depart'
      '3 Depart'
      '4 Depart'
      '5 Depart')
  end
  object Edit1: TEdit
    Left = 120
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Edit1'
  end
  object Button5: TButton
    Left = 8
    Top = 296
    Width = 75
    Height = 25
    Caption = #194#229#240#237#243#242#252#241#255
    TabOrder = 8
    OnClick = Button5Click
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 184
    Top = 296
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 216
    Top = 296
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 320
    Top = 296
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 256
    Top = 296
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 288
    Top = 296
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 144
    Top = 296
  end
end
