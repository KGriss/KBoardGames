package;

/**
 * currently asks for a chess rank to set the chess Elo rating (named after its creator Arpad Elo) for the player but only once for a new account. a new account has an chess Elo rating of zero. if beginner rank is selected then player's Elo rating will be set to 800.
 * @author kboardgames.com
 */
class NewAccount extends FlxGroup
{	
	public var __menu_bar:MenuBar;
	private var _button_b1:ButtonToggleFlxState;
	private var _button_b2:ButtonToggleFlxState;
	private var _button_b3:ButtonToggleFlxState;
	
	public function new():Void
	{
		super();	
		
		FlxG.autoPause = false;	// this application will pause when not in focus.
				
		var _title = new FlxText(0, 0, 0, "New Account");
		_title.setFormat(Reg._fontDefault, 50, FlxColor.YELLOW);
		_title.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 3);
		_title.scrollFactor.set();
		_title.setPosition(15, 15);
		_title.screenCenter(X);
		add(_title);
		
		// menu bar.
		__menu_bar = new MenuBar();
		add(__menu_bar);		
		
		//#############################
		
		var _gameOptions = new FlxText(30, 125, 0, "What is your chess skill level for online play?");
		_gameOptions.setFormat(Reg._fontDefault, 24);
		_gameOptions.scrollFactor.set();
		add(_gameOptions);
		
		_button_b1 = new ButtonToggleFlxState(_gameOptions.x + _gameOptions.textField.width + 15, 122, 1, "Beginner", 200, 35, Reg._font_size, 0xFFCCFF33, 0, chess_skill_selected.bind(1), 0xFF000044, false);
		_button_b1.color = 0xFF005500;
		_button_b1.has_toggle = true;
		_button_b1.set_toggled(true);
		_button_b1.label.font = Reg._fontDefault;
		add(_button_b1);
		
		_button_b2 = new ButtonToggleFlxState(_button_b1.x + _button_b1.label.textField.width + 15, 122, 2, "Intermediate", 200, 35, Reg._font_size, 0xFFCCFF33, 0, chess_skill_selected.bind(2), 0xFF000044, false);
		_button_b2.color = 0xFF550000;
		_button_b2.label.font = Reg._fontDefault;
		_button_b2.has_toggle = true;
		_button_b2.set_toggled(false);
		add(_button_b2);
		
		_button_b3 = new ButtonToggleFlxState(_button_b2.x + _button_b2.label.textField.width + 15, 122, 3, "Advance", 200, 35, Reg._font_size, 0xFFCCFF33, 0, chess_skill_selected.bind(3), 0xFF000044, false);
		_button_b3.color = 0xFF550000;
		_button_b3.label.font = Reg._fontDefault;
		_button_b3.has_toggle = true;
		_button_b3.set_toggled(false);
		add(_button_b3);
		
		var _close = new ButtonGeneralNetworkYes(30, FlxG.height - 40, "Save", 150 + 15, 35, Reg._font_size, 0xFFCCFF33, 0, saveAllConfigurations, 0xFF000044, false);
		_close.label.font = Reg._fontDefault;
		_close.screenCenter(X);
		#if html5
			_close.label.text = "Apply";
		#end
		_close.x += 400;
		add(_close);		
	}
	
	private function saveAllConfigurations():Void
	{
		Reg._messageId = 11001;
		Reg._buttonCodeValues = "e1000";		
		SceneGameRoom.messageBoxMessageOrder();
		
	}
	
	override public function update(elapsed:Float):Void
	{
		if (Reg._yesNoKeyPressValueAtMessage > 0 && Reg._buttonCodeValues == "e1000")
		{
			Reg._yesNoKeyPressValueAtMessage = 0;
			
			if (_button_b1.has_toggle == true)
				RegTypedef._dataStatistics._chess_elo_rating = 800;
			
			if (_button_b2.has_toggle == true)
				RegTypedef._dataStatistics._chess_elo_rating = 1200;
			
			if (_button_b3.has_toggle == true)
				RegTypedef._dataStatistics._chess_elo_rating = 1600;
						
			PlayState.clientSocket.send("Save New Account Configurations", RegTypedef._dataStatistics);
			closeState();
		}
		
		super.update(elapsed);
	}
	
	private function set_chess_elo_button_toggle():Void
	{
		_button_b1.color = 0xFF550000;
		_button_b1.set_toggled(false);
		_button_b1.has_toggle = false;
		
		_button_b2.color = 0xFF550000;
		_button_b2.set_toggled(false);
		_button_b2.has_toggle = false;
		
		_button_b3.color = 0xFF550000;
		_button_b3.set_toggled(false);
		_button_b3.has_toggle = false;
	}
	
	private function chess_skill_selected(_num:Int = 1):Void
	{
		set_chess_elo_button_toggle();
		
		switch (_num)
		{
			case 1:
			{
				_button_b1.color = 0xFF005500;
				_button_b1.set_toggled(true);
				_button_b1.has_toggle = true;
			}
			
			case 2:
			{
				_button_b2.color = 0xFF005500;
				_button_b2.set_toggled(true);
				_button_b2.has_toggle = true;
			}
			
			case 3:
			{
				_button_b3.color = 0xFF005500;
				_button_b3.set_toggled(true);
				_button_b3.has_toggle = true;
			}
				
		}
	}
	
	private function closeState():Void
	{
		remove(__menu_bar);
		__menu_bar.destroy();
		__menu_bar = null;
		
		RegTriggers._returnToLobbyMakeButtonsActive = true;
		
		visible = false;
		active = false;
		
	}
		
	override public function destroy()
	{
		super.destroy();
	}
}