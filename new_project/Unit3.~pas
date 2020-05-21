unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, Menus, ActnList, StdActns, ImgList, ToolWin, ComCtrls,
  Grids, DBGrids, DB, IBDatabase, IBCustomDataSet, IBQuery, jpeg, ExtCtrls,
  Buttons;

type
    TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    FNew: Boolean;
    CheckFirstTable: String;
    ExecuteProcedure: String;
    Select: string;
    CheckRefresh: boolean;
    LineToId: Integer;
    DepartToId: Integer;
    WordI: Integer;
    DateM: array [1..30] of string;
    DateY: array [1..30] of string;
    NameD: array [1..30] of string;
    Info: array [1..30] of string;
    Sum: array [1..30] of string;
    inc, ExcelI: integer;

  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit4, Unit5, Unit7, Unit6;

{$R *.dfm}



procedure TForm3.Button1Click(Sender: TObject);
begin
Form3.Visible := false;
Form4.Visible := true;
end;


procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Hide;
  Form5.Show;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
Form3.Hide;
Form7.Show;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  Form3.Hide;
  Form6.Show;
end;

end.
