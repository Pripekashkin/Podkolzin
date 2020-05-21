object Form4: TForm4
  Left = -1754
  Top = 6
  Width = 334
  Height = 447
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
  object Label2: TLabel
    Left = 40
    Top = 8
    Width = 219
    Height = 20
    Caption = #200#231#236#229#237#229#237#232#229' '#241#238#241#242#224#226#224' '#238#242#228#229#235#238#226
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
    Caption = #196#229#233#241#242#226#232#229
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
    Width = 318
    Height = 1
    Caption = 'ToolBar1'
    TabOrder = 0
  end
  object Button3: TButton
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = #211#228#224#235#232#242#252
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 136
    Top = 112
    Width = 121
    Height = 25
    Caption = #207#240#232#236#229#237#232#242#252
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
    Caption = #196#238#225#224#226#232#242#252
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
    Caption = #208#229#228#224#234#242#232#240#238#226#224#242#252
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
      Caption = #208#229#228#224#234#242#232#240#238#226#224#242#252
      object Depart1: TMenuItem
        Caption = #206#242#228#229#235#251
        OnClick = Depart1Click
      end
      object Line1: TMenuItem
        Caption = #209#242#224#242#252#232' '#231#224#242#240#224#242
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
      'password=masterkey')
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
