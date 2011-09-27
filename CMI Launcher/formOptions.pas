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

unit formOptions;

interface

uses
  Windows, Messages, Forms, Classes, SysUtils, ImgList, Controls, Dialogs,
  PngImageList,
  JvBaseDlg, JvSHFileOperation, JCLFileUtils, JCLRegistry, JCLShell,
  AdvGlowButton,
  uCMIUtils, uCMIConst;

type
  TfrmOptions = class(TForm)
    JvSHFileOperation1: TJvSHFileOperation;
    btnCloseOnRun: TAdvGlowButton;
    PngImageList1: TPngImageList;
    btnHdRun: TAdvGlowButton;
    btnPatch: TAdvGlowButton;
    btnUnpatch: TAdvGlowButton;

    procedure btnCloseOnRunClick(Sender: TObject);
    procedure btnHdRunClick(Sender: TObject);
    procedure btnPatchClick(Sender: TObject);
    procedure btnUnpatchClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    strTempDebugExeName: string;
    procedure CopyFiles;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

uses formMain;

{$R *.dfm}   

//Form create
procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  //Getting the temp file name also seems to create it, so rename it to .exe for shellexec later
  frmOptions.Cursor:=frmMain.Cursor;
  strTempDebugExeName:=FileGetTempName('CM2');
  RenameFile(strTempDebugExeName, strTempDebugExeName + '.exe');
  strTempDebugExeName:=strTempDebugExeName + '.exe';
end;

procedure TfrmOptions.FormDestroy(Sender: TObject);
begin
  //Remove the temporary file if it was created
  if FileExists(strTempDebugExeName) then
    DeleteFile(strTempDebugExeName);
end;

//Form show
procedure TfrmOptions.FormShow(Sender: TObject);
begin
  if GetCloseOnRun then
  begin
    btnCloseOnRun.ImageIndex:=1;
    btnCloseOnRun.Tag:=1;
  end
  else
  begin
    btnCloseOnRun.ImageIndex:=0;
    btnCloseOnRun.Tag:=0;
  end;

  if GetHDRun then
  begin
    btnHdRun.ImageIndex:=3;
    btnHdRun.Tag:=1
  end
  else
  begin
    btnHdRun.ImageIndex:=2;
    btnHdRun.Tag:=0;
  end;
end;

//Copy files
procedure TfrmOptions.CopyFiles;
var
  S: char;
  boolFound: boolean;
  DlgResult: TModalResult;
begin
  repeat
    DlgResult:=MessageDlg(strInsertDisk1, mtConfirmation, [mbOk,mbCancel], 0);

    case DlgResult of
      mrOk:
        ;
      mrCancel:
        exit;
    end;

    boolFound:=false;
    s:='A';
    repeat
      GetDriveTypeStr(s);
      if GetDriveTypeStr(s)='CD-ROM' then
      begin
        if FileExists(s + ':\COMI.LA1') then
        begin
          boolFound:=true;
          break;
        end;
      end;
      inc(s);
    until s='Z';

  until boolFound=true;

  begin
    jvshfileoperation1.SourceFiles.Clear;
    jvshfileoperation1.DestFiles.Clear;
    jvshfileoperation1.SourceFiles.Add(s + ':\COMI.LA1');
    jvshfileoperation1.SourceFiles.Add(s + ':\COMI.LA0');
    jvshfileoperation1.DestFiles.Add(GetCMIPath);
    jvshfileoperation1.Execute;

    jvshfileoperation1.SourceFiles.Clear;
    jvshfileoperation1.DestFiles.Clear;
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\BBSAN.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\CURSERNG.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\FG010GP.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\FONT0.NUT');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\FONT1.NUT');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\FONT2.NUT');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\FONT3.NUT');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\FONT4.NUT');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\LANGUAGE.TAB');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\MUSDISK1.BUN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\NEWBOOTS.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\OPENING.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\SB010.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\SB020.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\SINKSHP.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\VOXDISK1.BUN');

    jvshfileoperation1.DestFiles.Add(GetCMIPath + '\RESOURCE\');
    jvshfileoperation1.Execute;
  end;

  repeat
    DlgResult:=MessageDlg(strInsertDisk2, mtConfirmation, [mbOk,mbCancel], 0);
    case DlgResult of
      mrOk:         ;
      mrCancel: exit;
    end;

    boolFound:=false;
    s:='A';
    repeat
      GetDriveTypeStr(s);
      if GetDriveTypeStr(s)='CD-ROM' then
      begin
        if FileExists(s + ':\COMI.LA2') then
        begin
          boolFound:=true;
          break;
        end;
      end;
    inc(s);
    until s='Z';

  until boolFound=true;

  begin
    jvshfileoperation1.SourceFiles.Clear;
    jvshfileoperation1.DestFiles.Clear;
    jvshfileoperation1.SourceFiles.Add(s + ':\COMI.LA2');
    jvshfileoperation1.DestFiles.Add(GetCMIPath);
    jvshfileoperation1.Execute;

    jvshfileoperation1.SourceFiles.Clear;
    jvshfileoperation1.DestFiles.Clear;
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\KIS030.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\LAVARIDE.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\LIFTCRSE.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\MORESLAW.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\MUSDISK2.BUN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\VOXDISK2.BUN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\FINALE.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\WRECKSAN.SAN');
    jvshfileoperation1.SourceFiles.Add(s + ':\RESOURCE\ZAP010.SAN');
    jvshfileoperation1.DestFiles.Add(GetCMIPath + '\RESOURCE\');
    jvshfileoperation1.Execute;
  end;

  ShowMessage(strCopyingComplete);
end;

//Close On Run Button Click
procedure TfrmOptions.btnCloseOnRunClick(Sender: TObject);
begin
  if btnCloseOnRun.Tag=1 then
  begin
    btnCloseOnRun.ImageIndex:=0;
    btnCloseOnRun.Tag:=0;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\CMI Launcher', 'closeonrun', 0);
  end
  else
  if btnCloseOnRun.Tag=0 then
  begin
    btnCloseOnRun.ImageIndex:=1;
    btnCloseOnRun.Tag:=1;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\CMI Launcher', 'closeonrun', 1);
  end
end;

//Hard Drive Run Button Click
procedure TfrmOptions.btnHdRunClick(Sender: TObject);
begin
  if btnHdRun.Tag=0 then
  begin
    if GetAllFilesOnHD=false then
    begin
      ShowMessage(strCopyFilesMsg);
      CopyFiles;
      if GetAllFilesOnHD=true then
      begin
        btnHdRun.ImageIndex:=3;
        btnHdRun.Tag:=1;
        RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\CMI Launcher', 'hdrun', 1);
      end;
    end
    else
    begin
      btnHdRun.ImageIndex:=3;
      btnHdRun.Tag:=1;
      RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\CMI Launcher', 'hdrun', 1);
    end;
  end
  else
  if btnHdRun.Tag=1 then
  begin
    btnHdRun.ImageIndex:=2;
    btnHdRun.Tag:=0;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\CMI Launcher', 'hdrun', 0);
  end;
end;

//Apply patch button click
procedure TfrmOptions.btnPatchClick(Sender: TObject);
var
  resStream: TResourceStream;
begin
  if GetHDRun = false then
  begin
    ShowMessage(strDebugRunFromHdMsg);
    Exit;
  end;

  if strTempDebugExeName = '' then exit;

  resStream:=TResourceStream.Create(0, 'DEBUGPATCH', 'DATA');
  try
    resStream.SaveToFile(strTempDebugExeName);
    ShellExec(0, 'open', strTempDebugExeName, '', ExtractFilePath(strTempDebugExeName), SW_NORMAL);
  finally
    resStream.Free;
  end;
end;

//Remove patch button click
procedure TfrmOptions.btnUnpatchClick(Sender: TObject);
var
  resStream: TResourceStream;
begin
  if GetHDRun = false then
  begin
    ShowMessage(strDebugRunFromHdMsg);
    Exit;
  end;

  if strTempDebugExeName = '' then exit;

  resStream:=TResourceStream.Create(0, 'DEBUGPATCH', 'DATA');
  try
    resStream.SaveToFile(strTempDebugExeName);
    ShellExec(0, 'open', strTempDebugExeName, '-u', ExtractFilePath(strTempDebugExeName), SW_NORMAL);
  finally
    resStream.Free;
  end;
end;


end.
