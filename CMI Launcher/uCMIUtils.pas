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

unit uCMIUtils;

interface

type
  TWinType = (
    wt9X,
    wtNT,
    wtUnknown);

function GetCMIpath: string;
function GetCdPath: string;
function GetHDRun: boolean;
function GetCloseOnRun: boolean;
function GetAllFilesOnHD: boolean;
function CreateDefaultRegKeys : string;
function GetOsVersion: TWinType;

implementation

uses
  windows, sysutils, jclregistry, jclstrings, jclsysinfo;


//Read Path to CMI from Registry
function GetCMIpath: string;
begin
  try
    result:=Strbefore('COMI.EXE',regreadstring(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company\Curse of Monkey Island\v1.0','executable'));
  Except On EJclRegistryError do
    result:='';
  end;
end;

//Read Cd Drive key from registry
function GetCdPath: string;
begin
  try
    Result:=regreadstring(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company\Curse of Monkey Island\v1.0','source path');
  Except On EJclRegistryError do
    result:='';
  end;
end;

//Get if launcher should run CMI from HD or cd
function GetHDRun: boolean;
begin
  if regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\CMI Launcher','hdrun')=1 then
    result:=true
  else
    result:=false;
end;

//Get if launcher should close on run
function GetCloseOnRun: boolean;
begin
  if regreadinteger(HKEY_CURRENT_USER,'Software\Quick And Easy\CMI Launcher','closeonrun')=1 then
    result:=true
  else
    result:=false;
end;

//Create Default Reg Keys
function CreateDefaultRegKeys : string;
begin
  RegCreateKey(HKEY_CURRENT_USER,'Software\Quick And Easy\CMI Launcher', '0');

  try
    RegReadInteger(HKEY_CURRENT_USER,'Software\Quick And Easy\CMI Launcher', 'hdrun')

    Except On EJclRegistryError do //Default to yes - if the files arent there then the launcher will disable this again
      RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\CMI Launcher', 'hdrun', 1);
  end;

  try
    RegReadInteger(HKEY_CURRENT_USER,'Software\Quick And Easy\CMI Launcher', 'closeonrun')

    Except On EJclRegistryError do
      RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\CMI Launcher', 'closeonrun', 0);
  end;
end;

//Check CMI Files are all on hard drive
function GetAllFilesOnHD: boolean;
const
  CMIFiles: array [0..27] of string = (
    'COMI.LA0',
    'COMI.LA1',
    'COMI.LA2',
    'RESOURCE\FONT0.NUT',
    'RESOURCE\FONT1.NUT',
    'RESOURCE\FONT2.NUT',
    'RESOURCE\FONT3.NUT',
    'RESOURCE\FONT4.NUT',
    'RESOURCE\MUSDISK1.BUN',
    'RESOURCE\MUSDISK2.BUN',
    'RESOURCE\VOXDISK1.BUN',
    'RESOURCE\VOXDISK2.BUN',
    'RESOURCE\BBSAN.SAN',
    'RESOURCE\CURSERNG.SAN',
    'RESOURCE\FG010GP.SAN',
    'RESOURCE\FINALE.SAN',
    'RESOURCE\KIS030.SAN',
    'RESOURCE\LAVARIDE.SAN',
    'RESOURCE\LIFTCRSE.SAN',
    'RESOURCE\MORESLAW.SAN',
    'RESOURCE\NEWBOOTS.SAN',
    'RESOURCE\OPENING.SAN',
    'RESOURCE\SB010.SAN',
    'RESOURCE\SB020.SAN',
    'RESOURCE\SINKSHP.SAN',
    'RESOURCE\WRECKSAN.SAN',
    'RESOURCE\ZAP010.SAN',
    'RESOURCE\LANGUAGE.TAB');
var
  i: integer;
begin
  Result:=true;
  for I := 0 to High(CMIFiles) do
  begin
    if fileexists(GetCMIPath + CMIFiles[i]) = false then
    begin
      result:=false;
      exit;
    end;
  end;

end;

//Get OS Version And Return Type
function GetOsVersion : TWinType;
Var
  WinVer: TWindowsVersion;
begin
  WinVer:=GetWindowsVersion;
  case WinVer of
    wvUnknown:       Result:=wtUnknown;
    wvWin95:         Result:=wt9X;
    wvWin95OSR2:     Result:=wt9X;
    wvWin98:         Result:=wt9X;
    wvWin98SE:       Result:=wt9X;
    wvWinME:         Result:=wt9X;
    wvWinNT31:       Result:=wtNT;
    wvWinNT35:       Result:=wtNT;
    wvWinNT351:      Result:=wtNT;
    wvWinNT4:        Result:=wtNT;
    wvWin2000:       Result:=wtNT;
    wvWinXP:         Result:=wtNT;
    wvWin2003:       Result:=wtNT;
    wvWinXP64:       Result:=wtNT;
    wvWin2003R2:     Result:=wtNT;
    wvWinVista:      Result:=wtNT;
    wvWinServer2008: Result:=wtNT
    else
      Result:=wtUnknown;
  end;

end;


end.
