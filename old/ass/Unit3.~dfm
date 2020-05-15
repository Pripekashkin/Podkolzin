object Form3: TForm3
  Left = -977
  Top = 573
  Width = 699
  Height = 334
  Caption = 'Form3'
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
    Left = 176
    Top = 16
    Width = 72
    Height = 13
    Caption = #205#238#236#229#240' '#238#242#228#229#235#224
  end
  object Label2: TLabel
    Left = 136
    Top = 40
    Width = 112
    Height = 13
    Caption = #206#239#232#241#224#237#232#229' '#242#240#224#237#231#224#234#246#232#232
  end
  object Label3: TLabel
    Left = 192
    Top = 64
    Width = 53
    Height = 13
    Caption = #202#224#242#229#227#238#240#232#255
  end
  object Label4: TLabel
    Left = 208
    Top = 88
    Width = 34
    Height = 13
    Caption = #209#243#236#236#224
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 168
    Width = 665
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
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = #196#238#225#224#226#232#242#252
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 48
    Width = 75
    Height = 25
    Caption = #200#231#236#229#237#232#242#252
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 80
    Width = 75
    Height = 25
    Caption = #211#228#224#235#232#242#252
    TabOrder = 3
    OnClick = Button3Click
  end
  object ComboBox1: TComboBox
    Left = 256
    Top = 16
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 256
    Top = 40
    Width = 289
    Height = 21
    TabOrder = 5
  end
  object ComboBox2: TComboBox
    Left = 256
    Top = 64
    Width = 289
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Items.Strings = (
      'Category one'
      'Category two'
      'Category three'
      'Category four'
      'Category five')
  end
  object Edit2: TEdit
    Left = 256
    Top = 88
    Width = 73
    Height = 21
    TabOrder = 7
  end
  object Button4: TButton
    Left = 344
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 400
    Top = 128
    Width = 137
    Height = 25
    Caption = #209#238#245#240#224#237#232#242#252
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 248
    Top = 128
    Width = 137
    Height = 25
    Caption = #209#225#240#238#241#232#242#252' '#239#238#235#255
    TabOrder = 10
    OnClick = Button6Click
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 880
    Top = 24
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 840
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 912
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 912
    Top = 168
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 864
    Top = 64
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 896
    Top = 64
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 880
    Top = 112
  end
end
