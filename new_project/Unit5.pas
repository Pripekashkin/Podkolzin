unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ToolWin, ComCtrls, DB, IBDatabase,
  IBCustomDataSet, IBQuery, ImgList, ActnList, Menus;

type
  TForm5 = class(TForm)
    MainMenu1: TMainMenu;
    Rf1: TMenuItem;
    Depart1: TMenuItem;
    Line1: TMenuItem;
    Addreprot1: TMenuItem;
    Yearplan1: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    ImageList1: TImageList;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button7: TButton;
    Button8: TButton;
    Button6: TButton;
    Button5: TButton;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label9: TLabel;
    Button3: TButton;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

end.
