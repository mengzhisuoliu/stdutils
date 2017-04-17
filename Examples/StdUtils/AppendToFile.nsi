#################################################################################
# StdUtils plug-in for NSIS
# Copyright (C) 2004-2017 LoRd_MuldeR <MuldeR2@GMX.de>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
#
# http://www.gnu.org/licenses/lgpl-2.1.txt
#################################################################################

Caption "StdUtils Test-Suite"

!addincludedir  "..\..\Include"

!ifdef NSIS_UNICODE
	!addplugindir "..\..\Plugins\Release_Unicode"
	OutFile "AppendToFile-Unicode.exe"
!else
	!addplugindir "..\..\Plugins\Release_ANSI"
	OutFile "AppendToFile-ANSI.exe"
!endif

!include 'StdUtils.nsh'

RequestExecutionLevel user
ShowInstDetails show

Section
	${StdUtils.AppendToFile} $0 "$WINDIR\Explorer.exe" "$TEMP\Combined.exe" 0 0
	DetailPrint "AppendToFile: $0"
	
	${StdUtils.AppendToFile} $0 "$WINDIR\Notepad.exe"  "$TEMP\Combined.exe" 0 0
	DetailPrint "AppendToFile: $0"
SectionEnd
