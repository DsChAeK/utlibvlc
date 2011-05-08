object FrmMain: TFrmMain
  Left = 111
  Top = 141
  BorderStyle = bsSingle
  Caption = 'VLC Testsuite'
  ClientHeight = 504
  ClientWidth = 700
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
    Left = 382
    Top = 358
    Width = 64
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'read_bytes: 0'
  end
  object Label3: TLabel
    Left = 382
    Top = 2
    Width = 63
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Base Options'
  end
  object Label6: TLabel
    Left = 382
    Top = 156
    Width = 59
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Play Options'
  end
  object pan_Video: TPanel
    Left = 3
    Top = 2
    Width = 374
    Height = 229
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 0
    OnDblClick = pan_VideoDblClick
  end
  object Panel1: TPanel
    Left = 2
    Top = 442
    Width = 700
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
    object BtnTrack: TButton
      Left = 514
      Top = 3
      Width = 75
      Height = 27
      Caption = 'Audio Tracks'
      TabOrder = 5
      OnClick = BtnTrackClick
    end
    object Button2: TButton
      Left = 84
      Top = 32
      Width = 75
      Height = 25
      Caption = 'IsPlay Play'
      TabOrder = 6
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 3
      Top = 32
      Width = 75
      Height = 25
      Caption = 'IsPlay Base'
      TabOrder = 7
      OnClick = Button1Click
    end
    object Button5: TButton
      Left = 513
      Top = 33
      Width = 75
      Height = 25
      Caption = 'Mute'
      TabOrder = 8
      OnClick = Button5Click
    end
    object SpinEdit1: TSpinEdit
      Left = 465
      Top = 5
      Width = 43
      Height = 22
      MaxValue = 200
      MinValue = 0
      TabOrder = 9
      Value = 0
      OnChange = SpinEdit1Change
    end
    object BtnOpen: TButton
      Left = 246
      Top = 31
      Width = 75
      Height = 27
      Caption = 'Open && Play'
      TabOrder = 10
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
      TabOrder = 11
      Value = 2000
    end
    object Button6: TButton
      Left = 332
      Top = 33
      Width = 93
      Height = 27
      Caption = 'Play Base URL'
      TabOrder = 12
      OnClick = Button6Click
    end
    object SpinEdit2: TSpinEdit
      Left = 464
      Top = 33
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
    Left = 382
    Top = 16
    Width = 311
    Height = 133
    Anchors = [akTop, akRight]
    Lines.Strings = (
      ':sout=#http{mux=ts,dst=192.168.0.5:31339}'
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
    Left = 382
    Top = 170
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 234
    Width = 377
    Height = 207
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    object Label2: TLabel
      Left = 6
      Top = 159
      Width = 49
      Height = 13
      Caption = 'Base URL'
    end
    object Label4: TLabel
      Left = 6
      Top = 183
      Width = 45
      Height = 13
      Caption = 'Play URL'
    end
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 375
      Height = 134
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
      Top = 156
      Width = 307
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'http://192.168.0.111:31339/0,0x002C,0x00A3,0x0068,0x006A'
    end
    object EdtUrlPlay: TEdit
      Left = 63
      Top = 180
      Width = 307
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Text = 'http://192.168.0.5:31339'
    end
  end
  object Button8: TButton
    Left = 615
    Top = 382
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Set Marquee'
    TabOrder = 5
    OnClick = Button8Click
  end
  object BtnFullscreen: TButton
    Left = 382
    Top = 381
    Width = 75
    Height = 27
    Anchors = [akRight, akBottom]
    Caption = 'Fullscreen'
    TabOrder = 6
    OnClick = BtnFullscreenClick
  end
  object Button7: TButton
    Left = 382
    Top = 412
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'SetLogo'
    TabOrder = 7
    OnClick = Button7Click
  end
  object BtnSnapshot: TButton
    Left = 460
    Top = 381
    Width = 75
    Height = 27
    Anchors = [akRight, akBottom]
    Caption = 'Snapshot'
    TabOrder = 8
    OnClick = BtnSnapshotClick
  end
  object BtnDeinterlace: TButton
    Left = 460
    Top = 411
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Deinterlace'
    TabOrder = 9
    OnClick = BtnDeinterlaceClick
  end
  object Button3: TButton
    Left = 538
    Top = 381
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Crop 4:3'
    TabOrder = 10
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 538
    Top = 410
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'AR 16:9'
    TabOrder = 11
    OnClick = Button4Click
  end
  object MainMenu1: TMainMenu
    Left = 653
    Top = 296
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
end
