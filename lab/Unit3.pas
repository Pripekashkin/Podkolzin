unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, IBDatabase, IBCustomDataSet, IBQuery,
  Grids, DBGrids, IniFiles;

type
  TForm3 = class(TForm)
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    ComboBox1: TComboBox;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1DblClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    
  private
    FNew: boolean;
    TovarToId: string;
    date1: string;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
   with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from store where '''+ComboBox1.Items[ComboBox1.ItemIndex]+''' = lable';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     TovarToId := IBQuery3['id'];  // here id of current line
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

     try
   with IBQuery2 do
   begin
         date1 := DateTimeToStr(DateTimePicker1.Date);
      System.delete(date1, 9, 9);
    if FNew then begin

     // Label9.Caption := date1;

      SQL.Text := 'execute procedure proc_purchase(-1, ''' +  TovarToId + ''', ''' + Edit1.Text + ''', '''+Edit2.Text+''', '''+date1+''', '''+Edit3.Text+''', '''+Edit4.Text+''')';
      //Label9.Caption := 'execute procedure proc_purchase(-1, ''' +  TovarToId + ''', ''' + Edit1.Text + ''', '''+Edit2.Text+''', '''+date1+''', '''+Edit3.Text+''', '''+Edit4.Text+''')';
      end
    else
      SQL.Text := 'execute procedure proc_purchase(' +IBQuery1.FieldByName('Номер').AsString + ',  ''' +  TovarToId + ''', ''' + Edit1.Text + ''', '''+Edit2.Text+''', '''+date1+''', '''+Edit3.Text+''', '''+Edit4.Text+''')';
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

procedure TForm3.ComboBox1DblClick(Sender: TObject);
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
  end
end;

procedure TForm3.RadioButton1Click(Sender: TObject);
begin
  FNew := true;
  RadioButton2.Checked := false;
end;

procedure TForm3.RadioButton2Click(Sender: TObject);
begin
  FNew := false;
  RadioButton1.Checked := false;
end;



procedure TForm3.Button3Click(Sender: TObject);
begin
        try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from purchase where id = ' +IBQuery1.FieldByName('Номер').AsString;
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

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form3.Hide;
  Form1.Show;
end;

procedure TForm3.FormActivate(Sender: TObject);
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
    SQL.Text := 'select purchase.id as "Номер", store.lable as "Предмет", purchase.seller as "Поставщик", purchase.price as "Цена", purchase.pdate as "Дата", purchase.purpose as "Цель", purchase.state as "Статус" '+
'from purchase, store '+
'where (store.id = purchase.id_resource)';
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

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
  Form3.Hide;
  Form1.Show;
end;

end.
