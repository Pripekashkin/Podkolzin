unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, StdActns, ImgList, ToolWin, ComCtrls, StdCtrls,
  Grids, DBGrids, DB, IBDatabase, IBCustomDataSet, IBQuery, IniFiles, comobj, wordxp;

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
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button5: TButton;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button7: TButton;
    Button8: TButton;
    Yearplan1: TMenuItem;
    Button6: TButton;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Depart1Click(Sender: TObject);
    procedure Line1Click(Sender: TObject);
    procedure Addreprot1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
//    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Yearplan1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);

    
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
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
  var
  FIniFile: TIniFile;
begin
  CheckFirstTable := 'depart';
  ExecuteProcedure := 'proc_depart';
  Select := 'name';
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
    SQL.Text := 'select * from '+ CheckFirstTable +'';  //depart line_item
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
  Label1.Visible := false;
  Label2.Visible := false;
  Label3.Visible := false;
  Label4.Visible := false;
  Label5.Visible := false;
  Label6.Visible := false;
  ComboBox1.Visible := false;
  ComboBox2.Visible := false;
  ComboBox3.Visible := false;
  ComboBox4.Visible := false;
  Edit2.Visible := false;
  Edit3.Visible := false;
  Button2.Visible := false;
  Button5.Visible := false;
  Button7.Visible := false;
  Button8.Visible := false;
  Edit1.Visible := true;
  Button1.Visible := true;
  Button3.Visible := true;
  Button4.Visible := true;


  CheckFirstTable := 'depart';
  ExecuteProcedure := 'proc_depart';
  Select := 'name';
   with IBQuery1 do
   begin
    SQL.Text := 'select * from '+ CheckFirstTable +'';
    Open;
   end;
end;

procedure TForm1.Line1Click(Sender: TObject);
begin
  Label1.Visible := false;
  Label2.Visible := false;
  Label3.Visible := false;
  Label4.Visible := false;
  Label5.Visible := false;
  Label6.Visible := false;
  ComboBox1.Visible := false;
  ComboBox2.Visible := false;
  ComboBox3.Visible := false;
  ComboBox4.Visible := false;
  Edit2.Visible := false;
  Edit3.Visible := false;
  Button2.Visible := false;
  Button5.Visible := false;
  Button7.Visible := false;
  Button8.Visible := false;
  CheckFirstTable := 'line_item';
  ExecuteProcedure := 'proc_line';
  Select := 'info';
   with IBQuery1 do
   begin
    SQL.Text := 'select * from '+ CheckFirstTable +'';
    Open;
   end;
end;

procedure TForm1.Addreprot1Click(Sender: TObject);
begin
   Edit1.Visible := false;
  Button1.Visible := false;
  Button3.Visible := false;
  Button4.Visible := false;
  Label1.Visible := true;
  Label2.Visible := true;
  Label3.Visible := true;
  Label4.Visible := true;
  Label5.Visible := true;
  Label6.Visible := true;
  ComboBox1.Visible := true;
  ComboBox2.Visible := true;
  ComboBox3.Visible := true;
  ComboBox4.Visible := true;
  Edit2.Visible := true;
  Edit3.Visible := true;
  Button2.Visible := true;
  Button5.Visible := true;
  Button7.Visible := true;
  Button8.Visible := true;


  with IBQuery1 do
   begin
    SQL.Text := 'select report.id, line_item.info, depart.name, report.ryear, report.rmonth, report_content.info, report_content.report_sum ' +
 'from report_content, report, line_item, depart ' +
'where (report.id = report_content.report_id) and ' +
      '(line_item.id = report_content.line_item_id) and ' +
      '(report.depart_id = depart.id)';
    Open;
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    FNew := false;
    //Combobox1.Items.Add(DBGrid1.columns[1].Field.asString);
    //Combobox2.Items.Add(DBGrid1.columns[2].Field.asString);
    //Combobox3.Items.Add(DBGrid1.columns[3].Field.asString);
    //Combobox4.Items.Add(DBGrid1.columns[4].Field.asString);
    //ComboBox1.Text :=  DBGrid1.columns[1].Field.asString;
    //ComboBox2.Text :=  DBGrid1.columns[2].Field.asString;
    //ComboBox3.Text :=  DBGrid1.columns[3].Field.asString;
    //ComboBox4.Text :=  DBGrid1.columns[4].Field.asString;
    Edit2.Text := DBGrid1.columns[5].Field.asString;
    Edit3.Text := DBGrid1.columns[6].Field.asString;
    
end;

procedure TForm1.Button5Click(Sender: TObject);
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

{procedure TForm1.Button6Click(Sender: TObject);
begin
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
  Label7.Caption := 'execute procedure proc_report(-1, ''' +  ComboBox3.Items[ComboBox3.ItemIndex] + ''', ''' + ComboBox4.Items[ComboBox4.ItemIndex] + ''', ' +IntToStr(DepartToId) + ', '+ IntToStr(LineToId) +', '''+ Edit2.Text +''', '''+Edit3.Text+''')'
end;
 }
procedure TForm1.Button7Click(Sender: TObject);
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
      SQL.Text := 'execute procedure proc_report(' +IBQuery1.FieldByName('ID').AsString + ', ''' +  ComboBox3.Items[ComboBox3.ItemIndex] + ''', ''' + ComboBox4.Items[ComboBox4.ItemIndex] + ''', ' +IntToStr(DepartToId) + ', '+ IntToStr(LineToId) +', '''+ Edit2.Text +''', '''+Edit3.Text+''')';
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
   //Label7.Caption := 'SQL.Text := execute procedure proc_report(-1, ''' +  ComboBox3.Items[ComboBox3.ItemIndex] + ''', ''' + ComboBox4.Items[ComboBox4.ItemIndex] + ''', ' +IntToStr(DepartToId) + ', '+ IntToStr(LineToId) +', '''+ Edit2.Text +''', '''+Edit3.Text+''')'
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from report_content where id = ' +IBQuery1.FieldByName('ID').AsString;
    Transaction.StartTransaction;
    ExecSQL;
    Transaction.Commit;
    Transaction.Active := false;
    end;
       with IBQuery2 do
   begin
      SQL.Text := 'delete from report where id = ' +IBQuery1.FieldByName('ID').AsString;
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




procedure TForm1.Yearplan1Click(Sender: TObject);
begin
Form1.Hide;
Form2.Show;
end;

procedure TForm1.Button6Click(Sender: TObject);
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
'(report.depart_id = depart.id) '+
'order by info';
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

    wdTable.Cell(1,1).Range.Text := 'Date';
    wdTable.Cell(1,2).Range.Text := 'Depart';
    wdTable.Cell(1,3).Range.Text := 'Line' +#13+ 'item';
    wdTable.Cell(1,4).Range.Text := 'Amount';

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

   // wdTable.Columns.Item(1).Select;
   // wdTable.Columns.Item(1).Width := 30;

{
   with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select * from report';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     LineToId := IBQuery3['id'];  // here id of current line
     wdAD.Range.InsertAfter(LineToId);
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

  wdAD.Range.InsertAfter('fgfg');

  }


end;

end.
