object Form1: TForm1
  Left = 255
  Top = 278
  Width = 996
  Height = 687
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
  object Label1: TLabel
    Left = 360
    Top = 40
    Width = 116
    Height = 16
    Caption = #209#242#224#242#252#241#255' '#240#224#241#245#238#228#238#226
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 376
    Top = 64
    Width = 88
    Height = 16
    Caption = #196#229#239#224#240#242#224#236#229#237#242
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 408
    Top = 88
    Width = 23
    Height = 16
    Caption = #195#238#228
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 400
    Top = 112
    Width = 41
    Height = 16
    Caption = #204#229#241#255#246
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 376
    Top = 136
    Width = 85
    Height = 16
    Caption = #200#237#244#238#240#236#224#246#232#255
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 400
    Top = 160
    Width = 43
    Height = 16
    Caption = #209#243#236#236#224
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label7: TLabel
    Left = 1008
    Top = 336
    Width = 17
    Height = 13
    Caption = 'test'
  end
  object Label8: TLabel
    Left = 680
    Top = 168
    Width = 32
    Height = 13
    Caption = 'Label8'
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 240
    Width = 945
    Height = 217
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object ComboBox1: TComboBox
    Left = 488
    Top = 40
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    Text = 'ComboBox1'
    Visible = False
  end
  object ComboBox2: TComboBox
    Left = 488
    Top = 64
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = 'ComboBox2'
    Visible = False
  end
  object ComboBox3: TComboBox
    Left = 488
    Top = 88
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = 'ComboBox3'
    Visible = False
    Items.Strings = (
      '2019'
      '2020'
      '2021'
      '2022'
      '2023')
  end
  object ComboBox4: TComboBox
    Left = 488
    Top = 112
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    Text = 'ComboBox4'
    Visible = False
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
    Left = 488
    Top = 136
    Width = 145
    Height = 21
    TabOrder = 12
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 488
    Top = 160
    Width = 145
    Height = 21
    TabOrder = 13
    Text = 'Edit3'
    Visible = False
  end
  object Button2: TButton
    Left = 656
    Top = 56
    Width = 113
    Height = 25
    Caption = #200#231#236#229#237#232#242#252
    TabOrder = 14
    Visible = False
    OnClick = Button2Click
  end
  object Button5: TButton
    Left = 656
    Top = 24
    Width = 113
    Height = 25
    Caption = #206#225#237#238#226#232#242#252' '#241#239#232#241#234#232
    TabOrder = 15
    Visible = False
    OnClick = Button5Click
  end
  object Button7: TButton
    Left = 488
    Top = 192
    Width = 145
    Height = 25
    Caption = #209#238#245#240#224#237#232#242#252
    TabOrder = 16
    Visible = False
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 664
    Top = 192
    Width = 75
    Height = 25
    Caption = #211#228#224#235#232#242#252
    TabOrder = 17
    Visible = False
    OnClick = Button8Click
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1025
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
  object Button4: TButton
    Left = 136
    Top = 104
    Width = 121
    Height = 25
    Caption = #209#238#245#240#224#237#232#242#252
    TabOrder = 3
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 136
    Top = 48
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
    Left = 264
    Top = 48
    Width = 75
    Height = 25
    Caption = #200#231#236#229#237#232#242#252
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button6: TButton
    Left = 792
    Top = 128
    Width = 129
    Height = 25
    Caption = #221#234#241#239#238#240#242
    TabOrder = 18
    OnClick = Button6Click
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 528
    object Rf1: TMenuItem
      Caption = 'Edit main'
      object Depart1: TMenuItem
        Caption = 'Depart'
        OnClick = Depart1Click
      end
      object Line1: TMenuItem
        Caption = 'Line item'
        OnClick = Line1Click
      end
    end
    object Addreprot1: TMenuItem
      Caption = 'Add reprot'
      OnClick = Addreprot1Click
    end
    object Yearplan1: TMenuItem
      Caption = 'Year plan'
      OnClick = Yearplan1Click
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
    Left = 544
    Top = 488
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 600
    Top = 488
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 656
    Top = 488
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 736
    Top = 480
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 600
    Top = 528
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 656
    Top = 528
  end
  object IBQuery3: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    Left = 600
    Top = 568
  end
  object IBTransaction3: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 656
    Top = 568
  end
end
