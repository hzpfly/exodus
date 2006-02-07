unit COMRosterImages;
{
    Copyright 2006, Peter Millard

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

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
    Classes, IdCoderMime, Graphics, 
    ComObj, ActiveX, ExodusCOM_TLB, StdVcl;

type
  TExodusRosterImages = class(TAutoObject, IExodusRosterImages)
  protected
    function AddImageBase64(const id, base64: WideString): Integer; safecall;
    function AddImageFilename(const id, filename: WideString): Integer;
      safecall;
    function AddImageResource(const id: WideString; instance,
      res_id: Integer): Integer; safecall;
    function Find(const id: WideString): Integer; safecall;
    procedure Remove(const id: WideString); safecall;

  private
    _base64: TIdDecoderMime;
    _bmp: TBitmap;
    _mem: TMemoryStream;

  public
    constructor Create();
    destructor Destroy(); override;

  end;

{---------------------------------------}
{---------------------------------------}
{---------------------------------------}
implementation

uses
    RosterImages, ComServ;

{---------------------------------------}
constructor TExodusRosterImages.Create();
begin
    _base64 := TIdDecoderMime.Create(nil);
    _bmp := TBitmap.Create();
    _mem := TMemoryStream.Create();
end;

{---------------------------------------}
destructor TExodusRosterImages.Destroy();
begin
    _base64.free();
    _bmp.free();
    _mem.free();
end;

{---------------------------------------}
function TExodusRosterImages.AddImageBase64(const id,
  base64: WideString): Integer;
var
    idx: integer;
begin
    idx := RosterTreeImages.Find(id);
    if (idx >= 0) then begin
        Result := idx;
        exit;
    end;

    // decode data into a bitmap
    _mem.Clear();
    _mem.Position := 0;

    _base64.DecodeToStream(base64, _mem);
    _mem.Position := 0;

    _bmp.LoadFromStream(_mem);
    Result := RosterTreeImages.AddImage(id, _bmp);
end;

{---------------------------------------}
function TExodusRosterImages.AddImageFilename(const id,
  filename: WideString): Integer;
var
    idx: integer;
begin
    idx := RosterTreeImages.Find(id);
    if (idx >= 0) then begin
        Result := idx;
        exit;
    end;

    _bmp.LoadFromFile(filename);
    Result := RosterTreeImages.AddImage(id, _bmp);
end;

{---------------------------------------}
function TExodusRosterImages.AddImageResource(const id: WideString;
  instance, res_id: Integer): Integer;
var
    idx: integer;
begin
    idx := RosterTreeImages.Find(id);
    if (idx >= 0) then begin
        Result := idx;
        exit;
    end;

    _bmp.LoadFromResourceID(instance, res_id);
    Result := RosterTreeImages.AddImage(id, _bmp);
end;

{---------------------------------------}
function TExodusRosterImages.Find(const id: WideString): Integer;
begin
    Result := RosterTreeImages.Find(id);
end;

{---------------------------------------}
procedure TExodusRosterImages.Remove(const id: WideString);
begin
    RosterTreeImages.Remove(id);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TExodusRosterImages, Class_ExodusRosterImages,
    ciMultiInstance, tmApartment);
end.
