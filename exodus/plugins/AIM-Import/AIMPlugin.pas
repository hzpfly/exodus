unit AIMPlugin;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
    ExodusCOM_TLB,
    ComObj, ActiveX, AIMImport_TLB, StdVcl;

type
  TAIMImportPlugin = class(TAutoObject, IAIMImportPlugin, IExodusPlugin)
  protected
    procedure menuClick(const ID: WideString); safecall;
    procedure NewChat(const jid: WideString; const Chat: IExodusChat);
      safecall;
    procedure NewRoom(const jid: WideString; const Room: IExodusChat);
      safecall;
    procedure Process(const xml: WideString); safecall;
    procedure Shutdown; safecall;
    procedure Startup(const ExodusController: IExodusController); safecall;
    { Protected declarations }
  private
    _controller: IExodusController;
    _menu_id: Widestring;
  end;

implementation

uses
    Importer,
    Dialogs, ComServ;

procedure TAIMImportPlugin.menuClick(const ID: WideString);
var
    f: TfrmImport;
begin
    if (id = _menu_id) then begin
        // make sure we are online..
        if (_controller.Connected = false) then begin
            MessageDlg('You must be connected before trying to import a AIM Buddy List.',
                mtError, [mbOK], 0);
            exit;
        end;

        f := TfrmImport.Create(nil);
        f.exodus := _controller;
        f.Show;
    end;
end;

procedure TAIMImportPlugin.NewChat(const jid: WideString;
  const Chat: IExodusChat);
begin

end;

procedure TAIMImportPlugin.NewRoom(const jid: WideString;
  const Room: IExodusChat);
begin

end;

procedure TAIMImportPlugin.Process(const xml: WideString);
begin

end;

procedure TAIMImportPlugin.Shutdown;
begin
    
end;

procedure TAIMImportPlugin.Startup(
  const ExodusController: IExodusController);
begin
    _controller := ExodusController;
    _menu_id := _controller.addPluginMenu('Import AIM Roster');
end;

initialization
  TAutoObjectFactory.Create(ComServer, TAIMImportPlugin, Class_AIMImportPlugin,
    ciMultiInstance, tmApartment);
end.
