unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBDatabase, IBCustomDataSet, IBQuery, StdCtrls, Grids,
  DBGrids, IniFiles;

type
  TForm5 = class(TForm)
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
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
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label3: TLabel;
    procedure ComboBox1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox2DblClick(Sender: TObject);
    procedure ComboBox3DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    a,b,c: string;
    FNew: boolean;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm5.ComboBox1DblClick(Sender: TObject);
begin
      with IBQuery3 do
  begin
    SQL.Text := 'select surname, surname from people where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox1.Items.Add(IBQuery3['surname']);
      IBQuery3.Next;
    end;
  end;




end;

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
    //SQL.Text := 'select id as "Номер", id_teamleader as "Тимлид", id_members as "Участник", team_competition as "Соревнование" from team' ;
    SQL.Text :=  'select team.id as "Номер", people.surname as "Тимлид", people.surname as "Участник", competition.tour_name as "Соревнование" '+
'from team, people, competition '+
'where people.id = team.id_teamleader and '+
'competition.id = team.team_competition';
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

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form5.Hide;
  Form1.Show;
end;

procedure TForm5.ComboBox2DblClick(Sender: TObject);
begin
  with IBQuery3 do
  begin
    SQL.Text := 'select surname from people where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox2.Items.Add(IBQuery3['surname']);
      IBQuery3.Next;
    end;
  end;
end;

procedure TForm5.ComboBox3DblClick(Sender: TObject);
begin
    with IBQuery3 do
  begin
    SQL.Text := 'select tour_name from competition where id > 0';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
      Combobox3.Items.Add(IBQuery3['tour_name']);
      IBQuery3.Next;
    end;
  end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin

   with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from people where '''+ComboBox1.Items[ComboBox1.ItemIndex]+''' = surname';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     a := IBQuery3['id'];  // here id of current line
    // label5.Caption := a;
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

     with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from people where '''+ComboBox2.Items[ComboBox2.ItemIndex]+''' = surname';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     b := IBQuery3['id'];  // here id of current line
     //label6.Caption := b;
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

     with IBQuery3 do //find first field id
  begin
    SQL.Text := 'select id from competition where '''+ComboBox3.Items[ComboBox3.ItemIndex]+''' = tour_name';
    Open;
    IBQuery3.First;
    while not IBQuery3.Eof do
    begin
     c := IBQuery3['id'];  // here id of current line
      //label8.Caption := c;
      IBQuery3.Next;
    end;
   IBQuery3.Close;
  end;

  try
   with IBQuery2 do
   begin
    if FNew then  begin
      SQL.Text :=
      'execute procedure proc_team(-1, '+a+', '+b+', '+c+')' ;
    //label9.Caption := 'execute procedure proc_team(-1, '''+a+''', '''+b+''', '''+c+''')'
    end
    else
      SQL.Text := 'execute procedure proc_team(' +IBQuery1.FieldByName('Номер').AsString + ', '''+a+''', '''+b+''', '''+c+''')';
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

procedure TForm5.RadioButton1Click(Sender: TObject);
begin
  FNew := true;
RadioButton2.Checked := false;
end;

procedure TForm5.RadioButton2Click(Sender: TObject);
begin
  FNew := false;
RadioButton1.Checked := false;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
    try
   with IBQuery2 do
   begin
      SQL.Text := 'delete from team where id = ' +IBQuery1.FieldByName('Номер').AsString;
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
