unit Unit2;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

procedure r2sume;
procedure susp2nd;
procedure hello;
Function splits(main: String; First: String; Second: String): TStringList;
function GetHDSerialNumber : Integer;

implementation

uses unit1;

procedure r2sume;
begin
  Form1.Enabled := True;
  Form1.Visible := True;
end;

procedure susp2nd;
begin
  Form1.Enabled := False;
  Form1.Visible := False;
end;

procedure hello;
begin
  sleep(500);
  CreateThread(nil, 0, @susp2nd, @susp2nd, 0, A);
  ShowMessage('개발자 손재명' + #13#10 + '디스코드 : 제명당한 재명이#4453 혹은 엘리시움 디스코드 AAA 문의');
  CreateThread(nil, 0, @r2sume, @r2sume, 0, A);
end;

Function splits(main: String; First: String; Second: String): TStringList;
var
  sTmp: String;
  sData: TStringList;
begin
  sData := TStringList.Create();
  sTmp := main;
  while POS(First, sTmp) > 0 do
  begin
    sTmp := copy(sTmp, POS(First, sTmp) + length(First), length(sTmp));
    sData.add((copy(sTmp, 1, POS(Second, sTmp) - 1)));
  end;
  Result := sData;
end;

function GetHDSerialNumber : Integer;
var
 PDW : Integer;
 MC, FL : DWord;
begin
 GetVolumeInformation( nil, nil, 0, @pdw, mc, fl, nil, 0 );
 Result := pdw;
end;

end.
