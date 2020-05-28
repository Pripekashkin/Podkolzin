unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Grids, DBGrids, DB, IBDatabase,
  IBCustomDataSet, IBQuery;

type
  TForm6 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    Button6: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    StringGrid1: TStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox4DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button6Click(Sender: TObject);
  private
    LineToId: Integer;
    iCol, iRow: integer;
    check : array[1..10] of boolean;

  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm6.FormActivate(Sender: TObject);
begin
  DBGrid1.Visible := false;
end;

procedure TForm6.ComboBox4DblClick(Sender: TObject);
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

procedure TForm6.FormCreate(Sender: TObject);
 var
 FIniFile: TIniFile;
begin
  iCol := 1;
  iRow := 1;
  StringGrid1.Cells[0,0] := 'Статья';
  StringGrid1.Cells[1,0] := 'Сумма';
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
    SQL.Text := 'select info from line_item where id > 0';
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

procedure TForm6.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
  Form6.Hide;
  Form3.Show;
end;

procedure TForm6.Button6Click(Sender: TObject);
label m;
begin
  with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from line_item where '''+ComboBox4.Items[ComboBox4.ItemIndex]+''' = info';
    Edit1.Text := ComboBox4.Items[ComboBox4.ItemIndex];
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      LineToId := IBQuery3['id'];  // here id of current line
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;
   if check[LineToId] = true then goto m;
  with IBQuery1 do
   begin
    // SQL.Text := 'select SUM(Report_sum) from report_content where (LINE_ITEM_ID ='+IntToStr(LineToId)+')';
     SQL.Text := 'select SUM(report_content.Report_sum) as "Сумма" from report_content, report where ' +
'(LINE_ITEM_ID = '+IntToStr(LineToId)+') and ' +
'(report_content.report_id = report.id) and ' +
'(ryear >= '''+ComboBox6.Items[ComboBox6.ItemIndex]+''') and ' +
'(ryear <= '''+ComboBox8.Items[ComboBox8.ItemIndex]+''') and ' +
'(rmonth >= '''+ComboBox5.Items[ComboBox5.ItemIndex]+''') and ' +
'(rmonth <= '''+ComboBox7.Items[ComboBox7.ItemIndex]+''')';
    Open;
    Edit2.Text := IBQuery1.FieldByName('Сумма').AsString;
    DBGrid1.Visible := true;
   end;
   //insert
   StringGrid1.Cells[0,iCol] := Edit1.Text;
   if (Edit2.Text <> '') then
    StringGrid1.Cells[1,iRow] := Edit2.Text
   else
    StringGrid1.Cells[1,iRow] := 'Нет';
   iCol := iCol + 1;
   iRow := iRow + 1;
   check[LineToId] := True;


m:

end;

end.
