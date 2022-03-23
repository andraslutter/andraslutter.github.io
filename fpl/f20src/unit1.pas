unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Pacakatt(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    var lista:TList;
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  lista:=TList.Create;
end;

procedure TForm1.Pacakatt(Sender: TObject);
begin
  lista.Remove(Sender);
  Application.ReleaseComponent(TShape(Sender));
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i:integer;
    paca:TShape;
    dx,dy:integer;
begin
 for i:=0 to lista.Count-1 do begin
   paca:=TShape(lista.Items[i]);
   dx:=random(3)-1;
   dy:=random(3)-1;
   paca.Left:=paca.Left+dx;
   paca.Top:=paca.Top+dy;
   if paca.Left<0 then paca.Left:=0;
   if paca.Left>Width-paca.Width then paca.Left:=Width-paca.Width;
   if paca.Top<0 then paca.Top:=0;
   if paca.Top>Height-paca.Height then paca.Top:=Height-paca.Height;
 end;
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var paca:TShape;
begin
 paca:=TShape.Create(Form1);
 paca.Shape:=stCircle;
 paca.height:=32;
 paca.Width:=32;
 paca.Brush.Color:=128+random(128)+256*(128+random(128))+65536*(128+random(128));
 paca.Brush.Style:=bsSolid;
 paca.Parent:=Form1;
 paca.Top:=y-paca.height div 2;
 paca.Left:=x-paca.width div 2;
 paca.OnClick:=@Pacakatt;
 lista.Add(paca);
end;

end.

