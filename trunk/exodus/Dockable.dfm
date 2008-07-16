inherited frmDockable: TfrmDockable
  Caption = 'frmDockable'
  ClientWidth = 251
  DragKind = dkDock
  DragMode = dmAutomatic
  KeyPreview = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnDragDrop = OnDockedDragDrop
  OnDragOver = OnDockedDragOver
  OnKeyDown = FormKeyDown
  ExplicitWidth = 259
  PixelsPerInch = 120
  TextHeight = 16
  object pnlDock: TTntPanel
    Left = 0
    Top = 0
    Width = 251
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object pnlDockTopContainer: TTntPanel
      Left = 0
      Top = 0
      Width = 251
      Height = 34
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object tbDockBar: TToolBar
        AlignWithMargins = True
        Left = 202
        Top = 3
        Width = 46
        Height = 28
        Align = alRight
        AutoSize = True
        EdgeInner = esNone
        EdgeOuter = esNone
        HideClippedButtons = True
        Images = frmExodus.ImageList1
        TabOrder = 0
        Transparent = True
        Wrapable = False
        object btnDockToggle: TToolButton
          AlignWithMargins = True
          Left = 0
          Top = 0
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = True
          Caption = 'btnDockToggle'
          ImageIndex = 82
          OnClick = btnDockToggleClick
        end
        object btnCloseDock: TToolButton
          AlignWithMargins = True
          Left = 23
          Top = 0
          Hint = 'Close this tab'
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = True
          Caption = 'btnCloseDock'
          ImageIndex = 83
          OnClick = btnCloseDockClick
        end
      end
      object pnlDockTop: TTntPanel
        Left = 0
        Top = 0
        Width = 199
        Height = 34
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
      end
    end
    object pnlDockControlSite: TTntPanel
      Left = 0
      Top = 34
      Width = 251
      Height = 7
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
    end
  end
end
