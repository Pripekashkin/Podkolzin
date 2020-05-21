unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, StdCtrls, Grids, DBGrids, DB, IBDatabase,
  IBCustomDataSet, IBQuery, IniFiles;

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
    Button5: TButton;
    Button6: TButton;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox4DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
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

end.
