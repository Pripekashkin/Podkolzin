unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, StdActns, ImgList, ToolWin, ComCtrls, StdCtrls,
  Grids, DBGrids, DB, IBDatabase, IBCustomDataSet, IBQuery, IniFiles;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    Rf1: TMenuItem;
    Depart1: TMenuItem;
    Line1: TMenuItem;
    Action1: TAction;
    Button3: TButton;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button4: TButton;
    Edit1: TEdit;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;
    Addreprot1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Depart1Click(Sender: TObject);
    procedure Line1Click(Sender: TObject);
  private
    FNew: Boolean;
    CheckFirstTable: String;
    ExecuteProcedure: String;
    SelDep, SelLin : string;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
  var
  FIniFile: TIniFile;
begin
  CheckFirstTable := 'depart';
  ExecuteProcedure := 'proc_depart';
  FNew := true;
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
    SQL.Text := 'select *  from '+ CheckFirstTable +'';  //depart line_item
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

  procedure Tform1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  try
   with IBQuery2 do
   begin
    if FNew then
      SQL.Text :=
      'execute procedure '+ ExecuteProcedure +'(-1, ''' +  Edit1.Text + ''')'
    else
      SQL.Text := 'execute procedure '+ ExecuteProcedure +'(' +IBQuery1.FieldByName('ID').AsString + ', ''' +  Edit1.Text + ''')';
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

procedure TForm1.Button3Click(Sender: TObject);
begin
    try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from '+ CheckFirstTable +' where id = ' +IBQuery1.FieldByName('ID').AsString;
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

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
FNew := true;
RadioButton2.Checked := false;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
FNew := false;
RadioButton1.Checked := false;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Text := DBGrid1.columns[1].Field.asString;
end;

procedure TForm1.Depart1Click(Sender: TObject);
begin
  CheckFirstTable := 'depart';
  ExecuteProcedure := 'proc_depart';
   with IBQuery1 do
   begin
    SQL.Text := 'select *  from '+ CheckFirstTable +'';  //depart line_item
    Open;
   end;
end;

procedure TForm1.Line1Click(Sender: TObject);
begin
  CheckFirstTable := 'line_item';
  ExecuteProcedure := 'proc_line';
   with IBQuery1 do
   begin
    SQL.Text := 'select *  from '+ CheckFirstTable +'';  //depart line_item
    Open;
   end;
end;

end.
