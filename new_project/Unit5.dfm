object Form5: TForm5
  Left = -1922
  Top = 482
  Width = 989
  Height = 561
  Caption = 'Form5'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 48
    Width = 94
    Height = 16
    Caption = #209#242#224#242#252#255' '#231#224#242#240#224#242
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 136
    Top = 72
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
  object Label3: TLabel
    Left = 144
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
  object Label4: TLabel
    Left = 136
    Top = 120
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
  object Label5: TLabel
    Left = 112
    Top = 144
    Width = 85
    Height = 16
    Caption = #200#237#244#238#240#236#224#246#232#255
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 136
    Top = 168
    Width = 43
    Height = 16
    Caption = #209#243#236#236#224
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 24
    Top = 48
    Width = 59
    Height = 13
    Caption = #196#229#233#241#242#226#232#229
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 48
    Top = 8
    Width = 243
    Height = 20
    Caption = #209#238#241#242#224#226#235#229#237#232#229' '#236#229#241#255#247#237#238#227#238' '#238#242#247#184#242#224
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 973
    Height = 1
    Caption = 'ToolBar1'
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 200
    Top = 48
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = ComboBox1DblClick
  end
  object ComboBox2: TComboBox
    Left = 200
    Top = 72
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    OnDblClick = ComboBox2DblClick
  end
  object ComboBox3: TComboBox
    Left = 200
    Top = 96
    Width = 145
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
  object ComboBox4: TComboBox
    Left = 200
    Top = 120
    Width = 145
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
  object Edit2: TEdit
    Left = 200
    Top = 144
    Width = 145
    Height = 21
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 200
    Top = 168
    Width = 145
    Height = 21
    TabOrder = 6
  end
  object Button7: TButton
    Left = 200
    Top = 200
    Width = 145
    Height = 25
    Caption = #207#240#232#236#229#237#232#242#252
    TabOrder = 7
    OnClick = Button7Click
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 72
    Width = 90
    Height = 17
    Caption = #196#238#225#224#226#232#242#252
    Checked = True
    TabOrder = 8
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 8
    Top = 96
    Width = 90
    Height = 17
    Caption = #208#229#228#224#234#242#232#240#238#226#224#242#252
    TabOrder = 9
    OnClick = RadioButton2Click
  end
  object Button3: TButton
    Left = 8
    Top = 136
    Width = 75
    Height = 25
    Caption = #211#228#224#235#232#242#252
    TabOrder = 10
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 272
    Width = 945
    Height = 217
    DataSource = DataSource1
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 528
    object N1: TMenuItem
      Caption = #221#234#241#239#238#240#242
      OnClick = N1Click
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
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 496
    Top = 520
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 552
    Top = 520
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 608
    Top = 520
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 688
    Top = 512
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 552
    Top = 560
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 608
    Top = 560
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    Left = 552
    Top = 600
  end
  object IBTransaction3: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 608
    Top = 600
  end
end
