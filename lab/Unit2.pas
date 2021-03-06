unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, Grids, DBGrids, DB, IBCustomDataSet, IBQuery,
  IBDatabase, StdCtrls;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FNew: boolean;
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

procedure TForm2.Button1Click(Sender: TObject);
begin
   try
   with IBQuery2 do
   begin
    if FNew then
      SQL.Text := 'execute procedure proc_stire(-1, ''' +  Edit1.Text + ''', ''' + Edit2.Text + ''', '''+Edit3.Text+''')'
    else
      SQL.Text := 'execute procedure proc_report(' +IBQuery1.FieldByName('�����').AsString + ', ''' +  Edit1.Text + ''', ''' + Edit2.Text + ''', '''+Edit3.Text+''')';
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

procedure TForm2.FormActivate(Sender: TObject);
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
    SQL.Text := 'select id as "�����", lable as "������������", balance as "�������", cost as "���� �� �������" from store';
    Open;
   end;
  except
   on E: Exception do
  begin
      Application.MessageBox(Pchar(E.Message), 'error', MB_ICONERROR);
      Halt;
   end;
  end;

  with IBQuery1 do
   begin
    SQL.Text := 'select id as "�����", lable as "������������", balance as "�������", cost as "���� �� �������" from store';
    Open;
   end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
      try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from store  where id = ' +IBQuery1.FieldByName('�����').AsString;
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
