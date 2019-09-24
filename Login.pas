unit Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.FacebookLogin, Main;

type
  TLoginView = class(TForm)
    FacebookLogin1: TFacebookLogin;
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FacebookLogin1LoginSuccess(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginView: TLoginView;

implementation

{$R *.fmx}

procedure TLoginView.FacebookLogin1LoginSuccess(Sender: TObject);
var
  LMain: TMainView;
begin
  LMain := TMainView.Create(nil);
  LMain.LabelName.Text := FacebookLogin1.User.Name;
  LMain.ImageAvatar.Bitmap.LoadFromStream(FacebookLogin1.User.Picture);
  LMain.EditToken.Text := FacebookLogin1.AccessToken;

  Application.MainForm := LMain;
  Application.MainForm.Show;

  Close;
end;

procedure TLoginView.FormCreate(Sender: TObject);
begin
  FacebookLogin1.Execute;
end;

end.
