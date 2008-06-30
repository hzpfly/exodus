unit ContactActions;

interface

uses Exodus_TLB, ExActions;

type
    TAddContactAction = class(TExBaseAction)
    private
        constructor Create;

    public
        procedure execute(const items: IExodusItemList); override;
        
    end;

    TSendContactsAction = class(TExBaseAction)
    private
        constructor Create;

    public
        procedure execute(const items: IExodusItemList); override;
        
    end;
    TBlockContactAction = class(TExBaseAction)
    private
        constructor Create;

    public
        procedure execute(const items: IExodusItemList); override;
        
    end;
    TUnblockContactAction = class(TExBaseAction)
    private
        constructor Create;

    public
        procedure execute(const items: IExodusItemList); override;
        
    end;

implementation

uses Classes, ExActionCtrl, ExUtils, gnugettext, JabberID, SelectItem,
    Session, RosterAdd;

procedure ToggleBlockState(item: IExodusItem; block: Boolean);
var
    jid: TJabberID;
    subitems: IExodusItemList;
    idx: Integer;
begin
    if (item.Type_ = 'group') then begin
        subitems := MainSession.ItemController.GetGroupItems(item.UID);
        for idx := 0 to subitems.Count - 1 do
            ToggleBlockState(subitems.Item[idx], block);
    end
    else if (item.Type_ = 'contact') then begin
        jid := TJabberID.Create(item.UID);
        if block then
            MainSession.Block(jid)
        else
            MainSession.UnBlock(jid);
        jid.Free();
    end;
end;

constructor TAddContactAction.Create;
begin
    inherited Create('{000-exodus.googlecode.com}-000-add-contact');

    Set_Caption(_('Add Contact'));
    Set_Enabled(true);
end;
procedure TAddContactAction.execute(const items: IExodusItemList);
begin
    ShowAddContact();
end;

constructor TSendContactsAction.Create;
begin
    inherited Create('{000-exodus.googlecode.com}-060-send-contacts');

    Set_Caption(_('Send contacts to...'));
    Set_Enabled(true);
end;

procedure TSendContactsAction.execute(const items: IExodusItemList);
var
    idx: Integer;
    item: IExodusItem;
    subjects: TList;
    target: Widestring;
begin

    target := SelectUIDByType('contact', _('Select Contacts Recipient'));
    if (target <> '') then begin
        subjects := TList.Create;

        for idx := 0 to items.Count - 1 do begin
            item := items.Item[idx];
            subjects.Add(Pointer(item));
        end;

        jabberSendRosterItems(target, subjects);
    end;
end;

{
}
constructor TBlockContactAction.Create;
begin
    inherited Create('{000-exodus.googlecode.com}-080-block-contact');

    Set_Caption(_('Block'));
    Set_Enabled(true);
end;

procedure TBlockContactAction.execute(const items: IExodusItemList);
var
    idx: Integer;
begin
    for idx := 0 to items.Count - 1 do begin
        ToggleBlockState(items.Item[idx], true);
    end;
end;

{
}
constructor TUnblockContactAction.Create;
begin
    inherited Create('{000-exodus.googlecode.com}-080-unblock-contact');

    Set_Caption(_('Unblock'));
    Set_Enabled(true);
end;

procedure TUnblockContactAction.execute(const items: IExodusItemList);
var
    idx: Integer;
begin
    for idx := 0 to items.Count - 1 do begin
        ToggleBlockState(items.Item[idx], false);
    end;
end;

{
}
procedure RegisterActions();
var
    actCtrl: IExodusActionController;
    act: IExodusAction;
begin
    actCtrl := GetActionController();

    //Setup add contact
    act := TAddContactAction.Create() as IExodusAction;
    actCtrl.registerAction('{create}', act);

    //Setup send contacts
    act := TSendContactsAction.Create() as IExodusAction;
    actCtrl.registerAction('contact', act);

    //Setup block contact
    act := TBlockContactAction.Create() as IExodusAction;
    actCtrl.registerAction('contact', act);
    
    actCtrl.registerAction('group', act);

    //Setup unblock contact
    act := TUnblockContactAction.Create() as IExodusAction;
    actCtrl.registerAction('contact', act);

    actCtrl.registerAction('group', act);
end;


initialization
    RegisterActions();

end.