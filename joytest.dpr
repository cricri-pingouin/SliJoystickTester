Program joytest;

Uses
  Forms,
  Unit1 In 'Unit1.pas' {Form1};

{$R *.res}
{$SetPEFlags 1}

Begin
  Application.Initialize;
  Application.Title := 'Joystick test';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
End.

