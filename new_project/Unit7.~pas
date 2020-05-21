unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IBDatabase, DB, IBCustomDataSet, IBQuery, ImgList,
  ActnList, Grids, DBGrids, ToolWin, ComCtrls, StdCtrls, IniFiles, comobj, wordxp;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Button4: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label9: TLabel;
    Button3: TButton;
    ToolBar1: TToolBar;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    Action1: TAction;
    ImageList1: TImageList;
    N1: TMenuItem;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox2DblClick(Sender: TObject);
    procedure ComboBox1DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    FNew: Boolean;
    LineToId: Integer;
    DepartToId: Integer;
    Depart: array [1..30] of string;
    Line: array [1..30] of string;
    Year: array [1..30] of string;
    Sum: array [1..30] of string;
    inc, ExcelI: integer;
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm7.FormCreate(Sender: TObject);
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

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form7.Hide;
  Form3.Show;
end;

procedure TForm7.RadioButton1Click(Sender: TObject);
begin
  FNew := true;
  RadioButton2.Checked := false;
end;

procedure TForm7.RadioButton2Click(Sender: TObject);
begin
  FNew := false;
  RadioButton1.Checked := false;
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
  with IBQuery1 do
   begin
    SQL.Text := 'select year_plan.id as "Номер", depart.name as "Имя отдела", line_item.info as "Информация", year_plan.pyear as "Год", year_plan.psum as "Сумма"'+
'from year_plan, depart, line_item '+
'where (year_plan.depart_id = depart.id) and (year_plan.line_item_id = line_item.id) order by year_plan.id';
    Open;
   end;
end;

procedure TForm7.ComboBox2DblClick(Sender: TObject);
begin
    with IBQuery3 do
  begin
    SQL.Text := 'select info from line_item where id > 0 order by id';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox2.Items.Add(IBQuery3['info']);
      IBQuery3.Next;
    end;
end
end;

procedure TForm7.ComboBox1DblClick(Sender: TObject);
begin
      with IBQuery3 do
  begin
    SQL.Text := 'select name from depart where id > 0 order by id';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox1.Items.Add(IBQuery3['name']);
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
  //insert id from table
 with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from depart where '''+ComboBox1.Items[ComboBox1.ItemIndex]+''' = name';
   // Label4.Caption :=  'select id from depart where '''+ComboBox1.Items[ComboBox1.ItemIndex]+''' = name';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      DepartToId := IBQuery3['id'];  // here id of current depart
      IBQuery3.Next;
      //Label4.Caption := IntToStr(DepartToId);
    end;
   IBQuery3.Close;
  end;

  with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from line_item where '''+ComboBox2.Items[ComboBox2.ItemIndex]+''' = info';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      LineToId := IBQuery3['id'];  // here id of current line
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;
  //-
  try
   with IBQuery2 do
   begin
    if FNew then begin
    //Label4.Caption := 'execute procedure proc_year(-1,'''+IntToStr(LineToId)+''', '''+IntToStr(DepartToId)+''', '''+ComboBox3.Items[ComboBox3.ItemIndex]+''', '+Edit1.Text+')' ;
      SQL.Text :=
      'execute procedure proc_year(-1,'''+IntToStr(LineToId)+''', '''+IntToStr(DepartToId)+''', '''+ComboBox3.Items[ComboBox3.ItemIndex]+''', '+Edit1.Text+')'
    end
    else
      SQL.Text := 'execute procedure proc_year('+IBQuery1.FieldByName('Номер').AsString + ', '''+IntToStr(LineToId)+''', '''+IntToStr(DepartToId)+''', '''+ComboBox3.Items[ComboBox3.ItemIndex]+''', '+Edit1.Text+')';
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

procedure TForm7.Button3Click(Sender: TObject);
begin
  try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from year_plan where id = ' +IBQuery1.FieldByName('Номер').AsString;
      //Label4.Caption := 'delete from year_plan where id = ' +IBQuery1.FieldByName('Номер').AsString;
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

procedure TForm7.N1Click(Sender: TObject);
  var
MS_Excel, xlsAD: variant;
i: integer;
begin
  inc := 1;
  ExcelI := 1;
  with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select depart.name,  line_item.info, year_plan.pyear, year_plan.psum '+
'from year_plan, depart, line_item '+
'where (year_plan.depart_id = depart.id) and '+
'(year_plan.line_item_id = line_item.id)';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     Depart[ExcelI] := IBQuery3['name'];  // here id of current line
     Line[ExcelI] := IBQuery3['info'];
     Year[ExcelI] := IBQuery3['pyear'];
     Sum[ExcelI] := IBQuery3['psum'];
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
//end;

end.
