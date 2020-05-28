unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBDatabase, IBCustomDataSet, IBQuery, IniFiles,
  StdCtrls, comobj, wordxp;

type
  TForm8 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
  private
    id1: integer;
    name1: string;
    FNew: boolean;
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
    sum1: Double;
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.FormActivate(Sender: TObject);
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
    SQL.Text := 'SELECT REPORT.DEPART_ID as "Номер", SUM(REPORT_CONTENT.REPORT_SUM) as "Сумма", '+
'MAX(DEPART.NAME) as "Имя" '+
 'FROM REPORT REPORT_CONTENT '+
'JOIN REPORT_CONTENT RC ON REPORT.ID = REPORT_CONTENT.REPORT_ID '+
'JOIN DEPART ON REPORT.DEPART_ID = DEPART.ID '+
'GROUP BY REPORT.DEPART_ID';
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

procedure TForm8.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
end;

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
  name1 := IBQuery1['Имя'];
  //label3.Caption := name1;

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
   SQL.Text := 'select line_item.info as "Статья", report_content.info as "Наименование", report_content.report_sum as "Сумма" '+
'from line_item, report_content, report '+
'where (report_content.line_item_id = line_item.id) and '+
    '(report_content.report_id = report.id) and '+
    '(report.depart_id = '+IntToStr(id1)+')';

   Open;
   end;


end;

procedure TForm8.Button1Click(Sender: TObject);
  var
  MS_Word, wdAD, wdTable, wdRng: variant;
  i, inc: Integer;
begin
    inc := 1;
    WordI := 1;
  with IBQuery3 do //find first field id
  begin
   SQL.Text := 'select line_item.info as "Статья", report_content.info as "Наименование", report_content.report_sum as "Сумма" '+
'from line_item, report_content, report '+
'where (report_content.line_item_id = line_item.id) and '+
    '(report_content.report_id = report.id) and '+
    '(report.depart_id = '+IntToStr(id1)+')';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     //LineToId := IBQuery3['id'];  // here id of current line
     DateM[WordI] := IBQuery3['Статья'];
     DateY[WordI] := IBQuery3['Наименование'];
     NameD[WordI] := IBQuery3['Сумма'];
    // Info[WordI] := IBQuery3['info'];
     //Sum[WordI] := IBQuery3['report_sum'];

     WordI := WordI + 1;
    // Label8.Caption := IBQuery3['name'];
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

  //сумма
    with IBQuery3 do //find first field id
  begin
    SQL.Text := 'SELECT REPORT.DEPART_ID as "Номер", SUM(REPORT_CONTENT.REPORT_SUM) as "Сумма", '+
'MAX(DEPART.NAME) as "Имя" '+
 'FROM REPORT REPORT_CONTENT '+
'JOIN REPORT_CONTENT RC ON REPORT.ID = REPORT_CONTENT.REPORT_ID '+
'JOIN DEPART ON REPORT.DEPART_ID = DEPART.ID '+
'where REPORT.DEPART_ID = 1 '+
'GROUP BY REPORT.DEPART_ID';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      sum1 := IBQuery3['Сумма'];  // here id of current depart
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;
  //сумма*

  MS_Word := CreateOleObject('Word.Application');
  MS_Word.Visible := true;

  MS_Word.Documents.Add('D:\delphi\new_project\pattern.dotx');
  wdAD := MS_Word.ActiveDocument;
  wdRng := wdAD.Content;

  //MS_Word.Selection.Start := 0;
  //MS_Word.Selection.End := 0;
  //MS_Word.Selection.Find.Forward := True;//искать впереёд
  //MS_Word.Selection.Find.Text := '{%data%}';

  //while MS_Word.Selection.Find.Execute do
  //begin
   // MS_Word.Selection.Delete;
   // MS_Word.Selection.InsertAfter('Text');
  //end


    //Выравнивание по центру.

    //Параметры шрифта.


    wdRng.Font.Size := 14;

    wdRng.InsertAfter('Отчёт №' + IntToStr(id1) + #13#10);
    wdRng.ParagraphFormat.Alignment := 1;
    wdRng.Font.Name := 'Times New Roman';
    wdRng.Font.Size := 14;
   //wdRng.Font.Bold := True;

    wdRng.Start := wdRng.End;
    wdRng.InsertAfter(#13#10);
    wdRng.InsertAfter('Общая сумма: ' + FloatToStr(sum1) + #13#10);
    wdRng.InsertAfter('Отдел: ' + name1 + #13#10);
    wdRng.ParagraphFormat.Reset;
    wdRng.ParagraphFormat.Alignment := 0;
    wdRng.Font.Bold := False;


    //след
    wdRng.Start := wdRng.End;
    wdRng.InsertAfter(#13#10);
    wdRng.ParagraphFormat.Reset;
    wdRng.Font.Reset;;
    wdRng.ParagraphFormat.Alignment := 0;
    wdRng.Font.Name := 'Times New Roman';
    wdRng.Font.Bold := False;
    wdRng.Font.Size := 12;

    //след*
    wdRng.ParagraphFormat.Reset;
    MS_Word.Selection.Start := 50;
    MS_Word.Selection.End := 50;
    wdAD.Tables.Add(MS_Word.Selection.Range, WordI, 3);

    wdTable := wdAD.Tables.Item(1);
    wdTable.Borders.InsideLineStyle := wdLineStyleSingle;
    wdTable.Borders.OutsideLineStyle := wdLineStyleSingle;
    wdTable.Rows.Item(1).Select;
    MS_Word.Selection.Font.Bold := 1;
    MS_Word.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;

    wdTable.Cell(1,1).Range.Text := 'Статья';
    wdTable.Cell(1,2).Range.Text := 'Наименование';
    wdTable.Cell(1,3).Range.Text := 'Сумма';
    //wdTable.Cell(1,4).Range.Text := 'Сумма';

    for i := 2 to WordI do
    begin
    wdTable.Rows.Item(i).Select;
    MS_Word.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;
    wdTable.Cell(i,1).Range.Text := DateY[inc];
    wdTable.Cell(i,2).Range.Text := DateM[inc];
    wdTable.Cell(i,3).Range.Text := NameD[inc];
    //wdTable.Cell(i,4).Range.Text := Sum[inc];
    inc := inc + 1;
    end;
    wdRng.ParagraphFormat.Alignment := 0;

end;

end.
