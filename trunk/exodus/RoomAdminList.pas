unit RoomAdminList;
{
    Copyright 2002, Peter Millard

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
    XMLTag,
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, buttonFrame, StdCtrls, ExtCtrls, CheckLst, ComCtrls;

type
  TfrmRoomAdminList = class(TForm)
    frameButtons1: TframeButtons;
    Splitter1: TSplitter;
    Label1: TLabel;
    memNew: TMemo;
    lstItems: TListView;
    procedure frameButtons1btnOKClick(Sender: TObject);
    procedure frameButtons1btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  published
    procedure listAdminCallback(event: string; tag: TXMLTag);
  private
    { Private declarations }
    room_jid: Widestring;
    role: bool;
    onList: Widestring;
    offList: Widestring;
  public
    { Public declarations }
    procedure Start();
  end;

var
  frmRoomAdminList: TfrmRoomAdminList;

procedure ShowRoomAdminList(room_jid, role, affiliation: WideString);

{---------------------------------------}
{---------------------------------------}
{---------------------------------------}
implementation

uses
    IQ, JabberConst, JabberID, Session, Room;

{$R *.dfm}

{---------------------------------------}
procedure ShowRoomAdminList(room_jid, role, affiliation: WideString);
var
    f: TfrmRoomAdminList;
begin
    //
    f := TfrmRoomAdminList.Create(Application);
    f.room_jid := room_jid;
    if (role <> '') then begin
        f.role := true;
        f.onList := role;
        f.offList := MUC_NONE;
        end
    else begin
        f.role := false;
        f.onList := affiliation;
        f.offList := MUC_NONE;
        end;
    f.Start();
end;

{---------------------------------------}
procedure TfrmRoomAdminList.Start();
var
    iq: TJabberIQ;
    item: TXMLTag;
begin
    //
    iq := TJabberIQ.Create(MainSession, MainSession.generateID(),
        listAdminCallback, 30);
    with iq do begin
        toJid := room_jid;
        Namespace := XMLNS_MUCADMIN;
        iqType := 'get';
        end;

    item := iq.qTag.AddTag('item');
    if (role) then
        item.putAttribute('role', onList)
    else
        item.putAttribute('affiliation', onList);
    iq.Send();

    Show();
end;

{---------------------------------------}
procedure TfrmRoomAdminList.listAdminCallback(event: string; tag: TXMLTag);
var
    li: TListItem;
    i: integer;
    rjid: WideString;
    items: TXMLTagList;
begin
    // callback for list administration
    if event <> 'xml' then exit;
    if tag = nil then exit;

    if ((tag.Name <> 'iq') or (tag.Namespace <> XMLNS_MUCADMIN)) then
        exit;

    rjid := tag.GetAttribute('from');
    items := tag.QueryXPTags('/iq/query/item');

    room_jid := rjid;

    if (items.Count > 0) then begin
        for i := 0 to items.Count - 1 do begin
            li := lstItems.Items.Add();
            li.Caption := items[i].GetAttribute('nick');
            li.SubItems.Add(items[i].GetAttribute('jid'));
            end;
        end;

    items.Free();
end;


{---------------------------------------}
procedure TfrmRoomAdminList.frameButtons1btnOKClick(Sender: TObject);
var
    i: integer;
    tmps, v: Widestring;
    item, q, iq: TXMLTag;
    li: TListItem;
begin
    // submit the new list
    iq := TXMLTag.Create('iq');
    iq.PutAttribute('to', room_jid);
    iq.PutAttribute('id', MainSession.generateID());
    iq.PutAttribute('type', 'set');
    q := iq.AddTag('query');
    q.PutAttribute('xmlns', XMLNS_MUCADMIN);

    for i := 0 to lstItems.Items.Count - 1 do begin
        li := lstItems.Items[i];
        item := q.AddTag('item');
        item.PutAttribute('jid', li.SubItems[0]);
        if (li.Checked) then v := onList else v := offList;
        if (role) then
            item.PutAttribute('role', v)
        else
            item.PutAttribute('affiliation', v);
        end;

    for i := 0 to memNew.Lines.Count - 1 do begin
        tmps := Trim(memNew.Lines[i]);
        if ((tmps <> '') and (isValidJID(tmps))) then begin
            item := q.AddTag('item');
            item.PutAttribute('jid', tmps);
            if (role) then
                item.PutAttribute('role', onList)
            else
                item.PutAttribute('affiliation', onList);
            end;
        end;

    MainSession.SendTag(iq);
    Self.Close();
end;

{---------------------------------------}
procedure TfrmRoomAdminList.frameButtons1btnCancelClick(Sender: TObject);
begin
    Self.Close();
end;

{---------------------------------------}
procedure TfrmRoomAdminList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

end.
