Unit Unit1;

Interface

Uses
  MMSystem, Classes, Controls, Forms, StdCtrls, ExtCtrls, ComCtrls, SysUtils,
  Dialogs;

Type
  TForm1 = Class(TForm)
    Timer1: TTimer;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TrackBar3: TTrackBar;
    shp1: TShape;
    lbl1: TLabel;
    shp2: TShape;
    lbl2: TLabel;
    shp3: TShape;
    lbl3: TLabel;
    shp4: TShape;
    lbl4: TLabel;
    shp5: TShape;
    lbl5: TLabel;
    shp6: TShape;
    lbl6: TLabel;
    shp7: TShape;
    lbl7: TLabel;
    shp8: TShape;
    lbl8: TLabel;
    shp9: TShape;
    lbl9: TLabel;
    shp10: TShape;
    lbl10: TLabel;
    shp11: TShape;
    lbl11: TLabel;
    shp12: TShape;
    lbl12: TLabel;
    lblX: TLabel;
    lblY: TLabel;
    lblZ: TLabel;
    cbbJoystick: TComboBox;
    Procedure Timer1Timer(Sender: TObject);
    Procedure FormShow(Sender: TObject);
  End;

Var
  Form1: TForm1;
  MyJoy: TJoyInfo;
  ErrorResult: MMRESULT;

Const
  MyRed = $0000FF;
  MyMaroon = $000080;

Implementation

{$R *.dfm}

Procedure TForm1.FormShow(Sender: TObject);
Begin
  cbbJoystick.Clear;
  ErrorResult := joyGetPos(joystickid1, @MyJoy);
  If (ErrorResult = JOYERR_NOERROR) Then
    cbbJoystick.AddItem('Joystick 1', nil);
  ErrorResult := joyGetPos(joystickid2, @MyJoy);
  If (ErrorResult = JOYERR_NOERROR) Then
    cbbJoystick.AddItem('Joystick 2', nil);
  If (cbbJoystick.Items[0] = '') Then
  Begin
    ShowMessage('No joystick detected!' + sLineBreak + 'The program will now exit.');
    Application.Terminate;
    exit;
  End
  Else
    cbbJoystick.ItemIndex := 0;
//  JOYERR_NOERROR    = 0;              { no error }
//  JOYERR_BASE       = 160;
//  JOYERR_PARMS      = JOYERR_BASE+5;  { 165 bad parameters }
//  JOYERR_NOCANDO    = JOYERR_BASE+6;  { 166 request not completed }
//  JOYERR_UNPLUGGED  = JOYERR_BASE+7;  { 167 joystick is unplugged }
End;

Procedure TForm1.Timer1Timer(Sender: TObject);
Begin
  If (cbbJoystick.Text = 'Joystick 1') Then
    ErrorResult := joyGetPos(joystickid1, @MyJoy)
  Else If (cbbJoystick.Text = 'Joystick 2') Then
    ErrorResult := joyGetPos(joystickid2, @MyJoy)
  Else
    Exit;
  If ErrorResult = JOYERR_NOERROR Then
  Begin
    TrackBar1.Position := MyJoy.wXpos;
    lblX.Caption := inttostr(MyJoy.wXpos);
    TrackBar2.Position := MyJoy.wYpos;
    lblY.Caption := inttostr(MyJoy.wYpos);
    TrackBar3.Position := MyJoy.wZpos;
    lblZ.Caption := inttostr(MyJoy.wZpos);
    If (MyJoy.wbuttons And joy_button1) > 0 Then
      shp1.Brush.Color := MyRed
    Else
      shp1.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button2) > 0 Then
      shp2.Brush.Color := MyRed
    Else
      shp2.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button3) > 0 Then
      shp3.Brush.Color := MyRed
    Else
      shp3.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button4) > 0 Then
      shp4.Brush.Color := MyRed
    Else
      shp4.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button5) > 0 Then
      shp5.Brush.Color := MyRed
    Else
      shp5.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button6) > 0 Then
      shp6.Brush.Color := MyRed
    Else
      shp6.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button7) > 0 Then
      shp7.Brush.Color := MyRed
    Else
      shp7.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button8) > 0 Then
      shp8.Brush.Color := MyRed
    Else
      shp8.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button9) > 0 Then
      shp9.Brush.Color := MyRed
    Else
      shp9.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button10) > 0 Then
      shp10.Brush.Color := MyRed
    Else
      shp10.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button11) > 0 Then
      shp11.Brush.Color := MyRed
    Else
      shp11.Brush.Color := MyMaroon;
    If (MyJoy.wbuttons And joy_button12) > 0 Then
      shp12.Brush.Color := MyRed
    Else
      shp12.Brush.Color := MyMaroon;
  End;
End;

End.

