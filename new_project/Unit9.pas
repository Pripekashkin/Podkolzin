unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, IBDatabase, IBCustomDataSet,
  IBQuery, IniFiles;

type
  TForm9 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    name1: string;
    year1,id1: string;
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.FormActivate(Sender: TObject);
var
  FIniFile: TIniFile;
begin
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
    SQL.Text := 'SELECT MAX(Depart.NAME) as "Отдел", PYEAR as "Год", SUM(PSUM) as "Общая сумма" '+
'FROM YEAR_PLAN YP JOIN DEPART D '+
'ON Year_Plan.DEPART_ID = Depart.ID '+
'GROUP BY Year_Plan.DEPART_ID, PYEAR ';
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

procedure TForm9.DBGrid1CellClick(Column: TColumn);
begin
  name1 := IBQuery1['Отдел'];
  year1 := IBQuery1['Год'];

  label2.caption := name1;
  label3.caption := year1;

   with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from depart where name = '''+name1+'''';
    //label2.Caption := 'select id from depart where name = '+
    //'''+ name1 +''';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     id1 := IBQuery3['id'];  // here id of current line

      IBQuery3.Next;
    end;
    //label2.Caption := IntToStr(id1);
   IBQuery3.Close;
  end;

  with IBQuery2 do
   begin
   SQL.Text := 'SELECT MAX(LI.INFO) as "Статья", SUM(PSUM) as "Сумма" '+
'FROM YEAR_PLAN YP JOIN LINE_ITEM LI '+
'ON YP.LINE_ITEM_ID = LI.ID '+
'WHERE YP.DEPART_ID = '+id1+' '+
'AND YP.PYEAR = '+year1+''+
'GROUP BY YP.LINE_ITEM_ID';
   Open;
    end;
end;

procedure TForm9.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
end;

end.
