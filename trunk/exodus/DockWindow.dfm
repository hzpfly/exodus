object frmDockWindow: TfrmDockWindow
  Left = 0
  Top = 0
  Caption = 'frmDockWindow'
  ClientHeight = 398
  ClientWidth = 637
  Color = 13681583
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDockDrop = FormDockDrop
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splAW: TTntSplitter
    Left = 185
    Top = 0
    Height = 398
    ResizeStyle = rsUpdate
  end
  object AWTabControl: TTntPageControl
    Left = 188
    Top = 0
    Width = 449
    Height = 398
    Align = alClient
    DockSite = True
    OwnerDraw = True
    Style = tsButtons
    TabOrder = 0
    OnDockDrop = AWTabControlDockDrop
    OnUnDock = AWTabControlUnDock
  end
  object pnlActivityList: TExGradientPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 398
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    OnDockDrop = FormDockDrop
    GradientProperites.startColor = 13681583
    GradientProperites.endColor = 12495763
    GradientProperites.orientation = gdHorizontal
  end
end
