;***************************************************************
;  Curse Of Monkey Island Setup
;  Copyright (c) 2007-2008 Bgbennyboy
;  Http://quick.mixnmojo.com
;***************************************************************
;
;  This program is free software; you can redistribute it and/or
;  modify it under the terms of the GNU General Public License
;  as published by the Free Software Foundation; either version 2
;  of the License, or (at your option) any later version.
;
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with this program; if not, write to the Free Software
;  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.


[Setup]
VersionInfoVersion=1.0
VersionInfoCompany=Quick And Easy Software
VersionInfoDescription=Replacement installer for The Curse Of Monkey Island
VersionInfoTextVersion=1.0
VersionInfoCopyright=bgbennyboy 2008
AppCopyright=bgbennyboy 2008
AppName=Curse Of Monkey Island
AppVerName=The Curse Of Monkey Island
RestartIfNeededByRun=false
AllowRootDirectory=false
DefaultDirName={pf}\Lucasarts\Curse\
ShowLanguageDialog=auto
InternalCompressLevel=max
DefaultGroupName=Lucasarts\Curse Of Monkey Island\
OutputBaseFilename=CMISetup
AppPublisher=Quick and Easy Software
AppPublisherURL=http://quick.mixnmojo.com
AppSupportURL=http://quick.mixnmojo.com
AppUpdatesURL=http://quick.mixnmojo.com
AppVersion=1.0
AppComments=Contact me via my contact page
AppContact=http://quick.mixnmojo.com/contact
UninstallDisplayIcon={app}\CMI Launcher.exe
UninstallDisplayName=Curse Of Monkey Island
DisableProgramGroupPage=false
AllowNoIcons=true
AlwaysUsePersonalGroup=false
PrivilegesRequired=admin
AppID={code:GetAppID|''}
WizardImageFile=Large_Wizard_Image.bmp
WizardSmallImageFile=Small_Wizard_Image.bmp
Compression=lzma
SolidCompression=false
InfoBeforeFile=Before.rtf

[Dirs]
Name: {app}\RESOURCE; Flags: uninsalwaysuninstall


[Files]
; ON CD 1
Source: {code:GetSourceDrive}INSTALL\COMI.EXE; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}COMI.LA0; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}COMI.LA1; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}CURSE.EXE; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}Launcher.tab; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}MonkeyTG.doc; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}MonkeyTG.txt; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}README.TXT; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}INSTALL\Register.exe; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}INSTALL\Website.exe; DestDir: {app}; Flags: external

Source: {code:GetSourceDrive}RESOURCE\BBSAN.SAN; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\CURSERNG.SAN; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\FG010GP.SAN; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\FONT0.NUT; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\FONT1.NUT; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\FONT2.NUT; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\FONT3.NUT; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\FONT4.NUT; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\LANGUAGE.TAB; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\MUSDISK1.BUN; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\NEWBOOTS.SAN; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\OPENING.SAN; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\SB010.SAN; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\SB020.SAN; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\SINKSHP.SAN; DestDir: {app}\RESOURCE; Flags: external
Source: {code:GetSourceDrive}RESOURCE\VOXDISK1.BUN; DestDir: {app}\RESOURCE; Flags: external


; ON CD 2
Source: {code:GetSourceDrive}COMI.LA2; DestDir: {app}; Flags: external; Check: CD2()

Source: {code:GetSourceDrive}RESOURCE\FINALE.SAN; DestDir: {app}\RESOURCE; Flags: external; Check: 
Source: {code:GetSourceDrive}RESOURCE\KIS030.SAN; DestDir: {app}\RESOURCE; Flags: external; Check: 
Source: {code:GetSourceDrive}RESOURCE\LAVARIDE.SAN; DestDir: {app}\RESOURCE; Flags: external; Check: 
Source: {code:GetSourceDrive}RESOURCE\LIFTCRSE.SAN; DestDir: {app}\RESOURCE; Flags: external; Check: 
Source: {code:GetSourceDrive}RESOURCE\MORESLAW.SAN; DestDir: {app}\RESOURCE; Flags: external; Check: 
Source: {code:GetSourceDrive}RESOURCE\MUSDISK2.BUN; DestDir: {app}\RESOURCE; Flags: external; Check: 
Source: {code:GetSourceDrive}RESOURCE\VOXDISK2.BUN; DestDir: {app}\RESOURCE; Flags: external; Check: 
Source: {code:GetSourceDrive}RESOURCE\WRECKSAN.SAN; DestDir: {app}\RESOURCE; Flags: external; Check: 
Source: {code:GetSourceDrive}RESOURCE\ZAP010.SAN; DestDir: {app}\RESOURCE; Flags: external; Check: 

;Compile into setup
Source: CMI Launcher.exe; DestDir: {app}
Source: Curse Of Monkey Island Launcher.html; DestDir: {app}


[Registry]
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company\Curse of Monkey Island\; ValueType: none; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company\Curse of Monkey Island\v1.0\; ValueType: none; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company\Curse of Monkey Island\v1.0\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Executable; ValueData: {app}\COMI.exe
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company\Curse of Monkey Island\v1.0; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Launcher Path; ValueData: {app}\CURSE.EXE
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company\Curse of Monkey Island\v1.0; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Source Path; ValueData: {code:GetSourceDrive}

[Icons]
Name: {group}\{cm:UninstallProgram,Curse Of Monkey Island}; Filename: {uninstallexe}; Comment: Uninstall Curse Of Monkey Island
Name: {group}\Launcher Readme; Filename: {app}\Curse Of Monkey Island Launcher.html; Comment: The readme file for the replacement launcher
Name: {group}\Lucasarts Readme; Filename: {app}\Readme.txt; Comment: The readme file that ships with the game
Name: {group}\Curse Of Monkey Island; Filename: {app}\CMI Launcher.exe; Comment: Run Curse Of Monkey Island; IconIndex: 0
Name: {userdesktop}\Curse Of Monkey Island; Filename: {app}\CMI Launcher.exe; IconIndex: 0; Tasks: " desktopicon"

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}

[Code]
var
	SourceDrive: string;
	CallCount: integer;

#include "FindCd.iss"


//Fix start menu/ desktop shortcuts
//Make my launcher default file in start menu + shortcut
//Before/after page - explaining what it is and link to my website
//Make dvd install?



function IsX64: Boolean;
begin
	Result := Is64BitInstallMode;
end;

function GetAppID(param: String): String;
begin
	Result := 'bgbennyboyCMIReplacementSetup';
end;

function IsUpgrade(): Boolean; //is it already installed?
var
   sPrevPath: String;
begin
  sPrevPath := '';
  if not RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\' + getAppID('') + '_is1', 'UninstallString', sPrevpath) then
	RegQueryStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{getAppID('') + _is1', 'UninstallString', sPrevpath);
  Result := (sPrevPath <> '');
end;

function GetSourceDrive(Param: String): String;
begin
	Result:=SourceDrive;
end;

function CD2(): Boolean;
begin

	CallCount:=CallCount + 1;

	//Extra check here - if its already been installed and this installer is running again then
	//the files will be found - even though the files havent been copied off cd1 yet.
	//Without this check the CD2 prompt appears, the user has to insert cd2 and the installer then tries to copy files from CD1.

	if (IsUpgrade()) and (CallCount < 2) then //Need to check callcount because this check function is called multiple times before file copying even begins
	begin
		//MsgBox('Its an upgrade install!', mbError, MB_OKCANCEL);
		result:=true;
	end
	else

	//If these if's are both true then first+last file on cd1 have been copied, so we can assume that all file
	//copying on CD1 is done. Its therefore OK to display the CD2 prompt.
	//Without this check the CD2 prompt appears before the installation begins.

	if (FileExists(AddBackslash(ExpandConstant('{app}')) + 'COMI.EXE')) and (FileExists(AddBackslash(ExpandConstant('{app}')) + 'RESOURCE\VOXDISK1.BUN')) then
	begin
		while not FileExists(AddBackslash(ExpandConstant('{code:GetSourceDrive}')) + 'COMI.LA2') do
		begin
			if MsgBox('Please insert Curse Of Monkey Island CD 2 in any drive and press OK.' + Chr(13) + Chr(13) +
				'Or press cancel to exit setup.', mbError, MB_OKCANCEL)=IDOK then

			else
			begin
				result:=false;
				WizardForm.Close();
				exit;
			end;
		end;
		result:=true;
	end

	else
		result:=true;
end;

procedure InitializeWizard();
begin
	if IsUpgrade() then
		if MsgBox('Curse Of Monkey Island is already installed!' + Chr(13) + Chr(13) + 'Continue anyway? (Existing files will be overwritten).', mbError, MB_OKCANCEL)=IDCANCEL then
			abort


	SourceDrive:=GetSourceCdDrive();
end;
