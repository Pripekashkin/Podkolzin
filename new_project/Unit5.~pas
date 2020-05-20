unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ToolWin, ComCtrls, DB, IBDatabase,
  IBCustomDataSet, IBQuery, ImgList, ActnList, Menus, IniFiles;

type
  TForm5 = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    Action1: TAction;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    Button7: TButton;
    Button8: TButton;
    Button6: TButton;
    Button5: TButton;
    Label7: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label9: TLabel;
    Button3: TButton;
    DBGrid1: TDBGrid;
    N1: TMenuItem;
    IBDatabase1: TIBDatabase;
    IBQuery1: TIBQuery;
    IBTransaction1: TIBTransaction;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBQuery3: TIBQuery;
    IBTransaction3: TIBTransaction;
    procedure FormCreate(Sender: TObject);
  private
    FNew: boolean;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}




procedure TForm5.FormCreate(Sender: TObject);

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
    SQL.Text := 'select report.id as "Номер", line_item.info as "Статья затрат", depart.name as "Иия отдела", report.ryear as "Год", report.rmonth as "Месяц", report_content.info as Информация, report_content.report_sum as "Сумма"' +
 'from report_content, report, line_item, depart ' +
'where (report.id = report_content.report_id) and ' +
      '(line_item.id = report_content.line_item_id) and ' +
      '(report.depart_id = depart.id)';
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



end.
