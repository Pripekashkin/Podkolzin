unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ComCtrls, StdCtrls, DB, IBDatabase, IBCustomDataSet,
  IBQuery, Grids, DBGrids;

type
  TForm7 = class(TForm)
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button3: TButton;
    Button1: TButton;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    ComboBox3: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1DblClick(Sender: TObject);
    procedure ComboBox3DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FNew: Boolean;
    a,b,date1: string;
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.FormActivate(Sender: TObject);
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
    SQL.Text := 'select id as "Номер", id_resource as "Наименование", operation as "Операция", rcount as "Количество", id_command as "Кто", rdate as "Дата" from RESOURCES_TAKEN';  
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

procedure TForm7.ComboBox1DblClick(Sender: TObject);
begin
  with IBQuery3 do
  begin
    SQL.Text := 'select lable from store where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox1.Items.Add(IBQuery3['lable']);
      IBQuery3.Next;
    end;
  end;
end;

procedure TForm7.ComboBox3DblClick(Sender: TObject);
begin
  with IBQuery3 do
  begin
    SQL.Text := 'select surname from people where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox3.Items.Add(IBQuery3['surname']);
      IBQuery3.Next;
    end;
  end;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin

   with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from store where '''+ComboBox1.Items[ComboBox1.ItemIndex]+''' = lable';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     a := IBQuery3['id'];  // here id of current line
    // label5.Caption := a;
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

     with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from people where '''+ComboBox3.Items[ComboBox3.ItemIndex]+''' = surname';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     b := IBQuery3['id'];  // here id of current line
    // label5.Caption := a;
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;


  try
   with IBQuery2 do
   begin
         date1 := DateTimeToStr(DateTimePicker1.Date);
      System.delete(date1, 9, 9);
    if FNew then  begin
      SQL.Text :=
      'execute procedure PROC_RESOURCES (-1, ''' +  a + ''', '''+ComboBox2.Items[ComboBox2.ItemIndex]+''', '+Edit1.Text+', '''+b+''', '''+date1+''' )'
    end
    else
      SQL.Text := 'execute procedure PROC_RESOURCES (' +IBQuery1.FieldByName('Номер').AsString + ',  ''' +  a + ''', '''+ComboBox2.Items[ComboBox2.ItemIndex]+''', '+Edit1.Text+', '''+b+''', '''+date1+''' )';
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

procedure TForm7.Button3Click(Sender: TObject);
begin
    try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from resources_taken where id = ' +IBQuery1.FieldByName('Номер').AsString;
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
