package;

/**
 * all option and statistic buttons. Help checkers, instruction and exit buttons.
 * @author kboardgames.com
 */
class Tournaments extends FlxGroup
{	
	public var __miscellaneous_menu_output:MiscellaneousMenuOutput;
	
	public var __menu_bar:MenuBar;
	
	/******************************
	 * true if the player moved a piece on the board in tournament play.
	 */
	public static var _piece_move_completed:Bool = false;
	
	/******************************
	 * the title of this scene.
	 */
	private var _title:FlxText;
	
	/******************************
	 * return to lobby.
	 */
	private var _close:ButtonGeneralNetworkYes;
	
	/******************************
	 * go to game room
	 */
	private var _button_move_piece:ButtonGeneralNetworkYes;
	
	public function new():Void
	{
		super();	
		
		FlxG.mouse.enabled = true;
		FlxG.autoPause = false;	// this application will pause when not in focus.
		
		__menu_bar = new MenuBar();
		add(__menu_bar);
		
		var background = new FlxSprite(0, 0);
		background.makeGraphic(FlxG.width, FlxG.height-50, FlxColor.BLACK);
		background.setPosition(0, 0);
		background.scrollFactor.set();	
		background.screenCenter(X);
		add(background);	
		
		var i:Int = 0;
		
		_title = new FlxText(0, 0, 0, "Tournaments Menu");
		_title.setFormat(Reg._fontDefault, 50, FlxColor.YELLOW);
		_title.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 3);
		_title.scrollFactor.set();
		_title.setPosition(15, 15);
		_title.screenCenter(X);
		add(_title);
		
		
		//#############################
		
		_close = new ButtonGeneralNetworkYes(30, FlxG.height - 40, "Exit", 150 + 15, 35, Reg._font_size, 0xFFCCFF33, 0, closeState, 0xFF000044, false);
		_close.label.font = Reg._fontDefault;
		_close.screenCenter(X);
		_close.x += 400;
		add(_close);
	}
	
	public function _tournament_standard_8():Void
	{
		var _title_sub = new FlxText(15, _title.y + 125, FlxG.width - 15, "Tournament Chess Standard (" + Std.string(RegTypedef._dataTournaments._player_current) + "/" + Std.string(RegTypedef._dataTournaments._player_maximum) + ")");
		_title_sub.setFormat(Reg._fontDefault, Reg._font_size);
		_title_sub.scrollFactor.set();
		add(_title_sub);
		
		var _tourny1 = new FlxText(15, _title_sub.y + 50, FlxG.width - 15, "");
		_tourny1.setFormat(Reg._fontDefault, Reg._font_size);
		_tourny1.scrollFactor.set();
		add(_tourny1);
		
		if (RegTypedef._dataTournaments._player1 == "")
		{
			_tourny1.color = FlxColor.RED;
			_tourny1.text = "You are not participating in this tournament.";
		}
		
		else if (RegTypedef._dataTournaments._move_piece == false
		&& 		 RegTypedef._dataTournaments._game_over == 0)
		{
			_tourny1.color = FlxColor.YELLOW;
			_tourny1.text = "Waiting for " + RegTypedef._dataTournaments._player2 + " to move gameboard piece. Come back later.";
		}
		
		else if (RegTypedef._dataTournaments._game_over == 0)
		
		{
			_tourny1.color = FlxColor.GREEN;
			_tourny1.text = "Please move your gameboard piece.";
			
			_button_move_piece = new ButtonGeneralNetworkYes(_tourny1.x + _tourny1.textField.textWidth + 15, _tourny1.y, "Move Piece", 215, 35, Reg._font_size, 0xFFCCFF33, 0, move_piece.bind(1), 0xFF000044, false);		
			_button_move_piece.label.font = Reg._fontDefault;
			_button_move_piece.scrollFactor.set(0, 0);
			add(_button_move_piece);
		}
		
		else if (RegTypedef._dataTournaments._won_game == 1
		&&		 RegTypedef._dataTournaments._round_current <
				 RegTypedef._dataTournaments._rounds_total)
		{
			RegTypedef._dataTournaments._move_piece = false;
			
			_tourny1.color = FlxColor.YELLOW;
			_tourny1.text = "You have advanced to the next tournament round. However, users are still playing in the current tournament round. Therefore, You are waiting for an opponent. Come back later.";
			
		}
		
		else if (RegTypedef._dataTournaments._tournament_started == false)
		{
			_tourny1.color = FlxColor.YELLOW;
			_tourny1.text = "Tournament has not started yet because we still need more players to join. Come back later.";
		}
		
		else
		{
			RegTypedef._dataTournaments._move_piece = false;
			
			_tourny1.color = FlxColor.RED;
			_tourny1.text = "You have been eliminated from this tournament.";
			
			_button_move_piece = new ButtonGeneralNetworkYes(_tourny1.x + _tourny1.textField.textWidth + 15, _tourny1.y, "Preview", 215, 35, Reg._font_size, 0xFFCCFF33, 0, preview.bind(1), 0xFF000044, false);		
			_button_move_piece.label.font = Reg._fontDefault;
			_button_move_piece.scrollFactor.set(0, 0);
			add(_button_move_piece);
		}
		
	}
	
	/******************************
	 * this code in this function setup everything needed to move a piece in tournament play.
	 */
	private function move_piece(_num:Int):Void
	{
		_piece_move_completed = false;
		
		__menu_bar.active = false;
		_close.active = false;
		_button_move_piece.active = false;
		
		visible = false;
		
		RegTypedef._dataMisc._spectatorWatching = true;
		RegTypedef._dataPlayers._spectatorPlaying = true;
		RegTypedef._dataPlayers._spectatorWatching = true;
		
		if (_num == 1)
		{
			Reg._gameId = 1;
			RegTypedef._dataMisc._room = 2;
			PlayState.allTypedefRoomUpdate(2);
		}
		
		RegTypedef._dataPlayers._moveNumberDynamic[0] = 0;
		RegTypedef._dataMisc._roomState[0] = 8;
		RegTypedef._dataMisc._userLocation = 3;
		
		RegTypedef._dataMovement._gid = RegTypedef._dataTournaments._gid;
		
		Reg._gameOverForPlayer = false;
		Reg._gameOverForAllPlayers = false;
		Reg._playerCanMovePiece = true;
		
		PlayState.clientSocket.send("Greater RoomState Value", RegTypedef._dataMisc); 
		haxe.Timer.delay(function (){}, Reg2._event_sleep);
	}
	
	/******************************
	 * preview the game then ending.
	 */
	private function preview(_num:Int):Void
	{
		_piece_move_completed = true;
		
		__menu_bar.active = false;
		_close.active = false;
		_button_move_piece.active = false;
		
		visible = false;
		
		RegTypedef._dataMisc._spectatorWatching = true;
		RegTypedef._dataPlayers._spectatorPlaying = false;
		RegTypedef._dataPlayers._spectatorWatching = true;
		
		if (_num == 1)
		{
			Reg._gameId = 1;
			RegTypedef._dataMisc._room = 2;
			PlayState.allTypedefRoomUpdate(2);
		}
		
		RegTypedef._dataPlayers._moveNumberDynamic[0] = 0;
		RegTypedef._dataMisc._roomState[0] = 8;
		RegTypedef._dataMisc._userLocation = 3;
		
		RegTypedef._dataMovement._gid = RegTypedef._dataTournaments._gid;
		
		Reg._gameOverForPlayer = true;
		Reg._gameOverForAllPlayers = true;
		Reg._playerCanMovePiece = false;
		
		PlayState.clientSocket.send("Greater RoomState Value", RegTypedef._dataMisc); 
		haxe.Timer.delay(function (){}, Reg2._event_sleep);
	}
	
	override public function update(elapsed:Float):Void
	{
		if (RegTriggers._jump_to_tournament_standard_chess_8 == true)
		{
			RegTriggers._jump_to_tournament_standard_chess_8 = false;
			_tournament_standard_8();
		}
		
		super.update(elapsed);
	}	
	
	private function closeState():Void
	{
		if (RegCustom._enable_sound == true
		&&  Reg2._boxScroller_is_scrolling == false)
			FlxG.sound.play("click", 1, false);
		
		FlxG.mouse.reset();
				
		__menu_bar.active = false;
		_close.active = false;
		
		if (_button_move_piece != null) _button_move_piece.active = false;
		
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