unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, IBDatabase, IBCustomDataSet, IBQuery,
  StdCtrls;

type
  TForm3 = class(TForm)
    IBQuery1: TIBQuery;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    ComboBox2: TComboBox;
    Edit2: TEdit;
    Button4: TButton;
    IBQuery3: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button5: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
     FNew: Boolean;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}


procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
end;

procedure TForm3.FormCreate(Sender: TObject);
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
    SQL.Text := 'select * from info_transaction order by id_trans, deptno, info, category, round(amount,2), tdate ';
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

procedure TForm3.Button1Click(Sender: TObject);
begin
  FNew := true;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  FNew := false;
end;




procedure TForm3.Button4Click(Sender: TObject);
begin
  with IBQuery3 do
  begin
    SQL.Text := 'select * from info_depart where deptno > 0';
    Open;

    IBQuery3.First;

    while not IBQuery3.Eof do
    begin
      Combobox1.Items.Add(IBQuery3['deptno']);
      IBQuery3.Next;
    end;
  end;

end;
  procedure TForm3.Button5Click(Sender: TObject);
begin
  try
   with IBQuery2 do
   begin
    if FNew then
      SQL.Text :=
      'execute procedure INSERT_TRANSACTION(-1, ''' +  ComboBox1.Items[ComboBox1.ItemIndex] + ''', ''' + Edit1.Text + ''', ''' +  ComboBox2.Items[ComboBox1.ItemIndex] + ''', ' + Edit2.Text + ')'
    else
      SQL.Text := 'execute procedure INSERT_TRANSACTION(' +IBQuery1.FieldByName('ID_TRANS').AsString + ', ''' +  ComboBox1.Items[ComboBox1.ItemIndex] + ''', ''' + Edit1.Text + ''',''' +  ComboBox1.Items[ComboBox1.ItemIndex] + ''', ' + Edit2.Text + ')';
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

procedure TForm3.Button3Click(Sender: TObject);
begin
  try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from INFO_TRANSACTION where ID_TRANS =' +IBQuery1.FieldByName('ID_TRANS').AsString;
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
      Application.MessageBox(Pchar(E.Message), 'ERROR', MB_ICONERROR);
   end;
  end;
end;

end.



















