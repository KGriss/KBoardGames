package;

/**
 * ...
 * @author kboardgames.com
 */
class MenuStateOfflinePlayers extends MenuState
{
	
	override public function create():Void
	{
		Reg._alreadyOnlineHost = false;
		Reg._alreadyOnlineUser = false;
		RegTypedef.resetTypedefData();
		Reg.resetRegVars(); 
		Reg2.resetRegVars();
		RegCustom.resetRegVars();
		
		_ticks_startup = 1000;

		RegTriggers.resetTriggers();		
	
		#if desktop
			FlxG.mouse.useSystemCursor = true;				
		#end
		
		RegFunctions.fontsSharpen();		
		startupFunctions();
				
		// the title of the game.
		var title = new FlxText(0, 0, 0, "Player 1 vs Player 2");
		title.setFormat(Reg._fontTitle, 69, FlxColor.YELLOW);
		title.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 3);
		title.scrollFactor.set();
		title.screenCenter(X);
		add(title);
		
		var _checkers = new ButtonGeneralNetworkNo(0, (FlxG.height - 340) / 2 + 40, "Checkers", 350 + 15, 35, Reg._font_size, 0xFFCCFF33, 0, playCheckers, 0xFF000044, false);
		_checkers.label.font = Reg._fontDefault;
		_checkers.screenCenter(X);
		add(_checkers);
		
		var _chess = new ButtonGeneralNetworkNo(0, (FlxG.height - 340) / 2 + 100, "Chess", 350 + 15, 35, Reg._font_size, 0xFFCCFF33, 0, playChess, 0xFF000044, false);
		_chess.label.font = Reg._fontDefault;
		_chess.screenCenter(X);
		add(_chess);
		
		var _reversi = new ButtonGeneralNetworkNo(0, (FlxG.height - 340) / 2 + 160, "Reversi", 350 + 15, 35, Reg._font_size, 0xFFCCFF33, 0, playReversi, 0xFF000044, false);
		_reversi.label.font = Reg._fontDefault;
		_reversi.screenCenter(X);
		add(_reversi);
			
		var _snakesAndladders = new ButtonGeneralNetworkNo(0, (FlxG.height - 340) / 2 + 220, "Snakes and Ladders", 350 + 15, 35, Reg._font_size, 0xFFCCFF33, 0, playSnakesAndLadders, 0xFF000044, false);
		_snakesAndladders.label.font = Reg._fontDefault;
		_snakesAndladders.screenCenter(X);
		add(_snakesAndladders);
		
		var _back = new ButtonGeneralNetworkNo(0, (FlxG.height - 340) / 2 + 280, "To Title", 170 + 15, 35, Reg._font_size, 0xFFCCFF33, 0, backToTitle, 0xFF000044, false);
		_back.label.font = Reg._fontDefault;
		_back.screenCenter(X);
		add(_back);
		
		Reg._gameJumpTo = 0;
	}
	
				
	public function playCheckers():Void
	{
		Reg._alreadyOnlineHost = false;
		Reg._alreadyOnlineUser = false;
		RegTypedef.resetTypedefData();
		Reg.resetRegVars(); 
		Reg2.resetRegVars();
		RegCustom.resetRegVars();
		RegTriggers.resetTriggers();
		
		// these two vars are true only here for single mode because in 2 player mode the first player to enter lobby will set these vars to true.
		Reg._playerCanMovePiece = true; 
		Reg._gameHost = true;
		
		Reg._gameId = 0; //checkers.
		Reg._game_offline_vs_player = true;
		Reg._game_offline_vs_cpu = false; 
		Reg._move_number_current = 0;
		Reg._move_number_next = 0;		 
		Reg._gameJumpTo = 0;		
		Reg._gameNotationOddEven = 0;
		Reg._gameOverForAllPlayers = false;
		Reg._gameOverForPlayer = false;
		
		FlxG.switchState(new PlayState());
	}
	
	public function playChess():Void
	{
		Reg._alreadyOnlineHost = false;
		Reg._alreadyOnlineUser = false;
		RegTypedef.resetTypedefData();
		Reg.resetRegVars(); 
		Reg2.resetRegVars();
		RegCustom.resetRegVars();
		RegTriggers.resetTriggers();
		
		// these two vars are true only here for single mode because in 2 player mode the first player to enter lobby will set these vars to true.
		Reg._playerCanMovePiece = true; 
		Reg._gameHost = true;
		
		Reg._gameId = 1; //checkers.
		Reg._game_offline_vs_player = true;
		Reg._game_offline_vs_cpu = false; 
		Reg._move_number_current = 0;
		Reg._move_number_next = 0;		 
		Reg._gameJumpTo = 0;		
		Reg._gameNotationOddEven = 0;
		Reg._gameOverForAllPlayers = false;
		Reg._gameOverForPlayer = false;
		
		FlxG.switchState(new PlayState());
	}
	
	public function playReversi():Void
	{
		// these two vars are true only here for single mode because in 2 player mode the first player to enter lobby will set these vars to true.
		Reg._playerCanMovePiece = true; 
		Reg._gameHost = true;
		
		Reg._gameId = 2; // Reversi.
		Reg._game_offline_vs_player = true;
		Reg._game_offline_vs_cpu = false; 
		Reg._move_number_current = 0;
		Reg._move_number_next = 0;
		Reg._gameJumpTo = 0; 
		Reg._gameNotationOddEven = 0;
		Reg._gameOverForAllPlayers = false;
		Reg._gameOverForPlayer = false;
		
		FlxG.switchState(new PlayState());
	}
	
	public function playSnakesAndLadders():Void
	{
		// these two vars are true only here for single mode because in 2 player mode the first player to enter lobby will set these vars to true.
		Reg._playerCanMovePiece = true; 
		Reg._gameHost = true;
		
		Reg._gameId = 3; // snakes and ladders.
		Reg._game_offline_vs_player = true;
		Reg._game_offline_vs_cpu = false;
		Reg._move_number_current = 0;
		Reg._move_number_next = 0;
		Reg._gameJumpTo = 0;
		Reg._gameOverForAllPlayers = false;
		Reg._gameOverForPlayer = false;
		
		FlxG.switchState(new PlayState());
	}
	
	public function backToTitle():Void
	{
		Reg._gameJumpTo = 0;
		FlxG.switchState(new MenuState());
	}
		
	
}

