unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBDatabase, IBCustomDataSet, IBQuery, StdCtrls,
  Grids, DBGrids, IniFiles, Menus, ImgList, ActnList;


type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button3: TButton;
    Button1: TButton;
    Button4: TButton;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    Action1: TAction;
    ImageList1: TImageList;
    Editlineitem1: TMenuItem;
    Makereport1: TMenuItem;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Button5: TButton;
    Label4: TLabel;
    Button6: TButton;
    DataSource2: TDataSource;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Makereport1Click(Sender: TObject);
    procedure Editlineitem1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    FNew: Boolean;
    LineToId: Integer;
    DepartToId: Integer;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
  Form2.Hide;
  Form1.Show;
end;



procedure TForm2.FormCreate(Sender: TObject);
  var
  FIniFile: TIniFile;
begin
FNew := true;
Label5.Visible := false;
Label7.Visible := false;
Label10.Visible := false;
Label8.Visible := false;
Label9.Visible := false;
ComboBox4.Visible := false;
ComboBox5.Visible := false;
ComboBox6.Visible := false;
ComboBox7.Visible := false;
ComboBox8.Visible := false;
Button5.Visible := false;

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
    //SQL.Text := 'select *  from year_plan';
    SQL.Text := 'select year_plan.id, depart.name, line_item.info, year_plan.pyear, year_plan.psum '+
'from year_plan, depart, line_item '+
'where (year_plan.depart_id = depart.id) and (year_plan.line_item_id = line_item.id)';
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



procedure TForm2.RadioButton1Click(Sender: TObject);
begin
  FNew := true;
  RadioButton2.Checked := false;
end;

procedure TForm2.RadioButton2Click(Sender: TObject);
begin
  FNew := false;
  RadioButton1.Checked := false;
end;

procedure TForm2.Button4Click(Sender: TObject);
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
    if FNew then
    //Label4.Caption := 'execute procedure proc_year(-1,'''+IntToStr(LineToId)+''', '''+IntToStr(DepartToId)+''', '''+ComboBox3.Items[ComboBox3.ItemIndex]+''', '+Edit1.Text+')' ;
      SQL.Text :=
      'execute procedure proc_year(-1,'''+IntToStr(LineToId)+''', '''+IntToStr(DepartToId)+''', '''+ComboBox3.Items[ComboBox3.ItemIndex]+''', '+Edit1.Text+')'
    else
      SQL.Text := 'execute procedure proc_year('+IBQuery1.FieldByName('ID').AsString + ', '''+IntToStr(LineToId)+''', '''+IntToStr(DepartToId)+''', '''+ComboBox3.Items[ComboBox3.ItemIndex]+''', '+Edit1.Text+')';
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

procedure TForm2.Button2Click(Sender: TObject);
begin
with IBQuery3 do
  begin
    SQL.Text := 'select name from depart where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox1.Items.Add(IBQuery3['name']);
      IBQuery3.Next;
    end;
  end;

with IBQuery3 do
  begin
    SQL.Text := 'select info from line_item where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox2.Items.Add(IBQuery3['info']);
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;
end;


procedure TForm2.Button3Click(Sender: TObject);
begin
  try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from year_plan where id = ' +IBQuery1.FieldByName('ID').AsString;
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

procedure TForm2.Button5Click(Sender: TObject);
begin
  with IBQuery3 do
  begin
    SQL.Text := 'select info from line_item where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox4.Items.Add(IBQuery3['info']);
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;


end;

procedure TForm2.Makereport1Click(Sender: TObject);
begin
RadioButton1.Visible := false;
RadioButton2.Visible := false;
Button1.Visible := false;
Button2.Visible := false;
Button3.Visible := false;
Button4.Visible := false;
ComboBox1.Visible := false;
ComboBox2.Visible := false;
ComboBox3.Visible := false;
Label1.Visible := false;
Label2.Visible := false;
Label3.Visible := false;
Label6.Visible := false;
Edit1.Visible := false;
Label5.Visible := true;
Label7.Visible := true;
Label10.Visible := true;
Label8.Visible := true;
Label9.Visible := true;
ComboBox4.Visible := true;
ComboBox5.Visible := true;
ComboBox6.Visible := true;
ComboBox7.Visible := true;
ComboBox8.Visible := true;
Button5.Visible := true;
    with IBQuery1 do
   begin
    SQL.Text := 'select * from test where id = -1';
    Open;
   end;

end;



procedure TForm2.Editlineitem1Click(Sender: TObject);
begin
RadioButton1.Visible := true;
RadioButton2.Visible := true;
Button1.Visible := true;
Button2.Visible := true;
Button3.Visible := true;
Button4.Visible := true;
ComboBox1.Visible := true;
ComboBox2.Visible := true;
ComboBox3.Visible := true;
Label1.Visible := true;
Label2.Visible := true;
Label3.Visible := true;
Label6.Visible := true;
Edit1.Visible := true;
Label5.Visible := false;
Label7.Visible := false;
Label10.Visible := false;
Label8.Visible := false;
Label9.Visible := false;
ComboBox4.Visible := false;
ComboBox5.Visible := false;
ComboBox6.Visible := false;
ComboBox7.Visible := false;
ComboBox8.Visible := false;
Button5.Visible := false;
   with IBQuery1 do
   begin
    //SQL.Text := 'select *  from year_plan';
    SQL.Text := 'select year_plan.id, depart.name, line_item.info, year_plan.pyear, year_plan.psum '+
'from year_plan, depart, line_item '+
'where (year_plan.depart_id = depart.id) and (year_plan.line_item_id = line_item.id)';
    Open;
   end;
end;
procedure TForm2.Button6Click(Sender: TObject);
begin
  with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from line_item where '''+ComboBox4.Items[ComboBox4.ItemIndex]+''' = info';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      LineToId := IBQuery3['id'];  // here id of current line
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

  with IBQuery1 do
   begin
    // SQL.Text := 'select SUM(Report_sum) from report_content where (LINE_ITEM_ID ='+IntToStr(LineToId)+')';
     SQL.Text := 'select SUM(report_content.Report_sum) from report_content, report where ' +
'(LINE_ITEM_ID = '+IntToStr(LineToId)+') and ' +
'(report_content.report_id = report.id) and ' +
'(ryear >= '''+ComboBox6.Items[ComboBox6.ItemIndex]+''') and ' +
'(ryear <= '''+ComboBox8.Items[ComboBox8.ItemIndex]+''') and ' +
'(rmonth >= '''+ComboBox5.Items[ComboBox5.ItemIndex]+''') and ' +
'(rmonth <= '''+ComboBox7.Items[ComboBox7.ItemIndex]+''')';
    Open;
   end;
end;

end.




