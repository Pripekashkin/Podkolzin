object Form5: TForm5
  Left = -1678
  Top = 124
  Width = 990
  Height = 532
  Caption = #1052#1077#1089#1103#1095#1085#1081' '#1086#1090#1095#1105#1090
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 48
    Width = 94
    Height = 16
    Caption = #1057#1090#1072#1090#1100#1103' '#1079#1072#1090#1088#1072#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 112
    Top = 72
    Width = 88
    Height = 16
    Caption = #1044#1077#1087#1072#1088#1090#1072#1084#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 168
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
  object Label4: TLabel
    Left = 152
    Top = 120
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
  object Label5: TLabel
    Left = 112
    Top = 144
    Width = 85
    Height = 16
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 152
    Top = 168
    Width = 43
    Height = 16
    Caption = #1057#1091#1084#1084#1072
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
    Caption = #1044#1077#1081#1089#1090#1074#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 320
    Top = 8
    Width = 236
    Height = 20
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1084#1077#1089#1103#1095#1085#1086#1075#1086' '#1086#1090#1095#1105#1090#1072
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
    Width = 974
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
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 7
    OnClick = Button7Click
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 72
    Width = 90
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
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
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 9
    OnClick = RadioButton2Click
  end
  object Button3: TButton
    Left = 8
    Top = 136
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 10
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 248
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
  object Button1: TButton
    Left = 552
    Top = 64
    Width = 201
    Height = 25
    Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089#1091#1084#1084#1091' '#1087#1086' '#1086#1090#1076#1077#1083#1072#1084
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 680
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 13
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 528
    object N1: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090
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
      'password=masterkey'
      'lc_ctype=WIN1251')
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
