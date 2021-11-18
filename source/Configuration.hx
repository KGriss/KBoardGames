/*
    Copyright (c) 2021 KBoardGames.com
    This program is part of KBoardGames client software.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

package;

/**
 * this class is created when clicking the gear button. It has configuration stuff such as setting up the game board unit colors.
 * @author kboardgames.com
 */
class Configuration extends FlxState
{
	public var _output:ConfigurationOutput;
	
	override public function create():Void
	{
		super.create();
			
		persistentDraw = true;
		persistentUpdate = true;
		
		FlxG.mouse.visible = true;
		
		Reg._at_configuration_menu = true;
		
		#if !html5
			//------------------------------
			RegFunctions._gameMenu = new FlxSave(); // initialize		
			RegFunctions._gameMenu.bind("ConfigurationsMenu"); // bind to the named save slot.
			
			// we use true here so that some items are loaded. a value of false is the default for this function so that so items are only loaded when a condition is met.
			RegCustom.resetConfigurationVars();
			RegFunctions.loadConfig(true);
			if (Reg._tn == 0) RegCustom.resetConfigurationVars2();			
			
			RegFunctions.themes_recursive_file_loop();
			
			RegCustom.assign_colors();
		
		#else
			RegCustom.resetConfigurationVars();		
		#end
		
		_output = new ConfigurationOutput();
		add(_output);
	}
	
	override public function update(elapsed:Float):Void 
	{
		// should message box be displayed?
		if (Reg._messageId > 0 && Reg._messageId != 1000000
		&&	RegTriggers._buttons_set_not_active == false)
		{
			var _msg = new IdsMessageBox();
			add(_msg);
		}
			
		super.update(elapsed);
	}	
	
}