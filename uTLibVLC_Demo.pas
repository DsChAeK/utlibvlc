// ##############################################################################################
//   Author:        DsChAeK
//   URL:           http://www.dschaek.de
//   Projekt:       uTLibVLC
//   Lizenz:        Freeware
//   Version:       1.0
//
//   Aufgabe:       Test Program for uTLibVLC
//
//   Info:          It's my Testprogram for my needs, you may have to change some code! :)
//
//   Lizenz:        Copyright (c) 2009, DsChAeK
//
//                  Permission to use, copy, modify, and/or distribute this software for any purpose
//                  with or without fee is hereby granted, provided that the above copyright notice
//                  and this permission notice appear in all copies.
//
//                  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
//                  REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
//                  FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT,
//                  OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
//                  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
//                  ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//
// ##############################################################################################

unit uTLibVLC_Demo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, uTLibVLC, ScktComp, Spin, Menus;

const
  ChrCRLF   = ^M^J;
  HTTP_PORT = 222;
  RC_PORT   = 333;

type
  TOnIsPLaying       = procedure(p_event : Plibvlc_event_t; userdata : Pointer); cdecl;
  TMethodOnIsPlaying = procedure(p_event : Plibvlc_event_t; userdata : Pointer) of object; cdecl;

type
  TFrmMain = class(TForm)
    pan_Video: TPanel;
    Panel1: TPanel;
    BtnInit: TButton;
    BtnPlay: TButton;
    BtnPause: TButton;
    BtnStop: TButton;
    Label1: TLabel;
    MmoOptBase: TMemo;
    Label3: TLabel;
    Label6: TLabel;
    MmoOptPlay: TMemo;
    BtnStartPlay: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    MemoPlay: TMemo;
    EdtURLBase: TEdit;
    EdtUrlPlay: TEdit;
    BtnTrack: TButton;
    Button2: TButton;
    Button1: TButton;
    Button5: TButton;
    SpinEdit1: TSpinEdit;
    Label5: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Close1: TMenuItem;
    Stop1: TMenuItem;
    Stop21: TMenuItem;
    BtnOpen: TButton;
    DlgOpen: TOpenDialog;
    Label7: TLabel;
    EdtDelay: TSpinEdit;
    Button6: TButton;
    SpinEdit2: TSpinEdit;
    Label8: TLabel;
    Button8: TButton;
    BtnFullscreen: TButton;
    Button7: TButton;
    BtnSnapshot: TButton;
    BtnDeinterlace: TButton;
    Button3: TButton;
    Button4: TButton;
    MemoBase: TMemo;
    Timer1: TTimer;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure BtnStopClick(Sender: TObject);
    procedure BtnPauseClick(Sender: TObject);
    procedure BtnPlayClick(Sender: TObject);
    procedure BtnInitClick(Sender: TObject);
    procedure BtnStartPlayClick(Sender: TObject);
    procedure BtnFullscreenClick(Sender: TObject);
    procedure pan_VideoDblClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure BtnTrackClick(Sender: TObject);
    procedure BtnFScreenAutoClick(Sender: TObject);
    procedure BtnSnapshotClick(Sender: TObject);
    procedure BtnDeinterlaceClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private-Deklarationen }
    procedure PrepareAndStart_Base;
    procedure PrepareAndStart_Play;
    procedure PrepareAndStart_Test;

    // Hilfsfunktionen
    function  MakeCdeclCallback(const Method: TMethod; StackSize: Shortint): Pointer;
    procedure FreeCdeclCallback(Callback: Pointer);
    procedure IsPlaying(p_event : Plibvlc_event_t; userdata : Pointer);cdecl;
    procedure OnEventsBase ( Sender : TObject;  MediaEvent : plibvlc_event_t );
    procedure OnEventsPlay ( Sender : TObject;  MediaEvent : plibvlc_event_t );

    procedure OnLogVLCBase(const log_message: libvlc_log_message_t);
    procedure OnLogVLCPlay(const log_message: libvlc_log_message_t);

  public
    { Public-Deklarationen }
    VLC_Play : TLibVLC;
    VLC_Base : TLibVLC;

    // events
    fOnEvents      : libvlc_callback_t;

    FOnIsPLaying       : TOnIsPlaying;
    FMethodOnIsPlaying : TMethodOnIsPlaying;

    procedure Delay(msDelay: DWORD);
    procedure LogStr(Text : String);

    property OnMEvent : libvlc_callback_t read fOnEvents write fOnEvents;
  end;


var
  FrmMain: TFrmMain;

implementation

{$R *.DFM}
procedure vlcCallBackBase(p_event : Plibvlc_event_t; userdata : Pointer); cdecl;
begin
  if ( (NIL <> p_event) and (NIL <> userdata) ) then
    (TFrmMain(userdata)).OnEventsBase( userdata, p_event );
end;

procedure vlcCallBackPlay(p_event : Plibvlc_event_t; userdata : Pointer); cdecl;
begin
  if ( (NIL <> p_event) and (NIL <> userdata) ) then
    (TFrmMain(userdata)).OnEventsPlay( userdata, p_event );
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin

  // create cdecl function pointer
 // FOnIsPlaying := TOnIsPlaying(MakeCdeclCallback(TMethod(FMethodOnIsPlaying), 8));
 // FMethodOnIsPlaying := IsPlaying;

  // test cdecl function pointer
  //FOnIsPlaying(nil, nil);
end;

procedure TFrmMain.BtnStopClick(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  LogStr('project: stop playback');
  VLC_Play.VLC_StopMedia;

  if not Assigned(VLC_Base) then
    exit;
    
  LogStr('project: stop vlc_base');
  VLC_Base.VLC_StopMedia;
end;

procedure TFrmMain.BtnPauseClick(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  VLC_Play.VLC_Pause;
end;

procedure TFrmMain.BtnPlayClick(Sender: TObject);
begin
  if not Assigned(VLC_Base) then
    exit;

  LogStr('project: start base');
  VLC_Base.VLC_PlayMedia(EdtURLBase.Text, TStringList(MmoOptBase.Lines), nil);
  LogStr('project: wait '+IntToStr(EdtDelay.Value)+'s...');
  Delay(EdtDelay.Value);

  if not Assigned(VLC_Play) then
    exit;

  LogStr('project: start play');
  VLC_Play.VLC_PlayMedia(EdtURLPlay.Text, TStringList(MmoOptPlay.Lines), nil);
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned (VLC_Base) then
    VLC_Base.Free;
  if Assigned (VLC_Play) then
    VLC_Play.Free;
end;

procedure TFrmMain.PrepareAndStart_Base;
var
  i : Integer;
  Params : array[0..25] of PAnsiChar;

//  Pevent_manager : Plibvlc_event_manager_t;
begin
  for i := 0 to 25 do begin
    Params[i] := '';
  end;

  // plugin path
  Params[0] := PAnsiChar('--plugin-path=./plugins/');

  // quiet
  Params[1] := PAnsiChar('--quiet');

  // keine Ausgabe
  Params[2] := PAnsiChar('--vout=dummy');
  Params[3] := PAnsiChar('--aout=dummy');

  if Assigned(VLC_Base) then begin
    VLC_Base.Free;
  end;

  if FileExists('libvlc.dll') then begin
    VLC_Base := TLibVLC.Create('vlc_base', 'libvlc.dll', Params, 4, nil, VlcCallbackBase);
  end
  else
    VLC_Base := TLibVLC.Create('vlc_base', VLC_Base.VLC_GetLibPath+ 'libvlc.dll', Params, 3, nil, VlcCallbackBase);

  VLC_Base.OnLog := OnLogVLCBase;

  LogStr(VLC_Base.libvlc_get_version);
end;

procedure TFrmMain.PrepareAndStart_Play;
var
  i : Integer;
  Params : array[0..25] of PAnsiChar;
  Pevent_manager : Plibvlc_event_manager_t;
begin

  for i := 0 to 25 do begin
    Params[i] := '';
  end;

  // plugin path
  Params[0] := PAnsiChar('--plugin-path=./plugins/');

  // quiet
  Params[1] := PAnsiChar('--quiet');

  // Free
  if Assigned(VLC_Play) then begin
    VLC_Play.Free;
  end;

  if FileExists('libvlc.dll') then
    VLC_Play := TLibVLC.Create('vlc_play', 'libvlc.dll', Params, 3, pan_Video, VlcCallbackPlay)
  else
    VLC_Play := TLibVLC.Create('vlc_play', VLC_Play.VLC_GetLibPath+ 'libvlc.dll', Params, 3, pan_Video, VlcCallbackPlay);

   VLC_Play.OnLog := OnLogVLCPlay;

//  VLC_Play.VLC_CreatePlayer();


//  VLC.Lib.libvlc_media_player_set_hwnd(FPlayer_Play, Pointer(Form2.Handle));
//  Form2.Show;

//  VLC.Lib.libvlc_video_set_mouse_input(FPlayer_Play, 0);
(*
  //VLC.Lib.libvlc_video_set_mouse_input(FPlayer_Play, 0);
//  VLC.Lib.libvlc_video_set_key_input(FPlayer, 1);

// WICHTIG: nicht freigeben, sonst keine stats!
//  VLC.Lib.libvlc_media_release (FMedia_Play);
*)

(*
  //  ### media_list with media_player_list
  // media liste erzeugen
  FMedia_List_Play := VLC.Lib.libvlc_media_list_new(FLib_Play);
  // media in liste setzen
  VLC.Lib.libvlc_media_list_add_media(FMedia_List_Play, FMedia_Play);

  // media_list_player erzeugen
  FMedia_List_Player_Play := VLC.Lib.libvlc_media_list_player_new(FLib_Play);
  // media_list_player media_player und media_list zuweisen
  VLC.Lib.libvlc_media_list_player_set_media_player(FMedia_List_Player_Play, FPlayer_Play);
  VLC.Lib.libvlc_media_list_player_set_media_list(FMedia_List_Player_Play, FMedia_List_Play);

  // media_list_player abspielen
  VLC.Lib.libvlc_media_list_player_play(FMedia_List_Player_Play);
*)
//  VLC_Play.libvlc_media_player_play(FPlayer_Play);
end;

procedure TFrmMain.PrepareAndStart_Test;
var
//    FLibInt       : Plibvlc_instance_t;
    Params : array[0..25] of PAnsiChar;

    i : Integer;
begin

  for i := 0 to 25 do begin
    Params[i] := '';
  end;

  // set params for oldrc and oldhttp
//  Params[0] := PAnsiChar('http://192.168.0.6:31339/0,0x002C,0x00A3,0x0068,0x006A');
  //  Params[0] := PAnsiChar('--ignore-config');
//  Params[1] := PAnsiChar('--extraintf=oldrc');
//  Params[2] := PAnsiChar('--http-host=127.0.0.1:222');
//  Params[3] := PAnsiChar('--rc-host=127.0.0.1:333');

//  Params[4] := PAnsiChar('--drawable-hwnd=0');//+ IntToStr(pan_Video.Handle));

  // create libvlc instance
      (*
  if not Assigned(VLC_Play) then
    VLC_Play := TLibVLC.Create('vlc_play', 'libvlc.dll', Params, 3, pan_Video, VlcCallback);

  Delay(500);
  VLC_Play.VLC_PlayMedia(EdtURLPlay.Text, TStringList(MmoOptPlay.Lines), nil);
  

  // create media from url
  FMedia := VLC.Lib.libvlc_media_new_location(FLibInt, 'http://192.168.0.99:31339/0,0x0065,0x0066,0x0067,0x006B');

  // create media_player from media
  FMediaPlayer := VLC.Lib.libvlc_media_player_new_from_media(FMedia);

  // config video output
  VLC.Lib.libvlc_media_player_set_hwnd(FMediaPlayer, Pointer(pan_Video.Handle));

  // create media_list
  FMedia_List := VLC.Lib.libvlc_media_list_new(FLibInt);

  // add media to media_list
  VLC.Lib.libvlc_media_list_add_media(FMedia_List, FMedia);

  // create media_list_player
  FMedia_List_Player := VLC.Lib.libvlc_media_list_player_new(FLibInt);

  // set media_player and media_list to media_list_player
  VLC.Lib.libvlc_media_list_player_set_media_player(FMedia_List_Player, FMediaPlayer);
  VLC.Lib.libvlc_media_list_player_set_media_list(FMedia_List_Player, FMedia_List);

  // play media_list_player
  VLC.Lib.libvlc_media_list_player_play(FMedia_List_Player);
  *)
end;

procedure TFrmMain.BtnInitClick(Sender: TObject);
begin
  if Assigned(VLC_Play) then begin
    if VLC_Play.VLC_IsPlaying then
      exit;
  end;

  LogStr('project: prepare base');
  PrepareAndStart_Base;
  LogStr('project: prepare play');
  PrepareAndStart_Play;

  LogStr('project: start base');
  VLC_Base.VLC_PlayMedia(EdtURLBase.Text, TStringList(MmoOptBase.Lines), nil);
  LogStr('project: wait '+IntToStr(EdtDelay.Value)+'s...');

  Delay(EdtDelay.Value);

  LogStr('project: start play');
  VLC_Play.VLC_PlayMedia(EdtURLPlay.Text, TStringList(MmoOptPlay.Lines), nil);
end;

procedure TFrmMain.BtnStartPlayClick(Sender: TObject);
begin
  PrepareAndStart_Test;
end;

procedure TFrmMain.Delay(msDelay: DWORD);
var
  Start : DWORD;
begin
  Start:=GetTickCount;
  //LogStr(LOG_FUNCTION, 'GetTickCount: '+IntToStr(Start),0);
  repeat
    //  LogStr(LOG_FUNCTION, 'GetTickCount: '+IntToStr(GetTickCount),0);
    sleep(2);

    Application.ProcessMessages;
  until GetTickCount-Start > msDelay;
end;


procedure TFrmMain.IsPlaying(p_event : Plibvlc_event_t; userdata : Pointer);
begin
  showmessage('is playing');
end;

function TFrmMain.MakeCdeclCallback(const Method: TMethod; StackSize: Shortint): Pointer;
{$IFDEF WIN32}
type
  PCallbackPush = ^TCallbackPush;
  TCallbackPush = packed record
    // push dword ptr [esp+x]
    PushParmOps: array [0..2] of Byte;
    PushParmVal: Shortint;
  end;
  PCallbackCall = ^TCallbackCall;
  TCallbackCall = packed record
    // push dword ptr [offset]
    PushDataOps: array [0..1] of Byte;
    PushDataVal: Pointer;
    // call [offset]
    CallCodeOps: array [0..1] of Byte;
    CallCodeVal: Pointer;
    // add esp,x
    AddEspXXOps: array [0..1] of Byte;
    AddEspXXVal: Shortint;
    // ret
    Return     : Byte;
  end;
var
  Size: Shortint;
  Loop: Shortint;
  Buff: Pointer;
{$ENDIF}
begin
{$IFDEF WIN32}
  if (StackSize < 0) or  // check for invalid parameter and Shortint overflow
    (StackSize > High(Shortint) + 1 - 2 * SizeOf(Longword)) then
  begin
    Result := nil;
    Exit;
  end;
  Result := VirtualAlloc(nil, $100, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
  if Assigned(Result) then
    try
      Buff := Result;
      if StackSize <= 0 then
        Size := 0
      else
      begin
        // Copy parameters (used Longwords)
        Size := ((StackSize - 1) div SizeOf(Longword) + 1) * SizeOf(Longword);
        for Loop := 1 to Size div SizeOf(Longword) do
        begin
          with PCallbackPush(Buff)^ do
          begin
            PushParmOps[0] := $FF;
            PushParmOps[1] := $74;
            PushParmOps[2] := $24;
            PushParmVal := Size;
          end;
          Inc(PCallbackPush(Buff));
        end;
      end;
      with PCallbackCall(Buff)^ do
      begin
        // Push Self
        PushDataOps[0] := $FF;
        PushDataOps[1] := $35;
        PushDataVal := Addr(Method.Data);
        // Call Method
        CallCodeOps[0] := $FF;
        CallCodeOps[1] := $15;
        CallCodeVal := Addr(Method.Code);
        // Fix Stack
        AddEspXXOps[0] := $83;
        AddEspXXOps[1] := $C4;
        AddEspXXVal := Size + SizeOf(Longword);
        // Return
        Return := $C3;
      end;
    except
      VirtualFree(Result, 0, MEM_RELEASE);
      Result := nil;
    end;
{$ELSE}
  Result := nil;
{$ENDIF}
end;

procedure TFrmMain.FreeCdeclCallback(Callback: Pointer);
begin
{$IFDEF WIN32}
  if Assigned(Callback) then
    VirtualFree(Callback, 0, MEM_RELEASE);
{$ENDIF}
end;

procedure TFrmMain.BtnFullscreenClick(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  VLC_Play.VLC_ToggleFullscreen(pan_Video, nil);
  Delay(3000);
  VLC_Play.VLC_ToggleFullscreen(pan_Video, nil);
end;

procedure TFrmMain.pan_VideoDblClick(Sender: TObject);
begin
  VLC_Play.VLC_ToggleFullscreen(pan_Video, nil);
end;

procedure TFrmMain.FormDblClick(Sender: TObject);
begin
  VLC_Play.VLC_ToggleFullscreen(pan_Video, nil);
end;

procedure TFrmMain.OnEventsBase(Sender: TObject; MediaEvent: plibvlc_event_t);
begin
  ShowMessage('event vlc_base');
end;

procedure TFrmMain.OnEventsPlay(Sender: TObject; MediaEvent: plibvlc_event_t);
begin
  ShowMessage('event vlc_play');
end;

procedure TFrmMain.BtnTrackClick(Sender: TObject);
begin
  MemoPlay.Lines.Append(VLC_Play.VLC_GetAudioTrackList());
end;

procedure TFrmMain.BtnFScreenAutoClick(Sender: TObject);
begin
  BtnInitClick(Sender);
  Delay(10000);

  BtnFullscreenClick(Sender);
  Delay(2000);
  BtnFullscreenClick(Sender);
  BtnStopClick(Sender);

  Screen.Cursor := crDefault;
end;

procedure TFrmMain.BtnSnapshotClick(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  VLC_Play.VLC_TakeSnapshot('c:\test.png', 0, 0);
end;

procedure TFrmMain.BtnDeinterlaceClick(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  VLC_Play.VLC_SetDeinterlaceMode('discard');
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  if not Assigned(VLC_Base) then
    exit;

  if VLC_Base.VLC_IsPlaying then
    ShowMEssage('true')
  else
    ShowMEssage('false')
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  if VLC_Play.VLC_IsPlaying then
    ShowMEssage('true')
  else
    ShowMEssage('false')
end;

procedure TFrmMain.Button3Click(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;
    
  VLC_Play.VLC_SetCropMode('4:3');
end;

procedure TFrmMain.Button4Click(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  VLC_Play.VLC_SetARMode('16:9');
end;

procedure TFrmMain.Button5Click(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  VLC_Play.VLC_SetMute(not VLC_Play.VLC_GetMute);
end;

procedure TFrmMain.SpinEdit2Change(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  VLC_Play.VLC_SetAudioTrack(SpinEdit2.Value)
end;

procedure TFrmMain.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.Stop1Click(Sender: TObject);
begin
  LogStr('project: stop playback');
  VLC_Play.VLC_Stop;
  LogStr('project: stop vlc_base');
  if Assigned(VLC_Base) then
    VLC_Base.VLC_Stop;
end;

procedure TFrmMain.BtnOpenClick(Sender: TObject);
begin
  if Assigned(VLC_Play) then begin
    if VLC_Play.VLC_IsPlaying then
      exit;
  end;

  DlgOpen.Execute;

  EdtURLBase.Text := Trim(DlgOpen.Files.Text);

  if DlgOpen.Files.Text = '' then
    exit;

  LogStr('project: prepare base');
  PrepareAndStart_Base;
  LogStr('project: prepare play');
  PrepareAndStart_Play;

  LogStr('project: start base');
  VLC_Base.VLC_PlayMedia(EdtURLBase.Text, TStringList(MmoOptBase.Lines), nil);
  LogStr('project: wait 2s...');
  Delay(2000);

  LogStr('project: start play');
  VLC_Play.VLC_PlayMedia(EdtURLPlay.Text, TStringList(MmoOptPlay.Lines), nil);
end;

procedure TFrmMain.Button6Click(Sender: TObject);
begin
  if Assigned(VLC_Play) then begin
    if VLC_Play.VLC_IsPlaying then
      exit;
  end;

  LogStr('project: start play');
  PrepareAndStart_Play;
  VLC_Play.VLC_PlayMedia(EdtURLBase.Text, TStringList(MmoOptPlay.Lines), nil);
end;

procedure TFrmMain.LogStr(Text: String);
begin
  MemoBase.Lines.Append(FormatDateTime('hh:nn:ss:zzz', now)+', '+Text);
end;

procedure TFrmMain.Button7Click(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  VLC_Play.VLC_SetLogo('c:\test.png');
end;

procedure TFrmMain.SpinEdit1Change(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;
    
  VLC_Play.VLC_SetVolume(SpinEdit1.Value)
end;

procedure TFrmMain.Button8Click(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;
                                  // FF0000
  vlc_play.VLC_SetMarquee('TEST', 16711680, 100, 6, 0, 50, 5000, 50, 50);
end;

procedure TFrmMain.OnLogVLCBase(const log_message: libvlc_log_message_t);
begin
  MemoBase.Lines.Append(FormatDateTime('hh:nn:ss:zzz', now)+' vlc_base, typ: '+log_message.psz_type+' name: '+log_message.psz_name+' header: '+log_message.psz_header+' msg: '+log_message.psz_message);
  SendMessage(MemoBase.Handle,WM_VSCROLL,SB_BOTTOM,0);
end;

procedure TFrmMain.OnLogVLCPlay(const log_message: libvlc_log_message_t);
begin
  MemoPlay.Lines.Append(FormatDateTime('hh:nn:ss:zzz', now)+' vlc_play, typ: '+log_message.psz_type+' name: '+log_message.psz_name+' header: '+log_message.psz_header+' msg: '+log_message.psz_message);
  SendMessage(MemoPlay.Handle,WM_VSCROLL,SB_BOTTOM,0);
end;

procedure TFrmMain.Timer1Timer(Sender: TObject);
begin
  if not Assigned(VLC_Play) then
    exit;

  if not VLC_Play.VLC_IsPlaying() then
    exit;

  try
    Label1.Caption := 'Bitrate: '+FloatToStr(Round(VLC_Play.VLC_GetStats().f_demux_bitrate*1000)) + ' kb/s';
  except
  end;
end;

end.
