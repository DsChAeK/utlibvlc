object FrmMain: TFrmMain
  Left = 234
  Top = 191
  BorderStyle = bsSingle
  Caption = 'VLC Testsuite -> demo using one or two vlc instances'
  ClientHeight = 506
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 448
    Top = 374
    Width = 67
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Bitrate: 0 kb/s'
  end
  object Label3: TLabel
    Left = 448
    Top = 2
    Width = 63
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Base Options'
  end
  object Label6: TLabel
    Left = 448
    Top = 173
    Width = 59
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Play Options'
  end
  object pan_Video: TPanel
    Left = 3
    Top = 2
    Width = 440
    Height = 231
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 0
    OnDblClick = pan_VideoDblClick
  end
  object Panel1: TPanel
    Left = 2
    Top = 453
    Width = 766
    Height = 53
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object Label5: TLabel
      Left = 547
      Top = 8
      Width = 15
      Height = 13
      Caption = 'Vol'
    end
    object Label7: TLabel
      Left = 2
      Top = 33
      Width = 27
      Height = 13
      Hint = 'delay between vlc_base and vlc_play'
      Caption = 'Delay'
      ParentShowHint = False
      ShowHint = True
    end
    object Label8: TLabel
      Left = 537
      Top = 32
      Width = 28
      Height = 13
      Caption = 'Track'
    end
    object BtnInit: TButton
      Left = 3
      Top = 3
      Width = 88
      Height = 21
      Hint = 'start vlc_base, wait delay and start vlc_play'
      Caption = 'Start (Base/Play)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtnInitClick
    end
    object BtnPlay: TButton
      Left = 249
      Top = 3
      Width = 40
      Height = 21
      Caption = 'Play'
      TabOrder = 1
      OnClick = BtnPlayClick
    end
    object BtnPause: TButton
      Left = 306
      Top = 3
      Width = 40
      Height = 21
      Caption = 'Pause'
      TabOrder = 2
      OnClick = BtnPauseClick
    end
    object BtnStop: TButton
      Left = 362
      Top = 3
      Width = 40
      Height = 21
      Caption = 'Stop'
      TabOrder = 3
      OnClick = BtnStopClick
    end
    object BtnStartPlay: TButton
      Left = 436
      Top = 4
      Width = 63
      Height = 21
      Caption = 'Start Test'
      TabOrder = 4
      OnClick = BtnStartPlayClick
    end
    object BtnTrack: TButton
      Left = 618
      Top = 2
      Width = 75
      Height = 21
      Caption = 'Audio Tracks'
      TabOrder = 5
      OnClick = BtnTrackClick
    end
    object Button2: TButton
      Left = 327
      Top = 29
      Width = 75
      Height = 21
      Caption = 'IsPlay Play'
      TabOrder = 6
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 249
      Top = 29
      Width = 74
      Height = 21
      Caption = 'IsPlay Base'
      TabOrder = 7
      OnClick = Button1Click
    end
    object Button5: TButton
      Left = 618
      Top = 29
      Width = 75
      Height = 21
      Caption = 'Mute'
      TabOrder = 8
      OnClick = Button5Click
    end
    object SpinEdit1: TSpinEdit
      Left = 568
      Top = 4
      Width = 43
      Height = 22
      MaxValue = 200
      MinValue = 0
      TabOrder = 9
      Value = 0
      OnChange = SpinEdit1Change
    end
    object BtnOpen: TButton
      Left = 117
      Top = 4
      Width = 106
      Height = 21
      Hint = 'Open any file/url you want'
      Caption = 'Open (Base/Play)'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = BtnOpenClick
    end
    object EdtDelay: TSpinEdit
      Left = 41
      Top = 29
      Width = 50
      Height = 22
      Hint = 'delay between vlc_base and vlc_play'
      Increment = 500
      MaxValue = 10000
      MinValue = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      Value = 2000
    end
    object Button6: TButton
      Left = 117
      Top = 29
      Width = 106
      Height = 21
      Caption = 'Play (Base Only)'
      TabOrder = 12
      OnClick = Button6Click
    end
    object SpinEdit2: TSpinEdit
      Left = 568
      Top = 29
      Width = 43
      Height = 22
      MaxValue = 200
      MinValue = 0
      TabOrder = 13
      Value = 0
      OnChange = SpinEdit2Change
    end
  end
  object MmoOptBase: TMemo
    Left = 448
    Top = 16
    Width = 311
    Height = 150
    Anchors = [akTop, akRight]
    Lines.Strings = (
      ':sout=#http{mux=ts,dst=192.168.0.3:31339}'
      ':sout-all'
      ':http-caching=1000'
      ':udp-caching=250'
      ':high-priority'
      ':sout-ts-es-id-pid'
      ':ts-es-id-pid'
      ':http-reconnect')
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
  end
  object MmoOptPlay: TMemo
    Left = 448
    Top = 187
    Width = 309
    Height = 181
    Anchors = [akTop, akRight]
    Lines.Strings = (
      ':deinterlace=1'
      ':deinterlace-mode=mean'
      ':vout='
      ':high-priority'
      ':input-record-path='
      ':aspect-ratio=default'
      ':crop=default'
      ':no-fullscreen'
      ':no-video-title-show'
      ':http-caching='
      ':http-reconnect')
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 236
    Width = 443
    Height = 215
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    object Label2: TLabel
      Left = 6
      Top = 168
      Width = 49
      Height = 13
      Hint = 
        'plays a url or file and generates (default option!) a http strea' +
        'm on 31339'
      Caption = 'Base URL'
      ParentShowHint = False
      ShowHint = True
    end
    object Label4: TLabel
      Left = 6
      Top = 192
      Width = 45
      Height = 13
      Hint = 'plays the http stream generated by vlc_base'
      Caption = 'Play URL'
    end
    object MemoPlay: TMemo
      Left = 1
      Top = 81
      Width = 441
      Height = 80
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Terminal'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      WordWrap = False
    end
    object EdtURLBase: TEdit
      Left = 63
      Top = 165
      Width = 373
      Height = 21
      Hint = 
        'plays a url or file and generates (default option!) a http strea' +
        'm on 31339'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'http://192.168.0.111:31339/0,0x002C,0x00A3,0x0068,0x006A'
    end
    object EdtUrlPlay: TEdit
      Left = 63
      Top = 189
      Width = 373
      Height = 21
      Hint = 'plays the http stream generated by vlc_base'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Text = 'http://192.168.0.3:31339'
    end
    object MemoBase: TMemo
      Left = 1
      Top = 1
      Width = 441
      Height = 80
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Terminal'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
      WordWrap = False
    end
  end
  object Button8: TButton
    Left = 683
    Top = 399
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'Set Marquee'
    TabOrder = 5
    OnClick = Button8Click
  end
  object BtnFullscreen: TButton
    Left = 448
    Top = 399
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'Fullscreen'
    TabOrder = 6
    OnClick = BtnFullscreenClick
  end
  object Button7: TButton
    Left = 448
    Top = 426
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'SetLogo'
    TabOrder = 7
    OnClick = Button7Click
  end
  object BtnSnapshot: TButton
    Left = 526
    Top = 399
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'Snapshot'
    TabOrder = 8
    OnClick = BtnSnapshotClick
  end
  object BtnDeinterlace: TButton
    Left = 526
    Top = 425
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'Deinterlace'
    TabOrder = 9
    OnClick = BtnDeinterlaceClick
  end
  object Button3: TButton
    Left = 604
    Top = 399
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'Crop 4:3'
    TabOrder = 10
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 604
    Top = 424
    Width = 75
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'AR 16:9'
    TabOrder = 11
    OnClick = Button4Click
  end
  object MainMenu1: TMainMenu
    Left = 489
    Top = 369
    object File1: TMenuItem
      Caption = 'File'
      object Close1: TMenuItem
        Caption = 'Close'
        OnClick = Close1Click
      end
    end
    object Stop1: TMenuItem
      Caption = 'Stop'
      object Stop21: TMenuItem
        Caption = 'Stop'
        OnClick = Stop1Click
      end
    end
  end
  object DlgOpen: TOpenDialog
    Left = 710
    Top = 7
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 459
    Top = 369
  end
end
