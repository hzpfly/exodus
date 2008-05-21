unit SelectItem;
{
    Copyright 2008, Estate of Peter Millard

    This file is part of Exodus.

    Exodus is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Exodus is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Exodus; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, ComCtrls, ExForm,
  Forms, ExTreeView, Exodus_TLB, Dialogs, ExtCtrls, StdCtrls, TntStdCtrls,
  Menus, TntMenus, ExGradientPanel, SClrRGrp;

type
  TfrmSelectItem = class;

  TTypedTreeView = class(TExTreeView)
  private
    _online: Boolean;
    _itemtype: Widestring;

    constructor Create(AOwner: TfrmSelectItem; Session: TObject);

    procedure SetShowOnline(flag: Boolean);
    procedure SetItemType(itemtype: Widestring);

  protected
    procedure SaveGroupsState(); override;
    function FilterItem(item: IExodusItem): Boolean; override;

  public
    destructor Destroy; override;

    procedure DblClick; override;

    property ShowOnline: Boolean read _online write SetShowOnline;
    property ItemType: Widestring read _itemtype write SetItemType;
  end;

  TfrmSelectItem = class(TExForm)
    pnlInput: TPanel;
    pnlActions: TPanel;
    pnlSelect: TPanel;
    pnlEntry: TPanel;
    btnCancel: TTntButton;
    btnOK: TTntButton;
    txtJID: TTntEdit;
    lblJID: TTntLabel;
    popSelected: TTntPopupMenu;
    mnuShowOnline: TTntMenuItem;
    ColorBevel1: TColorBevel;
    
    procedure FormCreate(Sender: TObject);

    procedure ItemChanged(Sender: TObject; Node: TTreeNode);
    procedure mnuShowOnlineClick(Sender: TObject);
    procedure txtJIDChange(Sender: TObject);

  private
    { Private declarations }

  protected
    { Protected declarations }
    _itemType: Widestring;
    _selectedUID: Widestring;
    _itemView: TTypedTreeView;

    constructor Create(AOwner: TComponent; itemtype: Widestring);

  public
    { Public declarations }
    destructor Destroy; override;

    Property ItemType: Widestring read _itemType;
    Property SelectedUID: Widestring read _selectedUID;

  end;

function SelectUIDByType(itemtype: Widestring; title: Widestring = ''): Widestring;


implementation

uses
    gnugettext,
    Session,
    JabberID,
    COMExodusItem;

{$R *.dfm}

function SelectUIDByType(itemtype: Widestring; title: Widestring): Widestring;
var
    selector: TfrmSelectItem;
begin
    Result := '';
    selector := TfrmSelectItem.Create(nil, itemtype);
    if (title <> '') then
        selector.Caption := title;

    if (selector.ShowModal = mrOk) then begin
        Result := selector.SelectedUID;
    end;

    selector.Free;
end;

constructor TTypedTreeView.Create(AOwner: TfrmSelectItem; Session: TObject);
begin
    inherited Create(AOwner, Session);
end;
destructor TTypedTreeView.Destroy;
begin
    inherited;
end;

procedure TTypedTreeView.SetShowOnline(flag: Boolean);
begin
    if (flag <> _online) then begin
        _online := flag;

        if not (csLoading in ComponentState) and (Parent <> nil) then
            Refresh();
    end;
end;
procedure TTypedTreeView.SetItemType(itemtype: WideString);
begin
    if (itemtype <> _itemtype) then begin
        _itemtype := itemtype;

        if not (csLoading in ComponentState) and (Parent <> nil) then
            Refresh();
    end;
end;

procedure TTypedTreeView.SaveGroupsState;
begin
    //DO NOTHING!
end;
function TTypedTreeView.FilterItem(item: IExodusItem): Boolean;
begin
    Result := Item.IsVisible or (not ShowOnline);
    if Result then begin
        Result := (ItemType = '') or (item.Type_ = 'group') or (ItemType = item.Type_);
    end;
end;

procedure TTypedTreeView.DblClick;
begin
    if (Selected = nil) or (IExodusItem(Selected.Data).Type_ = EI_TYPE_GROUP) then begin
        inherited;
        exit;
    end;

    with TfrmSelectItem(Owner) do begin
        ItemChanged(Self, Selected);
        ModalResult := mrOk;
        Hide;
    end;
end;

{
}
constructor TfrmSelectItem.Create(AOwner: TComponent; itemtype: Widestring);
begin
    inherited Create(AOwner);

    _itemtype := itemtype;
    _selectedUID := '';
end;

destructor TfrmSelectItem.Destroy;
begin
    _itemView.Free;
    _itemView := nil;

    inherited;
end;

procedure TfrmSelectItem.FormCreate(Sender: TObject);
begin
    inherited;

    Self.Caption := _(Self.Caption + ' ' + _itemtype);

    _itemView := TTypedTreeView.Create(Self, MainSession);
    _itemView.ItemType := _itemtype;
    _itemView.Parent := pnlSelect;
    _itemView.MultiSelect := false;
    _itemView.Align := alClient;
    _itemView.AlignWithMargins := false;
    _itemView.OnChange := ItemChanged;
    _itemView.PopupMenu := popSelected;
    _itemView.BorderStyle := bsSingle;
    with MainSession.Prefs do begin
        _itemView.Font.Name := getString('roster_font_name');
        _itemView.Font.Size := getInt('roster_font_size');
        _itemView.Font.Color := TColor(getInt('roster_font_color'));
        _itemView.Font.Charset := getInt('roster_font_charset');
        _itemView.ShowOnline := getBool('roster_only_online');
    end;
    mnuShowOnline.Checked := _itemView.ShowOnline;

    _itemView.Refresh;
end;

procedure TfrmSelectItem.ItemChanged(Sender: TObject; Node: TTreeNode);
var
    item: IExodusItem;
    valid: Boolean;
begin
    if (Node = nil) then exit;
    
    valid := (IExodusItem(Node.Data).Type_ = _itemtype);
    if not valid then begin
        _selectedUID := '';
        txtJID.text := '';
    end
    else begin
        item := IExodusItem(Node.Data);
        _selectedUID := item.UID;
        txtJID.text := item.UID;
    end;

    btnOK.Enabled := valid;
end;

procedure TfrmSelectItem.mnuShowOnlineClick(Sender: TObject);
begin
    mnuShowOnline.Checked := not mnuShowOnline.Checked;
    _itemView.ShowOnline := mnuShowOnline.Checked;
end;

procedure TfrmSelectItem.txtJIDChange(Sender: TObject);
begin
    inherited;

    if (isValidJID(txtJID.Text, false)) then begin
        _selectedUID := txtJID.Text;
        btnOK.Enabled := true;
    end
    else begin
        btnOK.Enabled := false;
    end;
end;



end.