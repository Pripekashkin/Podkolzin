object Form7: TForm7
  Left = -980
  Top = 247
  Width = 746
  Height = 509
  Caption = 'Form7'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
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
  object Label1: TLabel
    Left = 112
    Top = 32
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 128
    Top = 56
    Width = 50
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103
  end
  object Label4: TLabel
    Left = 200
    Top = 16
    Width = 112
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103' '#1089#1086' '#1089#1082#1083#1076#1072#1086#1084
  end
  object Label3: TLabel
    Left = 120
    Top = 80
    Width = 59
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object Label5: TLabel
    Left = 144
    Top = 104
    Width = 18
    Height = 13
    Caption = #1050#1090#1086
  end
  object Label6: TLabel
    Left = 144
    Top = 128
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 280
    Width = 673
    Height = 153
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 72
    Width = 90
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Checked = True
    TabOrder = 1
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 8
    Top = 96
    Width = 90
    Height = 17
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = RadioButton2Click
  end
  object Button3: TButton
    Left = 16
    Top = 128
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button1: TButton
    Left = 368
    Top = 176
    Width = 121
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 192
    Top = 32
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnDblClick = ComboBox1DblClick
  end
  object ComboBox2: TComboBox
    Left = 192
    Top = 56
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Items.Strings = (
      #1042#1079#1103#1090#1100
      #1055#1086#1083#1086#1078#1080#1090#1100)
  end
  object Edit1: TEdit
    Left = 192
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object DateTimePicker1: TDateTimePicker
    Left = 192
    Top = 128
    Width = 121
    Height = 21
    Date = 43976.447424166670000000
    Time = 43976.447424166670000000
    TabOrder = 8
  end
  object ComboBox3: TComboBox
    Left = 192
    Top = 104
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    OnDblClick = ComboBox3DblClick
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
    Left = 608
    Top = 432
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 664
    Top = 432
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 720
    Top = 432
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 800
    Top = 424
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 664
    Top = 472
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 720
    Top = 472
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    Left = 664
    Top = 512
  end
  object IBTransaction3: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 720
    Top = 512
  end
end
