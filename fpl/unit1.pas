unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

var pont:integer;

procedure hopp;
begin
  with Form1 do begin
    Image1.Left:=random(Width-Image1.Width);
    Image1.Top:=random(Height-Image1.Height);
  end;
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label1.Caption:='Kapd el a labdát!';
  Image1.Visible:=False;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  pont:=pont+1;
  Form1.Label1.Caption:=IntToStr(pont);
  hopp;
  Form1.Timer1.Enabled:=False;
  Form1.Timer1.Enabled:=True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  hopp;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Enabled:=True;
  Image1.Visible:=True;
end;

end.

