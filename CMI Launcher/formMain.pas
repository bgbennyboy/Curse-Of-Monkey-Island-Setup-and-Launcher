{
******************************************************
  Curse of Monkey Island Launcher
  Copyright (c) 2002-2008 Bgbennyboy
  Http://quick.mixnmojo.com
******************************************************
}
{
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

{
BEFORE RELEASE:
    DISABLE ReportMemoryLeaksOnShutdown in project .dpr
    Change build configuration from debug to release
    Update readme
    Replace readme in MainResources with new one
    Compress with UPX
}


unit formMain;

interface

uses
  Windows, Classes, Forms, Messages, SysUtils, Controls, ComCtrls, ExtCtrls,
  Math, Dialogs, Jpeg,
  JCLFileUtils, JCLRegistry, JCLShell,
  AdvGlowButton,
  uVistaFuncs,
  uCMIUtils, uCMIConst;

type
  TfrmMain = class(TForm)
    ImageMain: TImage;
    StatusBar1: TStatusBar;
    Bevel1: TBevel;
    btnWindowed: TAdvGlowButton;
    btnPlay: TAdvGlowButton;
    btnReadmeLEC: TAdvGlowButton;
    btnReadmeLauncher: TAdvGlowButton;
    btnOptions: TAdvGlowButton;
    procedure btnPlayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnWindowedClick(Sender: TObject);
    procedure btnReadmeLecClick(Sender: TObject);
    procedure btnReadmeLauncherClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    strTempReadMeName: string;
    procedure ChooseImage;
    procedure UpdateStatusBar;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

const
  crCursor1 = 1;
  crCursor2 = 2;

implementation

uses formOptions;

{$R *.dfm}
{$R MainResources.res}
{$R UAC.res}

procedure TfrmMain.UpdateStatusBar;
begin
  if GetHDRun then
    statusbar1.SimpleText:=strStatusRunFromHd
  else
    statusbar1.SimpleText:=strStatusRunFromCd + Copy(GetCdPath, 0, 1);
end;

//Load Jpeg from .res
function GetResourceAsJpeg(const ResName: string): TJPEGImage;
var
  resStream: TResourceStream;
begin
  resStream := TResourceStream.Create(hInstance, ResName, 'JPEG');
  try
    Result := TJPEGImage.Create;
    Result.LoadFromStream(resStream);
  finally
    resStream.Free;
  end;
end;

//Choose image
procedure TfrmMain.ChooseImage;
var
  Jpg: TJPEGImage;
  i: integer;
begin
  Randomize;
  i:=RandomRange(1,7);

  Jpg:=getresourceasjpeg('CMI' + inttostr(i));
  try
    ImageMain.Picture.Bitmap.Assign(Jpg);
  finally
    Jpg.Free;
  end;
end;

//Form create actions
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //Set vista fonts if necessary
  SetDesktopIconFonts(Self.Font);

  CreateDefaultRegKeys;

  if GetCMIpath='' then
    showmessage(strRegKeysNotFound);

  Screen.Cursors[crCursor1] := LoadCursor(hInstance, 'CURSOR1'); //Load cursor from resource file
  frmMain.Cursor:=crCursor1; //Set cursor as main cursor
  screen.Cursors[crHandpoint]:=LoadCursor(hInstance, 'CURSOR2'); //Load cursor from resource file as crhandpoint cursor type

  ChooseImage;

  //Getting the temp file name also seems to create it, so rename it to html for the readme
  strTempReadMeName:=FileGetTempName('CM1');
  RenameFile(strTempReadMeName, strTempReadMeName + '.html');
  strTempReadMeName:=strTempReadMeName + '.html';


  {Check - if run from hard drive, then make sure all files are there - if they arent then disable
           running from hd.}
  if GetHDRun then
    if GetAllFilesOnHd=false then
      regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\CMI Launcher', 'hdrun', 0);

  UpdateStatusBar;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //Remove the temporary file if it was created
  if FileExists(strTempReadMeName) then
    DeleteFile(strTempReadMeName);
end;

//Play Fullscreen Button Click
procedure TfrmMain.btnPlayClick(Sender: TObject);
begin
  if GetHDRun then
    ShellExec(0, 'open', GetCMIpath + 'COMI.EXE', '', GetCMIPath, SW_NORMAL)
  else
    ShellExec(0, 'open', GetCMIpath + 'COMI.EXE', '', GetCDPath, SW_NORMAL);

  if GetCloseOnRun then
    Close;
end;

//Play Windowed Button Click
procedure TfrmMain.btnWindowedClick(Sender: TObject);
begin
  if GetHDRun then
    ShellExec(0, 'open', GetCMIpath + 'COMI.EXE', 'g', GetCMIPath, SW_NORMAL)
  else
    ShellExec(0, 'open', GetCMIpath + 'COMI.EXE', 'g', GetCDPath, SW_NORMAL);

  if GetCloseOnRun then
    Close;
end;

//ReadMe Lec Button Click
procedure TfrmMain.btnReadmeLecClick(Sender: TObject);
begin
  ShellExec(0, 'open', GetCMIPath + 'Readme.txt', '', '', SW_NORMAL);
end;

//ReadMe Launcher Button Click
procedure TfrmMain.btnReadmeLauncherClick(Sender: TObject);
var
  resStream: TResourceStream;
begin
  if strTempReadMeName = '' then exit;

  resStream:=TResourceStream.Create(0, 'README', 'TEXT');
  try
    resStream.SaveToFile(strTempReadMeName);
    ShellExec(0,'open', strTempReadMeName, '', ExtractFilePath(strTempReadMeName), SW_NORMAL);
  finally
    resStream.Free;
  end;
end;

//Options Button Click
procedure TfrmMain.btnOptionsClick(Sender: TObject);
begin
  frmOptions.showmodal;
  
  UpdateStatusBar;
end;


end.
