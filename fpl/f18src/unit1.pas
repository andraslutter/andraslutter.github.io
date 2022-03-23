unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure SajatClick(Sender:TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
    g:TButton;
begin
 for i:=1 to length(Edit1.Caption) do begin
   g:=TButton.Create(Form1);
   g.Parent:=Form1;
   g.Height:=32;
   g.Width:=32;
   g.Top:=50;
   g.Left:=i*10+(i-1)*32;
   g.Caption:=Edit1.Caption[i];
   g.Font.Size:=18;
   g.OnClick:=@SajatClick;
 end;
end;

procedure TForm1.SajatClick(Sender:TObject);
var g:TButton;
begin
 g:=TButton(Sender);
 g.Caption:=IntToStr((StrToInt(g.Caption)+1) mod 10);
end;

end.

