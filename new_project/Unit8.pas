unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, IBDatabase, IBCustomDataSet, IBQuery, IniFiles,
  StdCtrls;

type
  TForm8 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    id1: integer;
    name1: string;
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.FormActivate(Sender: TObject);
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
    SQL.Text := 'SELECT REPORT.DEPART_ID as "Номер", SUM(REPORT_CONTENT.REPORT_SUM) as "Сумма", '+
'MAX(DEPART.NAME) as "Имя" '+
 'FROM REPORT REPORT_CONTENT '+
'JOIN REPORT_CONTENT RC ON REPORT.ID = REPORT_CONTENT.REPORT_ID '+
'JOIN DEPART ON REPORT.DEPART_ID = DEPART.ID '+
'GROUP BY REPORT.DEPART_ID';
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

procedure TForm8.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  IBQuery1.Close;
  IBDatabase1.Connected := false;
end;

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
  name1 := IBQuery1['Имя'];
  label3.Caption := name1;

   with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from depart where name = '''+name1+'''';
    label2.Caption := 'select id from depart where name = '+
    '''+ name1 +''';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     id1 := IBQuery3['id'];  // here id of current line
      IBQuery3.Next;
    end;
    label2.Caption := IntToStr(id1);
   IBQuery3.Close;
  end;

  with IBQuery2 do
   begin
   SQL.Text := 'select line_item.info as "Статья", report_content.info as "Наименование", report_content.report_sum as "Сумма" '+
'from line_item, report_content, report '+
'where (report_content.line_item_id = line_item.id) and '+
    '(report_content.report_id = report.id) and '+
    '(report.depart_id = '+IntToStr(id1)+')';

   Open;
   end;


end;

end.
