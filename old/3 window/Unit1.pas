unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, DB, IBDatabase, Grids, DBGrids, IBCustomDataSet,
  IBQuery, StdCtrls;

type
  TForm1 = class(TForm)
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit2: TEdit;
    Button4: TButton;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button5: TButton;
    IBDatabase1: TIBDatabase;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);


  private
    FNew: Boolean;
  public

  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}
procedure Tform1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
end;

procedure TForm1.FormCreate(Sender: TObject);

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
    SQL.Text := 'select deptno as Dep_Num, deptname, id_work as emp_id  from info_depart ';
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  FNew := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FNew := false;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  try
   with IBQuery2 do
   begin
    if FNew then
      SQL.Text :=
      'execute procedure new_procedure(-1, ''' +  ComboBox1.Items[ComboBox1.ItemIndex] + ''',  ' + Edit2.Text + ')'
    else
      SQL.Text := 'execute procedure new_procedure(' +IBQuery1.FieldByName('DEPTNO').AsString + ', ''' +  ComboBox1.Items[ComboBox1.ItemIndex] + ''',  ' + Edit2.Text + ')';
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
      SQL.Text := 'delete from info_depart where DEPTNO = ' +IBQuery1.FieldByName('DEPTNO').AsString;
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



procedure TForm1.Button5Click(Sender: TObject);
begin
Form1.Hide;
Form2.Show;
end;

end.
