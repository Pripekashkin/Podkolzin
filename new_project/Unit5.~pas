unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ToolWin, ComCtrls, DB, IBDatabase,
  IBCustomDataSet, IBQuery, ImgList, ActnList, Menus, IniFiles, comobj, wordxp;

type
  TForm5 = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    Action1: TAction;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Button7: TButton;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label9: TLabel;
    Button3: TButton;
    DBGrid1: TDBGrid;
    N1: TMenuItem;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ComboBox1DblClick(Sender: TObject);
    procedure ComboBox2DblClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
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

  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit3, Unit8;

{$R *.dfm}




procedure TForm5.FormCreate(Sender: TObject);
var
  FIniFile: TIniFile;
begin
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
    SQL.Text := 'select report.id as "Номер", line_item.info as "Статья затрат", depart.name as "Имя отдела", report.ryear as "Год", report.rmonth as "Месяц", report_content.info as "Информация", report_content.report_sum as "Сумма"' +
 'from report_content, report, line_item, depart ' +
'where (report.id = report_content.report_id) and ' +
      '(line_item.id = report_content.line_item_id) and ' +
      '(report.depart_id = depart.id) order by report.id';
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



procedure TForm5.Button7Click(Sender: TObject);  //save
begin
  //insert id from table
 with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from line_item where '''+ComboBox1.Items[ComboBox1.ItemIndex]+''' = info';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     LineToId := IBQuery3['id'];  // here id of current line
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

  with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from depart where '''+ComboBox2.Items[ComboBox2.ItemIndex]+''' = name';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      DepartToId := IBQuery3['id'];  // here id of current depart
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;
//

  try
   with IBQuery2 do
   begin
    if FNew then
      SQL.Text := 'execute procedure proc_report(-1, ''' +  ComboBox3.Items[ComboBox3.ItemIndex] + ''', ''' + ComboBox4.Items[ComboBox4.ItemIndex] + ''', ' +IntToStr(DepartToId) + ', '+ IntToStr(LineToId) +', '''+ Edit2.Text +''', '''+Edit3.Text+''')'
    else
      SQL.Text := 'execute procedure proc_report(' +IBQuery1.FieldByName('Номер').AsString + ', ''' +  ComboBox3.Items[ComboBox3.ItemIndex] + ''', ''' + ComboBox4.Items[ComboBox4.ItemIndex] + ''', ' +IntToStr(DepartToId) + ', '+ IntToStr(LineToId) +', '''+ Edit2.Text +''', '''+Edit3.Text+''')';
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
      Application.MessageBox(Pchar(E.Message), 'error', MB_ICONERROR);
   end;
  end;
end;

procedure TForm5.ComboBox1DblClick(Sender: TObject);
begin
  with IBQuery3 do
  begin
    SQL.Text := 'select info from line_item where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox1.Items.Add(IBQuery3['info']);
      IBQuery3.Next;
    end;
end;
end;

procedure TForm5.ComboBox2DblClick(Sender: TObject);
begin
    with IBQuery3 do
  begin
    SQL.Text := 'select name from depart where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox2.Items.Add(IBQuery3['name']);
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;
end;

procedure TForm5.RadioButton1Click(Sender: TObject);
begin
  FNew := true;
  RadioButton2.Checked := false;
end;

procedure TForm5.RadioButton2Click(Sender: TObject);
begin
  FNew := false;
  RadioButton1.Checked := false;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from report_content where id = ' +IBQuery1.FieldByName('Номер').AsString;
    Transaction.StartTransaction;
    ExecSQL;
    Transaction.Commit;
    Transaction.Active := false;
    end;
       with IBQuery2 do
   begin
      SQL.Text := 'delete from report where id = ' +IBQuery1.FieldByName('Номер').AsString;
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

procedure TForm5.N1Click(Sender: TObject);
  var
  MS_Word, wdAD, wdTable: variant;
  i, inc: Integer;
begin
    inc := 1;
    WordI := 1;
  with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select report.rmonth, report.ryear, depart.name, line_item.info, report_content.report_sum  from report_content, report, depart, line_item where '+
'(report_content.report_id = report.id) and '+
'(line_item.id = report_content.line_item_id) and '+
'(report.depart_id = depart.id)'+
'order by report_content.report_sum';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     //LineToId := IBQuery3['id'];  // here id of current line
     DateM[WordI] := IBQuery3['rmonth'];
     DateY[WordI] := IBQuery3['ryear'];
     NameD[WordI] := IBQuery3['name'];
     Info[WordI] := IBQuery3['info'];
     Sum[WordI] := IBQuery3['report_sum'];

     WordI := WordI + 1;
    // Label8.Caption := IBQuery3['name'];
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

  MS_Word := CreateOleObject('Word.Application');
  MS_Word.Visible := true;

  MS_Word.Documents.Add('D:\delphi\new_project\pattern.dotx');
  wdAD := MS_Word.ActiveDocument;

  //MS_Word.Selection.Start := 0;
  //MS_Word.Selection.End := 0;
  //MS_Word.Selection.Find.Forward := True;//искать впереёд
  //MS_Word.Selection.Find.Text := '{%data%}';

  //while MS_Word.Selection.Find.Execute do
  //begin
   // MS_Word.Selection.Delete;
   // MS_Word.Selection.InsertAfter('Text');
  //end

    MS_Word.Selection.Start := 0;
    MS_Word.Selection.End := 0;
    wdAD.Tables.Add(MS_Word.Selection.Range, WordI, 4);

    wdTable := wdAD.Tables.Item(1);
    wdTable.Borders.InsideLineStyle := wdLineStyleSingle;
    wdTable.Borders.OutsideLineStyle := wdLineStyleSingle;
    wdTable.Rows.Item(1).Select;
    MS_Word.Selection.Font.Bold := 1;
    MS_Word.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;

    wdTable.Cell(1,1).Range.Text := 'Дата';
    wdTable.Cell(1,2).Range.Text := 'Департамент';
    wdTable.Cell(1,3).Range.Text := 'Статья' +#13+ 'Затрат';
    wdTable.Cell(1,4).Range.Text := 'Сумма';

    for i := 2 to WordI do
    begin
    wdTable.Rows.Item(i).Select;
    MS_Word.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;
    wdTable.Cell(i,1).Range.Text := DateY[inc]+'.'+DateM[inc];
    wdTable.Cell(i,2).Range.Text := NameD[inc];
    wdTable.Cell(i,3).Range.Text := Info[inc];
    wdTable.Cell(i,4).Range.Text := Sum[inc];
    inc := inc + 1;
    end;
    wdAD.ActiveWindow.View.ShowAll := false;
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
  Form5.Hide;
  Form3.Show;
end;

procedure TForm5.FormActivate(Sender: TObject);
begin
  with IBQuery1 do
   begin
    SQL.Text := 'select report.id as "Номер", line_item.info as "Статья затрат", depart.name as "Имя отдела", report.ryear as "Год", report.rmonth as "Месяц", report_content.info as "Информация", report_content.report_sum as "Сумма"' +
 'from report_content, report, line_item, depart ' +
'where (report.id = report_content.report_id) and ' +
      '(line_item.id = report_content.line_item_id) and ' +
      '(report.depart_id = depart.id) order by report.id';
    Open;
   end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  Form8.Show;
end;

end.
