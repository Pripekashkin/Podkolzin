unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ToolWin, ComCtrls, DB, IBDatabase,
  IBCustomDataSet, IBQuery, ImgList, ActnList, Menus, IniFiles;

type
  TForm4 = class(TForm)
    ToolBar1: TToolBar;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    Rf1: TMenuItem;
    Depart1: TMenuItem;
    Line1: TMenuItem;
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
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Line1Click(Sender: TObject);
    procedure Depart1Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    FNew: Boolean;
    CheckFirstTable: String;
    ExecuteProcedure: String;
    Select: string;
    CheckRefresh: boolean;
    LineToId: Integer;
    DepartToId: Integer;
    WordI: Integer;
    DateM: array [1..30] of string;
    DateY: array [1..30] of string;
    NameD: array [1..30] of string;
    Info: array [1..30] of string;
    Sum: array [1..30] of string;
    inc, ExcelI: integer;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
procedure TForm4.FormCreate(Sender: TObject);
  var
  FIniFile: TIniFile;
begin
  CheckFirstTable := 'depart';
  ExecuteProcedure := 'proc_depart';
  Select := 'name';
  FNew := true;
  Form4.Caption := 'Состав отделов';
  try
    FIniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
    try
      IBDatabase1.DatabaseName := FIniFile.ReadString('Base', 'Path', '');
   finally
     FIniFile.Free;
   end;
   IBDatabase1.Connected := true;
   with IBQuery1 do
   begin
    SQL.Text := 'select id as "Номер", name as "Имя отдела" from '+ CheckFirstTable +' order by id';  //depart line_item
    Open;
   end;
  except
   on E: Exception do
  begin
      Application.MessageBox(Pchar(E.Message), 'error', MB_ICONERROR);
      Halt;
   end;
  end;
  end;




procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    IBQuery1.Close;
  IBDatabase1.Connected := false;
end;

procedure TForm4.Button4Click(Sender: TObject); //apply form
begin
  try
   with IBQuery2 do
   begin
    if FNew then
      SQL.Text :=
      'execute procedure '+ ExecuteProcedure +'(-1, ''' +  Edit1.Text + ''')'
    else
      SQL.Text := 'execute procedure '+ ExecuteProcedure +'(' +IBQuery1.FieldByName('Номер').AsString + ', ''' +  Edit1.Text + ''')';
    Transaction.StartTransaction;
    ExecSQL;
    Transaction.Commit;
    Transaction.Active := false;
    end;
    IBQuery1.Close;
    IBQuery1.Open;
  except
   on E: Exception do
  begin
      if  IBQuery2.Active then
        IBQuery2.Transaction.Rollback;
      Application.MessageBox(Pchar(E.Message), 'Error', MB_ICONERROR);
   end;
  end;
end;

procedure TForm4.Line1Click(Sender: TObject);
begin
  Label2.Caption := 'Изменение  статей  затрат';
  CheckFirstTable := 'line_item';
  Form4.Caption := 'Статья затрат';

  with IBQuery1 do
   begin
    SQL.Text := 'select id as "Номер", info as "Статья расходов" from '+ CheckFirstTable +' order by id';  //depart line_item
    Open;
   end;

end;

procedure TForm4.Depart1Click(Sender: TObject);
begin
    Label2.Caption := 'Изменение состава отделов';
    CheckFirstTable := 'depart';
      Form4.Caption := 'Состав отделов';

    with IBQuery1 do
   begin
    SQL.Text := 'select id as "Номер", name as "Имя отдела" from '+ CheckFirstTable +' order by id';  //depart
    Open;
   end;

end;

procedure TForm4.Edit1DblClick(Sender: TObject);
begin
    Edit1.Text := DBGrid1.columns[1].Field.asString;
end;

procedure TForm4.RadioButton1Click(Sender: TObject);
begin
  FNew := true;
  RadioButton2.Checked := false;
end;

procedure TForm4.RadioButton2Click(Sender: TObject);
begin
  FNew := false;
  RadioButton1.Checked := false;
end;

end.
