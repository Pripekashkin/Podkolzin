unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBDatabase, IBCustomDataSet, IBQuery, StdCtrls,
  Grids, DBGrids, IniFiles;


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
    Label4: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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

end.


