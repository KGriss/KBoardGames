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
 * at the configuration menu, any feature that changes in color, such as a background or a header, will use one of these functions.
 * @author kboardgames.com
 */
class RegCustomColors 
{
public static function color_future_capturing_units():FlxColor
	{
		
		var _color:FlxColor = 0xFF807c00;
		
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 1) _color = FlxColor.BLUE;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 2) _color = FlxColor.BROWN;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 3) _color = FlxColor.CYAN;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 4) _color = FlxColor.GRAY;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 5) _color = FlxColor.GREEN;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 6) _color = FlxColor.LIME;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 7) _color = FlxColor.MAGENTA;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 8) _color = FlxColor.ORANGE;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 9) _color = FlxColor.PINK;	 
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 10) _color = FlxColor.PURPLE;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 11) _color = FlxColor.RED;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 12) _color = FlxColor.YELLOW;
		if (RegCustom._chess_future_capturing_units_number[Reg._tn] == 13) _color = FlxColor.WHITE;
		return _color;
	}
	
	public static function color_path_to_king():FlxColor
	{
		
		var _color:FlxColor = 0xFF807c00;
		
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 1) _color = FlxColor.BLUE;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 2) _color = FlxColor.BROWN;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 3) _color = FlxColor.CYAN;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 4) _color = FlxColor.GRAY;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 5) _color = FlxColor.GREEN;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 6) _color = FlxColor.LIME;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 7) _color = FlxColor.MAGENTA;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 8) _color = FlxColor.ORANGE;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 9) _color = FlxColor.PINK;	 
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 10) _color = FlxColor.PURPLE;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 11) _color = FlxColor.RED;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 12) _color = FlxColor.YELLOW;
		if (RegCustom._chess_path_to_king_number[Reg._tn] == 13) _color = FlxColor.WHITE;
		return _color;
	}
	
	/******************************
	 * regular units that the piece can capture.
	 */
	public static function color_capturing_units():FlxColor
	{
		
		var _color:FlxColor = 0xFF807c00;
		
		if (RegCustom._capturing_units_number[Reg._tn] == 1) _color = FlxColor.BLUE;
		if (RegCustom._capturing_units_number[Reg._tn] == 2) _color = FlxColor.BROWN;
		if (RegCustom._capturing_units_number[Reg._tn] == 3) _color = FlxColor.CYAN;
		if (RegCustom._capturing_units_number[Reg._tn] == 4) _color = FlxColor.GRAY;
		if (RegCustom._capturing_units_number[Reg._tn] == 5) _color = FlxColor.GREEN;
		if (RegCustom._capturing_units_number[Reg._tn] == 6) _color = FlxColor.LIME;
		if (RegCustom._capturing_units_number[Reg._tn] == 7) _color = FlxColor.MAGENTA;
		if (RegCustom._capturing_units_number[Reg._tn] == 8) _color = FlxColor.ORANGE;
		if (RegCustom._capturing_units_number[Reg._tn] == 9) _color = FlxColor.PINK;	 
		if (RegCustom._capturing_units_number[Reg._tn] == 10) _color = FlxColor.PURPLE;
		if (RegCustom._capturing_units_number[Reg._tn] == 11) _color = FlxColor.RED;
		if (RegCustom._capturing_units_number[Reg._tn] == 12) _color = FlxColor.YELLOW;
		if (RegCustom._capturing_units_number[Reg._tn] == 13) _color = FlxColor.WHITE;
		return _color;
	}
	
	public static function background_scene_color():FlxColor
	{
		var _color:FlxColor = 0xFF555555;
		var _num = FlxG.random.int(1, 10);
		
		switch(_num)
		{
			case 1: _color = 0xFF40160d; // brown.
			case 2: _color = 0xFF1c400d; // dark green.
			case 3: _color = 0xFF374008; // greenish yellow. 
			case 4: _color = 0xFF0c0d42; // dark blue.
			case 5: _color = 0xFF888820; // yellow.
			case 6: _color = 0xFF208820; // green.
			case 7: _color = 0xFF202088; // blue.
			case 8: _color = 0xFF882020; // red.
			case 9: _color = 0xFF220022; // purple.
			case 10: _color = 0xffff00ff; // pink.
		}
		
		return _color;
	}
	
	/******************************
	 * chess game board piece set color.
	 */
	public static function draw_update_board_p1_set_color():FlxColor
	{
		var _color:FlxColor = 0xFFffffff;
		
		switch(RegCustom._chess_set_for_player1_color_number[Reg._tn])
		{
			 case 1: _color = 0xFFffffff;
			 case 2: _color = 0xFF800080;			 
			 case 3: _color = 0xFF800015;			 
			 case 4: _color = 0xFF801e00;			 
			 case 5: _color = 0xFF805200;
			 case 6: _color = 0xFF807c00;
			 case 7: _color = 0xFF368000;			 
			 case 8: _color = 0xFF00802a;			 
			 case 9: _color = 0xFF007b80;			 
			case 10: _color = 0xFF004880;
			case 11: _color = 0xFF001580;
			case 12: _color = 0xFF000000;
			case 13: _color = 0xFF555555;
		}

		return _color;
	}
	
	/******************************
	 * chess game board piece set color.
	 */
	public static function draw_update_board_p2_set_color():FlxColor
	{
		var _color:FlxColor = 0xFFffffff;
		
		switch(RegCustom._chess_set_for_player2_color_number[Reg._tn])
		{
			 case 1: _color = 0xFFffffff;
			 case 2: _color = 0xFF800080;			 
			 case 3: _color = 0xFF800015;			 
			 case 4: _color = 0xFF801e00;			 
			 case 5: _color = 0xFF805200;			 
			 case 6: _color = 0xFF807c00;
			 case 7: _color = 0xFF368000;			 
			 case 8: _color = 0xFF00802a;			 
			 case 9: _color = 0xFF007b80;			 
			case 10: _color = 0xFF004880;
			case 11: _color = 0xFF001580;
			case 12: _color = 0xFF000000;
			case 13: _color = 0xFF555555;
		}
		
		return _color;
	}
	
	public static function colorToggleUnitsOdd(_id:Int):FlxColor
	{
		
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 2) _color = 0xFF800080;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 3) _color = 0xFF800015;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 4) _color = 0xFF801e00;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 5) _color = 0xFF805200;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 6) _color = 0xFF807c00;		
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 7) _color = 0xFF368000;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 8) _color = 0xFF00802a;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 9) _color = 0xFF007b80;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 10) _color = 0xFF004880;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 11) _color = 0xFF001580;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 12) _color = 0xFF000000;
		if (RegCustom._gameboard_units_odd_color_number[Reg._tn][_id] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	/******************************
	 * changes the color of game board units.
	 */
	public static function colorToggleUnitsEven(_id:Int):FlxColor
	{		
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 2) _color = 0xFF800080;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 3) _color = 0xFF800015;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 4) _color = 0xFF801e00;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 5) _color = 0xFF805200;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 6) _color = 0xFF807c00;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 7) _color = 0xFF368000;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 8) _color = 0xFF00802a;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 9) _color = 0xFF007b80;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 10) _color = 0xFF004880;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 11) _color = 0xFF001580;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 12) _color = 0xFF000000;
		if (RegCustom._gameboard_units_even_color_number[Reg._tn][_id] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	public static function color_client_background_defaults():FlxColor
	{
		if (CID2._text_client_background_brightness == null)
			return 0xFFFFFFFF;
			
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 1) 
			_color = 0xFFFFFFFF;
				
		if (RegCustom._client_background_image_number[Reg._tn] == 2)
			_color = 0xFF800080;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 3)
			_color = 0xFF800015;
			
		if (RegCustom._client_background_image_number[Reg._tn] == 4) 
			_color = 0xFF801e00;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 5) 
			_color = 0xFF805200;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 6) 
			_color = 0xFF807c00;
			
		if (RegCustom._client_background_image_number[Reg._tn] == 7) 
			_color = 0xFF368000;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 8)
			_color = 0xFF00802a;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 9) 
			_color = 0xFF007b80;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 10)
			_color = 0xFF004880;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 11) 
			_color = 0xFF001580;
				
		if (RegCustom._client_background_image_number[Reg._tn] == 12) 
			_color = 0xFF000000;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 13)
			_color = 0xFF555555;
		
		return _color;
	}
	
	public static function color_client_background():FlxColor
	{
		if (Reg._at_configuration_menu == true 
		&&	CID2._text_client_background_brightness == null)
			return 0xFFFFFFFF;
			
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 1) 
			_color = 0xFFFFFFFF;			
		
		if (RegCustom._client_background_image_number[Reg._tn] == 2)
			_color = 0xFF800080;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 3)
			_color = 0xFF800015;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 4) 
			_color = 0xFF801e00;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 5) 
			_color = 0xFF805200;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 6) 
			_color = 0xFF807c00;
			
		if (RegCustom._client_background_image_number[Reg._tn] == 7) 
			_color = 0xFF368000;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 8)
			_color = 0xFF00802a;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 9) 
			_color = 0xFF007b80;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 10)
			_color = 0xFF004880;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 11) 
			_color = 0xFF001580;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 12) 
			_color = 0xFF000000;
		
		if (RegCustom._client_background_image_number[Reg._tn] == 13)
			_color = 0xFF555555;
		
		return _color;
	}
	
	public static function color_table_body_background():FlxColor
	{
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 1) 
			_color = 0xFFFFFFFF;			
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 2)
			_color = 0xFF800080;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 3)
			_color = 0xFF800015;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 4) 
			_color = 0xFF801e00;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 5) 
			_color = 0xFF805200;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 6) 
			_color = 0xFF807c00;
			
		if (RegCustom._table_body_background_image_number[Reg._tn] == 7) 
			_color = 0xFF368000;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 8)
			_color = 0xFF00802a;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 9) 
			_color = 0xFF007b80;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 10)
			_color = 0xFF004880;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 11) 
			_color = 0xFF001580;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 12) 
			_color = 0xFF000000;
		
		if (RegCustom._table_body_background_image_number[Reg._tn] == 13)
			_color = 0xFF555555;
		
		return _color;
	}
	
	public static function notation_panel_background_color():FlxColor
	{
		
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 6) _color = 0xFF807c00;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 9) _color = 0xFF007b80;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 11) _color = 0xFF001580;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._notation_panel_background_color_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}

	public static function notation_panel_text_color():FlxColor
	{		
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 6) _color = 0xFF807c00;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 9) _color = 0xFF007b80;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 11) _color = 0xFF001580;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._notation_panel_text_color_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	public static function gradient_color():FlxColor
	{		
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._gradient_background_image_number[Reg._tn] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 6) _color = 0xFF807c00;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 9) _color = 0xFF007b80;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 11) _color = 0xFF001580;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._gradient_background_image_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	public static function client_topic_title_text_color():FlxColor
	{		
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 6) _color = 0xFF807c00;		
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 9) _color = 0xFF007b80;		
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 11) _color = 0xFF001580;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._client_topic_title_text_color_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	public static function client_text_color():FlxColor
	{		
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._client_text_color_number[Reg._tn] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._client_text_color_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._client_text_color_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._client_text_color_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._client_text_color_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._client_text_color_number[Reg._tn] == 6) _color = 0xFF807c00;		
		if (RegCustom._client_text_color_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._client_text_color_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._client_text_color_number[Reg._tn] == 9) _color = 0xFF007b80;		
		if (RegCustom._client_text_color_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._client_text_color_number[Reg._tn] == 11) _color = 0xFF001580;
		if (RegCustom._client_text_color_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._client_text_color_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	public static function title_bar_text_color():FlxColor
	{		
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 6) _color = 0xFF807c00;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 9) _color = 0xFF007b80;		
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 11) _color = 0xFF001580;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._title_bar_text_color_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	/******************************
	 * button fill color is the color behind the button text.
	 */
	public static function button_colors():FlxColor
	{		
		var _color:FlxColor = 0xFFffffff;
		
		if (RegCustom._button_color_number[Reg._tn] == 1) _color = 0xFFffffff;
		if (RegCustom._button_color_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._button_color_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._button_color_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._button_color_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._button_color_number[Reg._tn] == 6) _color = 0xFF807c00;
		if (RegCustom._button_color_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._button_color_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._button_color_number[Reg._tn] == 9) _color = 0xFF007b80;		
		if (RegCustom._button_color_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._button_color_number[Reg._tn] == 11) _color = 0xFF001580;
		if (RegCustom._button_color_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._button_color_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	/******************************
	 * button border color.
	 */
	public static function button_border_colors():FlxColor
	{		
		var _color:FlxColor = 0xFFffffff;
		
		if (RegCustom._button_border_color_number[Reg._tn] == 1) _color = 0xFFffffff;
		if (RegCustom._button_border_color_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._button_border_color_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._button_border_color_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._button_border_color_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._button_border_color_number[Reg._tn] == 6) _color = 0xFF807c00;
		if (RegCustom._button_border_color_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._button_border_color_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._button_border_color_number[Reg._tn] == 9) _color = 0xFF007b80;		
		if (RegCustom._button_border_color_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._button_border_color_number[Reg._tn] == 11) _color = 0xFF001580;
		if (RegCustom._button_border_color_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._button_border_color_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	/******************************
	 * button text color.
	 */
	public static function button_text_colors():FlxColor
	{		
		var _color:FlxColor = 0xFFffffff;
		
		if (RegCustom._button_text_color_number[Reg._tn] == 1) _color = 0xFFffffff;
		if (RegCustom._button_text_color_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._button_text_color_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._button_text_color_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._button_text_color_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._button_text_color_number[Reg._tn] == 6) _color = 0xFF807c00;
		if (RegCustom._button_text_color_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._button_text_color_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._button_text_color_number[Reg._tn] == 9) _color = 0xFF007b80;		
		if (RegCustom._button_text_color_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._button_text_color_number[Reg._tn] == 11) _color = 0xFF001580;
		if (RegCustom._button_text_color_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._button_text_color_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
		
	public static function title_bar_background_color():FlxColor
	{
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._title_bar_background_number[Reg._tn] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._title_bar_background_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._title_bar_background_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._title_bar_background_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._title_bar_background_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._title_bar_background_number[Reg._tn] == 6) _color = 0xFF807c00;
		if (RegCustom._title_bar_background_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._title_bar_background_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._title_bar_background_number[Reg._tn] == 9) _color = 0xFF007b80;	
		if (RegCustom._title_bar_background_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._title_bar_background_number[Reg._tn] == 11) _color = 0xFF001580;	
		if (RegCustom._title_bar_background_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._title_bar_background_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
	public static function menu_bar_background_color():FlxColor
	{
		
		var _color:FlxColor = 0xFFFFFFFF;
		
		if (RegCustom._menu_bar_background_number[Reg._tn] == 1) _color = 0xFFFFFFFF;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 2) _color = 0xFF800080;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 3) _color = 0xFF800015;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 4) _color = 0xFF801e00;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 5) _color = 0xFF805200;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 6) _color = 0xFF807c00;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 7) _color = 0xFF368000;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 8) _color = 0xFF00802a;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 9) _color = 0xFF007b80;	
		if (RegCustom._menu_bar_background_number[Reg._tn] == 10) _color = 0xFF004880;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 11) _color = 0xFF001580;	
		if (RegCustom._menu_bar_background_number[Reg._tn] == 12) _color = 0xFF000000;
		if (RegCustom._menu_bar_background_number[Reg._tn] == 13) _color = 0xFF555555;
		
		return _color;
	}
	
}