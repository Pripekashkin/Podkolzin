object Form1: TForm1
  Left = -939
  Top = 235
  Width = 603
  Height = 608
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 587
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
  end
  object Button3: TButton
    Left = 24
    Top = 104
    Width = 75
    Height = 25
    Caption = #211#228#224#235#232#242#252
    TabOrder = 1
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 240
    Width = 505
    Height = 120
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button4: TButton
    Left = 240
    Top = 176
    Width = 75
    Height = 25
    Caption = #209#238#245#240#224#237#232#242#252
    TabOrder = 3
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 176
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 48
    Width = 113
    Height = 17
    Caption = #196#238#225#224#226#232#242#252
    Checked = True
    TabOrder = 5
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 72
    Width = 113
    Height = 17
    Caption = #208#229#228#224#234#242#232#240#238#226#224#242#252
    TabOrder = 6
    OnClick = RadioButton2Click
  end
  object Button1: TButton
    Left = 336
    Top = 56
    Width = 75
    Height = 25
    Caption = #206#225#237#238#226#232#242#252
    TabOrder = 7
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 72
    Top = 456
    object Rf1: TMenuItem
      Caption = 'Controls'
      object Depart1: TMenuItem
        Caption = 'Depart'
        OnClick = Depart1Click
      end
      object Line1: TMenuItem
        Caption = 'Line item'
      end
    end
  end
  object ActionList1: TActionList
    Left = 136
    Top = 456
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object ImageList1: TImageList
    Left = 216
    Top = 464
  end
  object IBDatabase1: TIBDatabase
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 512
    Top = 416
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 568
    Top = 416
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 624
    Top = 416
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 704
    Top = 408
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 568
    Top = 456
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 624
    Top = 456
  end
end
