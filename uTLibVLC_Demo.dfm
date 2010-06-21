object FrmMain: TFrmMain
  Left = 205
  Top = 135
  BorderStyle = bsSingle
  Caption = 'VLC Testsuite'
  ClientHeight = 491
  ClientWidth = 843
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
    Left = 389
    Top = 187
    Width = 64
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'read_bytes: 0'
  end
  object Label3: TLabel
    Left = 391
    Top = 4
    Width = 63
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Base Options'
  end
  object Label6: TLabel
    Left = 391
    Top = 106
    Width = 59
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Play Options'
  end
  object pan_Video: TPanel
    Left = 3
    Top = 2
    Width = 380
    Height = 194
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 0
    OnDblClick = pan_VideoDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 431
    Width = 843
    Height = 60
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label5: TLabel
      Left = 444
      Top = 9
      Width = 15
      Height = 13
      Caption = 'Vol'
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
      Left = 351
      Top = 4
      Width = 75
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
      Caption = 'Audio Track'
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
  end
  object MmoOptBase: TMemo
    Left = 391
    Top = 18
    Width = 427
    Height = 86
    Anchors = [akTop, akRight]
    Lines.Strings = (
      ':sout=#std{access=http,mux=ts,dst=192.168.0.3:31339}'
      ':no-sout-rtp-sap'
      ':no-sout-standard-sap'
      ':sout-keep'
      ':sout-all'
      ':http-caching=1000')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object MmoOptPlay: TMemo
    Left = 391
    Top = 120
    Width = 427
    Height = 67
    Anchors = [akTop, akRight]
    Lines.Strings = (
      ':http-caching=1000'
      ':deinterlace=1'
      ':deinterlace-mode=yadif2x')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 201
    Width = 843
    Height = 230
    Align = alBottom
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
      Width = 841
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
      Width = 773
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'http://192.168.0.6:31339/0,0x002C,0x00A3,0x0068,0x006A'
    end
    object EdtUrlPlay: TEdit
      Left = 63
      Top = 205
      Width = 773
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Text = 'http://192.168.0.3:31339'
    end
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
    Left = 328
    Top = 459
  end
end
