program FacaLoginCom;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login in 'Login.pas' {LoginView},
  Main in 'Main.pas' {MainView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLoginView, LoginView);
  Application.Run;
end.
