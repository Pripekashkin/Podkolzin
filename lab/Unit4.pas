unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, DB, IBDatabase, IBCustomDataSet, IBQuery,
  Grids, DBGrids;

type
  TForm4 = class(TForm)
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
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
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
     FNew: Boolean;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
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
    SQL.Text := 'select id as "Номер", name as "Имя", surname as "Фамилия", patronymic as "Отчество", cource as "Курс", faculty as "Факультет", engage as "Информация" from people';  //depart line_item
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

procedure TForm4.Button1Click(Sender: TObject);
begin
   try
   with IBQuery2 do
   begin
    if FNew then begin


      SQL.Text := 'execute procedure proc_people(-1, ''' + Edit1.Text + ''', '''+Edit2.Text+''', '''+Edit3.Text+''', '''+Edit4.Text+''', '''+ComboBox1.Items[ComboBox1.ItemIndex]+''', '''+Edit6.Text+''')';
      //Label9.Caption := 'execute procedure proc_purchase(-1, ''' +  TovarToId + ''', ''' + Edit1.Text + ''', '''+Edit2.Text+''', '''+date1+''', '''+Edit3.Text+''', '''+Edit4.Text+''')';
      end
    else
      SQL.Text := 'execute procedure proc_people(' +IBQuery1.FieldByName('Номер').AsString + ', ''' + Edit1.Text + ''', '''+Edit2.Text+''', '''+Edit3.Text+''', '''+Edit4.Text+''', '''+ComboBox1.Items[ComboBox1.ItemIndex]+''', '''+Edit6.Text+''')';
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

procedure TForm4.RadioButton1Click(Sender: TObject);
begin
FNew := true;
RadioButton2.Checked := false;
end;

procedure TForm4.RadioButton2Click(Sender: TObject);
begin
FNew := false;
RadioButton1.Checked := false;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
   try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from people where id = ' +IBQuery1.FieldByName('Номер').AsString;
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

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Form4.Hide;
  Form1.Show;
end;

end.
