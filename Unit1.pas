unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, WinHttp_TLB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Timer2: TTimer;
    Label5: TLabel;
    Timer3: TTimer;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Button3: TButton;
    Timer4: TTimer;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    Button4: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A: Cardinal;
    check:integer;

implementation

uses unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  SetWindowPos(Form1.handle, HWND_TOPMOST, Form1.Left, Form1.Top, Form1.Width, Form1.Height, 0);
end;

procedure TForm1.Label7Click(Sender: TObject);
begin

end;

//  버튼

procedure TForm1.Button1Click(Sender: TObject);
var
  Winhttp: IWinHttpRequest;
begin
  Winhttp := coWinHttpRequest.Create;
  Winhttp.Open('GET', 'https://servers.fivem.net/servers/detail/52.231.152.109:30120', False);
  Winhttp.send('');
  if AnsiPos('64/64', Winhttp.responsetext) <> 0 then
  begin
    ShowMessage('엘시이움 현재 풀섭입니다' + #13#10 + '잠시 기다려주세요');
  end
  else
  begin
    MessageDlg('현재 엘리시움에 자리가 남았어요 !', mtWarning, [mbOk], 0);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Winhttp: IWinHttpRequest;
  sTmp: String;
begin
  Winhttp := coWinHttpRequest.Create;
  Winhttp.Open('GET', 'https://servers.fivem.net/servers/detail/52.231.152.109:30120', False);
  Winhttp.send('');

  sTmp := splits(Winhttp.responsetext, '<span _ngcontent-sc7="">', '</span>')[2];
  Label1.Caption := sTmp;
  if sTmp = '64/64' then
  begin
    MessageDlg('엘시시움 현재 풀섭입니다' + #13#10 + '잠시 기다려주세요', mtInformation,
      [mbOk], 0);
    MessageDlg('알람 체크 해놓고 기다리면 자리가 비었을때 메세지뜹니당', mtInformation, [mbOk], 0);
  end
  else
  begin
    MessageDlg('현재 엘리시움에 자리가 있습니다 언넝 들어가세요 !', mtWarning, [mbOk], 0);
  end;
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  Winhttp: IWinHttpRequest;
  sTmp: String;
begin
  Winhttp := coWinHttpRequest.Create;
  Winhttp.Open('GET', 'https://servers.fivem.net/servers/detail/52.231.152.109:30120', False);
  Winhttp.send('');

  sTmp := splits(Winhttp.responsetext, '<span _ngcontent-sc7="">', '</span>')[2];
  Label2.Caption := sTmp;
  if sTmp = '64/64' then
  begin
    MessageDlg('1채널 엘시시움 현재 풀섭입니다' + #13#10 + '잠시 기다려주세요', mtInformation,
      [mbOk], 0);
    MessageDlg('알람 체크 해놓고 기다리면 자리가 비었을때 메세지뜹니당', mtInformation, [mbOk], 0);
  end
  else
  begin
    MessageDlg('1채널 현재 엘리시움에 자리가 있습니다 언넝 들어가세요 !', mtWarning, [mbOk], 0);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
Winhttp:IWinHttpRequest;
 Serial : Integer;
 AA,BB: String;
begin
 Serial := GetHDSerialNumber;
 AA := Format ('%4X-%4X', [LongRec(Serial).hi, LongRec(Serial).lo]);
begin
try
Winhttp := coWinHttpRequest.Create;
Winhttp.Open('GET','http://woauddl.dothome.co.kr/HDD.txt', false);
Winhttp.send('');
if not(AnsiPos((AA), Winhttp.ResponseText) <> 0)then
begin
MessageDlg('허가받지 못한 사용자입니다.', mtError,[mbOk], 0);
MessageDlg('재명이(AAA) 에게 문의해주세요.', mtError,[mbOk], 0);
end
else begin
Button4.Enabled :=false;
Button4.Visible :=false;
MessageDlg('허가 받은 사용자 입니다. '+AA+'', mtInformation,[mbOk], 0);
end;
except
end;
end;
end;

//체크박스


procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  GroupBox1.Enabled :=false;
end;


procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  Timer4.Enabled := True;
  GroupBox2.Enabled :=false;
end;

//타이머

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Winhttp: IWinHttpRequest;
  sTmp: String;
begin
  Winhttp := coWinHttpRequest.Create;
  Winhttp.Open('GET', 'https://servers.fivem.net/servers/detail/52.231.152.109:30120', False);
  Winhttp.send('');

  sTmp := splits(Winhttp.responsetext, '<span _ngcontent-sc7="">', '</span>')[2];
  Label1.Caption := sTmp;

  if sTmp <> '64/64' then
  begin
    if CheckBox1.checked then
    begin
      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
     // Timer1.Enabled := false;
     begin
    if check = 0 then
    begin
      check:=1;
       MessageDlg('2채널 엘리시움에 접속 합니다 ! END 눌러서 프로그램을 종료해주세요!', mtWarning, [mbOk], 0);
    end;
end;
    //  MessageDlg('현재 엘리시움 접속 가능합니다 ! END 눌러서 끄세요!', mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  Winhttp: IWinHttpRequest;
begin
  Winhttp := coWinHttpRequest.Create;
  Winhttp.Open('GET', 'https://blog.naver.com/PostView.nhn?blogId=dustmqtodwlstjd1&logNo=221533592916&redirect=Dlog&widgetTypeCall=true&directAccess=false', False);
  Winhttp.send('');

  if AnsiPos('((on))', Winhttp.responsetext) <> 0 then
  begin
    Timer2.Enabled := False;
    hello; // true
  end
  else
  begin // 아닐시에는
    Form1.Enabled := False;
    Form1.Visible := False;
    begin
    if check = 0 then
    begin
      check:=1;
     MessageDlg('현재 이용이 불가합니다 :( 문의해주세요.', mtWarning, [mbOk], 0);
      Application.Terminate;
    end;
end;
   // MessageDlg('현재 이용이 불가합니다 :( 문의해주세요.', mtWarning, [mbOk], 0);
    Application.Terminate;
  end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  if GetAsyncKeyState(VK_END) <> 0 then              //END 종료
  begin
    Application.Terminate;
  end;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
var
  Winhttp: IWinHttpRequest;
  sTmp: String;
begin
  Winhttp := coWinHttpRequest.Create;
  Winhttp.Open('GET', 'https://servers.fivem.net/servers/detail/52.231.152.109:30120', False);
  Winhttp.send('');

  sTmp := splits(Winhttp.responsetext, '<span _ngcontent-sc7="">', '</span>')[2];
  Label2.Caption := sTmp;

  if sTmp <> '64/64' then
 // begin
  //  if CheckBox2.checked then
    begin
      mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
     // Timer1.Enabled := false;
     begin
     Timer3.Enabled := true;
    if check = 0 then
    begin
      check:=1;
       MessageDlg('1채널 엘리시움에 접속 합니다 ! END 눌러서 프로그램을 종료해주세요!', mtWarning, [mbOk], 0);
    end;
end;
    //  MessageDlg('현재 엘리시움 접속 가능합니다 ! END 눌러서 끄세요!', mtWarning, [mbOk], 0);
    end;
end;

end.
