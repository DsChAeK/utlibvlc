object FrmMain: TFrmMain
  Left = 194
  Top = 193
  BorderStyle = bsSingle
  Caption = 'VLC Testsuite'
  ClientHeight = 500
  ClientWidth = 846
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
    Left = 390
    Top = 422
    Width = 64
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'read_bytes: 0'
  end
  object Label3: TLabel
    Left = 394
    Top = 4
    Width = 63
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Base Options'
  end
  object Label6: TLabel
    Left = 394
    Top = 208
    Width = 59
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Play Options'
  end
  object pan_Video: TPanel
    Left = 3
    Top = 2
    Width = 383
    Height = 203
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 0
    OnDblClick = pan_VideoDblClick
  end
  object Panel1: TPanel
    Left = 2
    Top = 438
    Width = 846
    Height = 62
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object Label5: TLabel
      Left = 444
      Top = 9
      Width = 15
      Height = 13
      Caption = 'Vol'
    end
    object Label7: TLabel
      Left = 162
      Top = 39
      Width = 27
      Height = 13
      Caption = 'Delay'
    end
    object Label8: TLabel
      Left = 433
      Top = 36
      Width = 28
      Height = 13
      Caption = 'Track'
    end
    object BtnInit: TButton
      Left = 3
      Top = 3
      Width = 75
      Height = 27
      Caption = 'Init'
      TabOrder = 0
      OnClick = BtnInitClick
    end
    object BtnPlay: TButton
      Left = 84
      Top = 3
      Width = 75
      Height = 27
      Caption = 'Play'
      TabOrder = 1
      OnClick = BtnPlayClick
    end
    object BtnPause: TButton
      Left = 165
      Top = 3
      Width = 75
      Height = 27
      Caption = 'Pause'
      TabOrder = 2
      OnClick = BtnPauseClick
    end
    object BtnStop: TButton
      Left = 246
      Top = 3
      Width = 75
      Height = 27
      Caption = 'Stop'
      TabOrder = 3
      OnClick = BtnStopClick
    end
    object BtnStartPlay: TButton
      Left = 332
      Top = 4
      Width = 94
      Height = 27
      Caption = 'Start Test'
      TabOrder = 4
      OnClick = BtnStartPlayClick
    end
    object BtnFullscreen: TButton
      Left = 594
      Top = 3
      Width = 75
      Height = 27
      Caption = 'Fullscreen'
      TabOrder = 5
      OnClick = BtnFullscreenClick
    end
    object BtnTrack: TButton
      Left = 514
      Top = 3
      Width = 75
      Height = 27
      Caption = 'Audio Tracks'
      TabOrder = 6
      OnClick = BtnTrackClick
    end
    object BtnSnapshot: TButton
      Left = 672
      Top = 3
      Width = 75
      Height = 27
      Caption = 'Snapshot'
      TabOrder = 7
      OnClick = BtnSnapshotClick
    end
    object BtnDeinterlace: TButton
      Left = 672
      Top = 33
      Width = 75
      Height = 25
      Caption = 'Deinterlace'
      TabOrder = 8
      OnClick = BtnDeinterlaceClick
    end
    object Button2: TButton
      Left = 84
      Top = 32
      Width = 75
      Height = 25
      Caption = 'IsPlay Play'
      TabOrder = 9
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 756
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Crop 4:3'
      TabOrder = 10
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 756
      Top = 32
      Width = 75
      Height = 25
      Caption = 'AR 16:9'
      TabOrder = 11
      OnClick = Button4Click
    end
    object Button1: TButton
      Left = 3
      Top = 32
      Width = 75
      Height = 25
      Caption = 'IsPlay Base'
      TabOrder = 12
      OnClick = Button1Click
    end
    object Button5: TButton
      Left = 513
      Top = 33
      Width = 75
      Height = 25
      Caption = 'Mute'
      TabOrder = 13
      OnClick = Button5Click
    end
    object SpinEdit1: TSpinEdit
      Left = 465
      Top = 5
      Width = 43
      Height = 22
      MaxValue = 200
      MinValue = 0
      TabOrder = 14
      Value = 0
      OnChange = SpinEdit1Change
    end
    object BtnOpen: TButton
      Left = 246
      Top = 31
      Width = 75
      Height = 27
      Caption = 'Open && Play'
      TabOrder = 15
      OnClick = BtnOpenClick
    end
    object EdtDelay: TSpinEdit
      Left = 193
      Top = 35
      Width = 50
      Height = 22
      Increment = 500
      MaxValue = 10000
      MinValue = 0
      TabOrder = 16
      Value = 2000
    end
    object Button6: TButton
      Left = 332
      Top = 33
      Width = 93
      Height = 27
      Caption = 'Play Base URL'
      TabOrder = 17
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 594
      Top = 34
      Width = 75
      Height = 25
      Caption = 'SetLogo'
      TabOrder = 18
      OnClick = Button7Click
    end
    object SpinEdit2: TSpinEdit
      Left = 464
      Top = 33
      Width = 43
      Height = 22
      MaxValue = 200
      MinValue = 0
      TabOrder = 19
      Value = 0
      OnChange = SpinEdit2Change
    end
  end
  object MmoOptBase: TMemo
    Left = 394
    Top = 18
    Width = 369
    Height = 187
    Anchors = [akTop, akRight]
    Lines.Strings = (
      
        ':sout=#duplicate{dst=std{access=http,mux=ts,dst=192.168.0.3:3133' +
        '9} '
      ':sout-keep'
      ':sout-all'
      ':udp-caching=200'
      ':high-priority'
      ':sout-ts-es-id-pid'
      ':ts-es-id-pid'
      ':http-reconnect'
      ':http-caching=1500')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object MmoOptPlay: TMemo
    Left = 394
    Top = 222
    Width = 371
    Height = 193
    Anchors = [akTop, akRight]
    Lines.Strings = (
      ':deinterlace=1'
      ':video-filter=adjust'
      ':contrast=1.000'
      ':brightness=1.000'
      ':hue=0'
      ':saturation=1.000'
      ':gamma=1.000'
      ':deinterlace-mode=mean'
      ':vout='
      ':high-priority'
      ':input-record-path='
      ':http-caching=1500'
      ':aspect-ratio=default'
      ':crop=default'
      ':no-fullscreen'
      ':no-video-title-show')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 207
    Width = 387
    Height = 230
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    object Label2: TLabel
      Left = 6
      Top = 184
      Width = 49
      Height = 13
      Caption = 'Base URL'
    end
    object Label4: TLabel
      Left = 6
      Top = 208
      Width = 45
      Height = 13
      Caption = 'Play URL'
    end
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 385
      Height = 175
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
    end
    object EdtURLBase: TEdit
      Left = 63
      Top = 181
      Width = 317
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'http://192.168.0.111:31339/0,0x002F,0x00A7,0x0088'
    end
    object EdtUrlPlay: TEdit
      Left = 63
      Top = 205
      Width = 317
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Text = 'http://192.168.0.3:31339'
    end
  end
  object Button8: TButton
    Left = 769
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Set Marquee'
    TabOrder = 5
    OnClick = Button8Click
  end
  object TimerLog: TTimer
    Enabled = False
    Interval = 10
    OnTimer = TimerLogTimer
    Left = 576
    Top = 298
  end
  object MainMenu1: TMainMenu
    Left = 519
    Top = 298
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
    Left = 474
    Top = 411
  end
end
