unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, IBDatabase, IBCustomDataSet,
  IBQuery, IniFiles, comobj, wordxp;

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
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    name1: string;
    year1,id1: string;
    sum1: Double;
        WordI: Integer;
            Depart: array [1..30] of string;
    Line: array [1..30] of string;
    Year: array [1..30] of string;
    Sum: array [1..30] of string;
    inc, ExcelI: integer;

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

  //label2.caption := name1;
  //label3.caption := year1;

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

procedure TForm9.Button1Click(Sender: TObject);
  var
MS_Excel, xlsAD: variant;
i: integer;
begin
  inc := 1;
  ExcelI := 1;
  with IBQuery3 do //find first field id
  begin
   SQL.Text := 'SELECT MAX(LI.INFO) as "Статья", SUM(PSUM) as "Сумма" '+
'FROM YEAR_PLAN YP JOIN LINE_ITEM LI '+
'ON YP.LINE_ITEM_ID = LI.ID '+
'WHERE YP.DEPART_ID = '+id1+' '+
'AND YP.PYEAR = '+year1+''+
'GROUP BY YP.LINE_ITEM_ID';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     Depart[ExcelI] := IBQuery3['Статья'];  // here id of current line
     Line[ExcelI] := IBQuery3['Сумма'];
     //Year[ExcelI] := IBQuery3['pyear'];
     //Sum[ExcelI] := IBQuery3['psum'];
     ExcelI := ExcelI + 1;
     IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

  MS_Excel := CreateOleObject('Excel.Application');
  MS_Excel.Visible := true;
  MS_Excel.Workbooks.Add;
  MS_Excel.Workbooks[1].WorkSheets[1].Name := 'line_item';
  xlsAD := MS_Excel.Workbooks[1].WorkSheets[1].Columns;
  //size
  xlsAD.Columns[1].ColumnWidth:=20;
  xlsAD.Columns[2].ColumnWidth:=20;
  xlsAD.Columns[3].ColumnWidth:=10;
  //bold
  xlsAD := MS_Excel.Workbooks[1].WorkSheets['line_item'].Rows;
  xlsAD.Rows[1].Font.Bold := true;
  //name
  xlsAD := MS_Excel.Workbooks[1].WorkSheets[1];
  xlsAD.Cells[1,1] := 'Отдел';
  xlsAD.Cells[1,2] := 'Статья Затрат';
  xlsAD.Cells[1,3] := 'Год';
  xlsAD.Cells[1,4] := 'Сумма';


  for i := 2 to ExcelI do
  begin
  xlsAD.Cells[i,1] := Depart[inc];
  xlsAD.Cells[i,2] := Line[inc];
  xlsAD.Cells[i,3] := Year[inc];
  xlsAD.Cells[i,4] := Sum[inc];
  inc := inc + 1;
  end;
end;

end.
