unit Subscribe;
{
    Copyright 2001, Peter Millard

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
    StateForm,
    XMLTag, NodeItem, JabberID,
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, buttonFrame, ExtCtrls, Menus, TntStdCtrls, TntMenus;

type
  TfrmSubscribe = class(TfrmState)
    Label1: TTntLabel;
    chkSubscribe: TTntCheckBox;
    boxAdd: TGroupBox;
    frameButtons1: TframeButtons;
    lblNickname: TTntLabel;
    txtNickname: TTntEdit;
    lblGroup: TTntLabel;
    cboGroup: TTntComboBox;
    PopupMenu1: TTntPopupMenu;
    mnuMessage: TTntMenuItem;
    mnuChat: TTntMenuItem;
    mnuProfile: TTntMenuItem;
    Panel1: TPanel;
    imgIdent: TImage;
    lblJID: TTntLabel;
    Bevel1: TBevel;
    procedure frameButtons1btnOKClick(Sender: TObject);
    procedure frameButtons1btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuMessageClick(Sender: TObject);
    procedure mnuChatClick(Sender: TObject);
    procedure mnuProfileClick(Sender: TObject);
    procedure lblJIDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkSubscribeClick(Sender: TObject);
  private
    { Private declarations }
    _jid: TJabberID;
    _capsid: Widestring;
    _capscb: integer;

  published
    procedure CapsCallback(event: string; tag: TXMLTag);

  public
    { Public declarations }
    procedure setup(jid: TJabberID; ri: TJabberRosterItem; tag: TXMLTag);
    procedure EnableAdd(e: boolean);
  end;

var
  frmSubscribe: TfrmSubscribe;

procedure CloseSubscribeWindows();

{---------------------------------------}
{---------------------------------------}
{---------------------------------------}
implementation
uses
    RosterImages,
    DisplayName,
    Notify,
    JabberConst, JabberUtils, ExUtils, CapsCache, EntityCache, Entity,
    ChatWin, GnuGetText, MsgRecv, Session, Profile, Presence;

var
    _subscribe_windows: TList;

{$R *.DFM}
type
    TShowHandler = class(TDisplayNameListener)
        jid: TJabberID;
        sub: TfrmSubscribe;


        procedure fireOnDisplayNameChange(bareJID: Widestring; displayName: WideString);override;
        procedure getDispNameAndShow(subFrm: TfrmSubscribe; newJID: TJabberID);

        destructor Destroy();override;
    end;

destructor TShowHandler.Destroy();
begin
    jid.Free();
    jid := nil;
    inherited;

end;

procedure TShowHandler.fireOnDisplayNameChange(bareJID: Widestring; displayName: WideString);
begin
    if ((jid <> nil) and (jid.jid = bareJID)) then begin
        sub.txtNickname.Text := displayName;
        sub.ShowDefault(false);
        DoNotify(sub, 'notify_s10n',
                 'Subscription from ' + displayName, RosterTreeImages.Find('key'));
        Self.Free();
    end;
end;

procedure TShowHandler.getDispNameAndShow(subFrm: TfrmSubscribe; newJID: TJabberID);
var
    changePending: boolean;
    dname: WideString;
begin
    jid := TJabberID.Create(newJID);//save jid for later dispname change event
    sub := subFrm;

    //newJID may already be in roster. Force a displayname lookup if needed
    if (Self.ProfileEnabled) then
        dName := Self.getProfileDisplayName(newJID, changePending)
    else
        dname := getDisplayName(newJID, changePending);

    if (not changePending) then begin
        //show now and destroy ourself
        sub.txtNickname.Text := dname;
        sub.ShowDefault(false);
        DoNotify(sub, 'notify_s10n',
                 'Subscription from ' + dname, RosterTreeImages.Find('key'));
        Self.Free();
    end;
end;

{---------------------------------------}
procedure TfrmSubscribe.setup(jid: TJabberID; ri: TJabberRosterItem; tag: TXMLTag);
var
    c: TXMLTag;
    dgrp, id, capid: Widestring;
    e: TJabberEntity;
    idx: integer;
    skipImage: boolean;
    showNow: boolean; //show immediately, goit dispname from roster
begin
    showNow := false;
    _jid := TJabberID.Create(jid);
    lblJID.Caption := DisplayName.getDisplayNameCache().getDisplayJIDBare(_jid);

    chkSubscribe.Checked := true;
    chkSubscribe.Enabled := true;

    if (ri <> nil) then begin
        if ((ri.Subscription = 'to') or (ri.Subscription = 'both')) then begin
            chkSubscribe.Checked := false;
            chkSubscribe.Enabled := false;
        end;
    end;

    EnableAdd(chkSubscribe.Enabled);

    if (chkSubscribe.Enabled) then begin
        MainSession.Roster.AssignGroups(cboGroup.Items);
        dgrp := MainSession.Prefs.getString('roster_default');
        cboGroup.itemIndex := cboGroup.Items.indexOf(dgrp);
        if (ri <> nil) then begin
            txtNickName.Text := ri.Text;
//            showNow := true;
            if (ri.GroupCount > 0) then
                cboGroup.itemIndex := cboGroup.Items.indexof(ri.Group[0]);
        end;
    end;

    idx := -1;
    skipImage := false;
    c := tag.QueryXPTag('/presence/c[@xmlns="' + XMLNS_CAPS + '"]');
    if (c <> nil) then begin
        capid := c.GetAttribute('node') + '#' + c.getAttribute('ver');
        e := jCapsCache.find(capid);
        if (e <> nil) then begin

            // make sure we're not waiting for caps
            if (not e.hasInfo) then begin
                // bail out early so we leave the image empty
                _capsid := capid;
                _capscb := MainSession.RegisterCallback(CapsCallback, '/session/caps');
                skipImage := true;
            end
            else if (e.IdentityCount > 0) then begin
                // use the first identity we find, and get the image
                id := e.Identities[0].Name;
                idx := RosterTreeImages.Find('identity#' + id);
            end;
        end;
    end;

    if (not skipImage) then begin
        if (idx = -1) then
            idx := RosterTreeImages.Find('available');

        if (idx >= 0) then
            RosterTreeImages.GetImage(idx, imgIdent);
    end;

    if (showNow) then begin
        ShowDefault(false);
        DoNotify(Self, 'notify_s10n',
                 'Subscription from ' + txtNickName.Text, RosterTreeImages.Find('key'));
    end
    else
        TShowHandler.Create().getDispNameAndShow(Self, jid);
end;

{---------------------------------------}
procedure TfrmSubscribe.CapsCallback(event: string; tag: TXMLTag);
var
    idx: integer;
    id: Widestring;
    e: TJabberEntity;
begin
    if (tag.GetAttribute('capsid') = _capsid) then begin
        e := jCapsCache.find(_capsid);
        assert(e <> nil);
        assert(e.hasInfo);

        if (e.IdentityCount > 0) then begin
            id := e.Identities[0].Name;
            idx := RosterTreeImages.Find('identity#' + id);

            if (idx >= 0) then
                RosterTreeImages.GetImage(idx, imgIdent);
        end;

        MainSession.UnRegisterCallback(_capscb);
        _capscb := -1;
    end;
end;

{---------------------------------------}
procedure TfrmSubscribe.frameButtons1btnOKClick(Sender: TObject);
var
    sjid, snick, sgrp: string;
    p1: TJabberPres;

begin
    // send a subscribed and possible add..
    sjid := _jid.full();
    snick := txtNickname.Text;
    sgrp := cboGroup.Text;

    p1 := TJabberPres.Create;
    p1.toJID := TJabberID.Create(sjid);
    p1.PresType := 'subscribed';
    MainSession.SendTag(p1);

    // do an iq-set
    if chkSubscribe.Checked then
        MainSession.Roster.AddItem(sjid, snick, sgrp, true);
    Self.Close;
end;

{---------------------------------------}
procedure TfrmSubscribe.frameButtons1btnCancelClick(Sender: TObject);
var
    p: TJabberPres;
    sjid: string;
begin
    sjid := _jid.full();
    p := TJabberPres.Create;
    p.toJID := TJabberID.Create(sjid);
    p.PresType := 'unsubscribed';

    MainSession.SendTag(p);
    Self.Close;
end;

{---------------------------------------}
procedure TfrmSubscribe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

{---------------------------------------}
procedure TfrmSubscribe.mnuMessageClick(Sender: TObject);
begin
    StartMsg(_jid.full());
end;

{---------------------------------------}
procedure TfrmSubscribe.mnuChatClick(Sender: TObject);
begin
    StartChat(_jid.full(), '', true);
end;

{---------------------------------------}
procedure TfrmSubscribe.mnuProfileClick(Sender: TObject);
begin
    // muh.  not exactly right, but at least it isn't *wrong*.
    ShowProfile(_jid.full()).FormStyle := fsStayOnTop;
end;

{---------------------------------------}
procedure TfrmSubscribe.lblJIDClick(Sender: TObject);
var
    cp: TPoint;
begin
    GetCursorPos(cp);
    PopupMenu1.popup(cp.x, cp.y);
end;

{---------------------------------------}
procedure TfrmSubscribe.FormCreate(Sender: TObject);
begin
    inherited;
    AssignUnicodeFont(Self);
    TranslateComponent(Self);
    _subscribe_windows.Add(Self);
    _capscb := -1;
    MainSession.Roster.AssignGroups(cboGroup.Items);
    cboGroup.Text := MainSession.Prefs.getString('roster_default');
end;

{---------------------------------------}
procedure TfrmSubscribe.FormDestroy(Sender: TObject);
var
    idx: integer;
begin
    idx := _subscribe_windows.IndexOf(Self);
    if (idx > -1) then
        _subscribe_windows.Delete(idx);

    if ((_capscb <> -1) and (MainSession <> nil)) then
        MainSession.UnRegisterCallback(_capscb);

    if (_jid <> nil) then
        _jid.Free();
end;

{---------------------------------------}
procedure TfrmSubscribe.EnableAdd(e: boolean);
begin
    lblNickname.Enabled := e;
    txtNickname.Enabled := e;
    cboGroup.Enabled := e;
    lblGroup.Enabled := e;
end;

{---------------------------------------}
procedure TfrmSubscribe.chkSubscribeClick(Sender: TObject);
begin
    EnableAdd(chkSubscribe.Checked);
end;

{---------------------------------------}
{---------------------------------------}
{---------------------------------------}
procedure CloseSubscribeWindows();
var
    i: integer;
begin
    for i := 0 to _subscribe_windows.Count - 1 do
        TfrmSubscribe(_subscribe_windows[i]).Close();
end;

initialization
    _subscribe_windows := TList.Create();

finalization
    _subscribe_windows.Free();

end.