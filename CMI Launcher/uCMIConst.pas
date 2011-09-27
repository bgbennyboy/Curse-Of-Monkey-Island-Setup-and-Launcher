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

unit uCMIConst;

interface

const
{************************************Global************************************}
  strAppVersion:         string = '1.5';
  strAppTitle:           string = 'Curse Of Monkey Island Launcher';

{**********************************Main Form***********************************}
  strStatusRunFromHd:    string = 'Running game from Hard Drive';
  strStatusRunFromCd:    string = 'Running game from Cd drive ';
  strRegKeysNotFound:    string = 'Curse Of Monkey Island registry keys not found!'
                                  + #13 +
                                  'The launcher will not function correctly without these registry keys.'
                                  + #13 + #13 +
                                  'The easiest way to fix this is to re-install the game.';


{*********************************Options Form*********************************}
  strInsertDisk1:        string = 'Insert Curse of Monkey Island Disc 1 in any drive';
  strInsertDisk2:        string = 'Insert Curse of Monkey Island Disc 2 in any drive';
  strCopyingComplete:    string = 'Copying complete!';
  strCopyFilesMsg:       string = 'You are missing some of the required files'
                                  + #13 +
                                  'Curse Of Monkey Island Launcher will now copy some files from the CMI cd''s to your hard drive.';
  strDebugRunFromHdMsg:  string = 'The debug patch only works when the game is running from hard drive, not from cd.'
                                  + #13 + #13 +
                                  'Click on the ''run from hard drive'' button to correct this.';

implementation

end.

