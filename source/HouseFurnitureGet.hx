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
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

package;

/**
 * Menu used to buy a furniture item. 
 * @author kboardgames.com
 */
class HouseFurnitureGet extends FlxGroup
{
	/******************************
	 * menu background.
	 */
	public var _background:FlxSprite;
	
	/******************************
	 * the background behind the title. this does not move with boxScroller.
	 */
	public var _bgTitle:FlxSprite;
	
	/******************************
	 * title of the menu.
	 */
	public var _title:FlxText;
		
	/******************************
	* anything added to this group will be placed inside of the boxScroller field. 
	*/
	private static var _group:FlxSpriteGroup;	
	
	/******************************
	 * An area of the screen that has automatic scrollbars, if needed.
	 */
	public var __boxscroller:FlxScrollableArea;	
	
	/******************************
	 * used to display the next button or next text data underneath the previous button or text. without this var, the texts, images and buttons would all be displayed at the same line.
	 */
	private var _height:Float;
	
	/******************************
	 * the boxScroller would not work without at least one sprite added to the boxScrollerGroup.
	 */
	private	var _box:FlxSprite;
	
	/******************************
	 * instance of the main house class.
	 */
	public var __house:House; 
			
	/******************************
	 * used to position the sprites.
	 */
	private var _offset_y:Int = 440;

	/******************************
	 * the name of the item (furniture).
	 */
	private var _text:FlxText; 
	
	/******************************
	 * UI class for coins to be drawn on the screen.
	 */
	private var _coins:FlxText;
	
	/******************************
	 * access members here.
	 */
	public var _group_sprite:Array<FlxSprite> = [];
	
	/******************************
	 * used to push members.
	 */
	private var _sprite:FlxSprite; 
	
	/******************************
	 * starts at 0.
	 */
	public static var _idCurrentItemPurchased:Int = 0;
	
	/******************************
	 * does player have enough coins to buy furniture.
	 */
	public static var _haveEnoughHouseCoins:Bool;
	
	override public function new(house:House):Void
	{
		super();
		
		_idCurrentItemPurchased = 0;
		
		__house = house;
			
		_background = new FlxSprite(0, 0);
		_background.makeGraphic(353,FlxG.height-45);
		_background.color = 0xFF002222;
		_background.scrollFactor.set(0, 0);
		add(_background);
		
		_group = cast add(new FlxSpriteGroup());		
		_group.setPosition(0, 0); // put the group off-screen
		
		// the boxScroller would not work without at least one sprite added to the boxScrollerGroup.
		_box = new FlxSprite();
		_box.makeGraphic(1, 1, FlxColor.BLACK);
		_box.setPosition(0, 0);
		add(_box);
		_group.add(_box);			
		
		//--------------------------
		var _idSprite:Int = 1;
		
		for (i in 0...200)
		{
			if (RegHouse._namesCanPurchase[i] != null)
			{
				_text = new FlxText(17, (i * 200) + _offset_y - 48, 0, RegHouse._namesCanPurchase[i] + ".");
				_text.fieldWidth = 240;
				_text.setFormat(Reg._fontDefault, 22, FlxColor.CYAN);
				_text.x = -10 + (373 / 2) - _text.width / 2; // -10 is scrollbar width. 373 is scene width - map width.
				_group.add(_text);
				
				_coins = new FlxText(68, (i * 200) + _offset_y + 40, 0, "$"+Std.string(RegHouse._coins[i]));
				_coins.setFormat(Reg._fontDefault, 35, FlxColor.ORANGE);
				_group.add(_coins);
			
				// load the furniture images.
				_sprite = new FlxSprite();
				_sprite.loadGraphic("assets/images/house/furniture/get/" + i + ".png", true, 100, 100);
				_group.add(_sprite);
				
				// add this member to _group_sprite.			
				_group_sprite.push(_sprite);
							
				// position this image on scene.
				_group_sprite[i].setPosition(175, (i * 200) + _offset_y);
				
				// give this member an id. this id is used to move members in z-order.
				_group_sprite[i].ID = _idSprite;
				
				_group_sprite[i].animation.add("0", [0], 30, false);
				_group_sprite[i].animation.add("1", [1], 30, false);
				_group_sprite[i].animation.play("0");
				
				_idSprite += 1;
				
				_group.add(_group_sprite[i]);
			}
			
			else
			{
				_text = new FlxText(17, (i * 200) + _offset_y - 48, 0, "Empty Unit #" + Std.string(i+1));
				_text.setFormat(Reg._fontDefault, 22, FlxColor.CYAN);
				_text.x = -10 + (373 / 2) - _text.width / 2; // -10 is scrollbar width. 373 is scene width - map width.
				_group.add(_text);
							
				// load the furniture images.
				_sprite = new FlxSprite();
				_sprite.loadGraphic("assets/images/houseItem.png", false, 100, 100);
				_group.add(_sprite);
				
				// add this member to _group_sprite.			
				_group_sprite.push(_sprite);
							
				// position this image on scene.
				_group_sprite[i].setPosition(175, (i * 200) + _offset_y);
				
				// give this member an id. this id is used to move members in z-order.
				_group_sprite[i].ID = _idSprite;
				
				_idSprite += 1;
				
				_group.add(_group_sprite[i]);
			}
			
		}
	
		// the scrollbar is needed or else there will be a client crash when a request for the scrollbar is made.
		var _buttonForScrollBar = new ButtonGeneralNetworkNo(0, (((RegHouse._totalCanPurchase + 1 ) * 200) + 100) + _offset_y, "", 160 + 15, 35, Reg._font_size, RegCustom._button_text_color, 0, null, RegCustom._button_color);
		_buttonForScrollBar.label.font = Reg._fontDefault;
		_buttonForScrollBar.visible = false;
		_group.add(_buttonForScrollBar);
		
		// make a scrollbar-enabled camera for it (a FlxScrollableArea)	
		if (__boxscroller != null) FlxG.cameras.remove(__boxscroller);
		__boxscroller = new FlxScrollableArea( new FlxRect( 0, 0, 373, FlxG.height-50), new FlxRect( 0, 0, 350, 199 * 200), ResizeMode.NONE, 444, 100, -1, FlxColor.LIME, null, 100, true);
		add(__boxscroller);
		
		fixScrollbarElementOffsetY();
				
		FlxG.cameras.add( __boxscroller );
		__boxscroller.antialiasing = true;
		__boxscroller.pixelPerfectRender = true;
		
		_bgTitle = new FlxSprite(0, 0);
		_bgTitle.makeGraphic(353, 60);
		_bgTitle.scrollFactor.set();
		_bgTitle.color = 0xFF002222;
		add(_bgTitle);
		
		_title = new FlxText(17, 30, 0, "Furniture Get");
		_title.setFormat(Reg._fontDefault, 22, FlxColor.WHITE);
		_title.scrollFactor.set();
		add(_title);
		
		
	}

	override public function destroy()
	{		
		if (_background != null)
		{
			_background.destroy();
			_background = null;
		}
		
		if (_bgTitle != null)
		{
			_bgTitle.destroy();
			_bgTitle = null;
		}
		
		if (_title != null)
		{
			_title.destroy();
			_title = null;
		}		
		
		if (_group != null)
		{
			_group.destroy();
			_group = null;
		}
		
		if (_box != null)
		{
			_box.destroy();
			_box = null;
		}
		
		if (_text != null)
		{
			_text.destroy();
			_text = null;
		}
		
		if (_coins != null)
		{
			_coins.destroy();
			_coins = null;
		}
		
		if (_sprite != null)
		{
			_sprite.destroy();
			_sprite = null;
		}
		
		if (__boxscroller != null)
		{
			cameras.remove(__boxscroller);
			__boxscroller.destroy();
			__boxscroller = null;
		}
		
		
		super.destroy();
	}
	
	override public function update(elapsed:Float):Void
	{
		// if player returned to lobby then this var is false so don't update().
		if (Reg._at_house == false) return;
		if (RegHouse._house_main_menu_button_number != 0) return;
		
		// highlight item if mouse is hovering over it.
		for (i in 0...RegHouse._totalCanPurchase+1)
		{
			if (ActionInput.coordinateX() - HouseScrollMap._map_offset_x > _group_sprite[i].x
			&&  ActionInput.coordinateX() - HouseScrollMap._map_offset_x < _group_sprite[i].x + 100
			&&  ActionInput.coordinateY() - HouseScrollMap._map_offset_y + __boxscroller.scroll.y > _group_sprite[i].y
			&&  ActionInput.coordinateY() - HouseScrollMap._map_offset_y + __boxscroller.scroll.y < _group_sprite[i].y + 100)
			{
				_group_sprite[i].animation.play("1");
				
				
				if (ActionInput.justPressed() == true)
				{
					if (RegCustom._enable_sound == true
					&&  Reg2._boxScroller_is_scrolling == false)
						FlxG.sound.play("click", 1, false);
				}
					
				if (ActionInput.justReleased() == true)
					buyingFurnitureItemConfirm(i);
				
			}
			
			else _group_sprite[i].animation.play("0");
		}
		
		if (Reg._buttonCodeValues != "") buttonCodeValues();
		
		super.update(elapsed);
	}	
	
	/******************************
	 * at the time a button is created, a Reg._buttonCodeValues will be given a value. that value is used here to determine what block of code to read. 
	 * a Reg._yesNoKeyPressValueAtMessage with a value of one means that the "yes" button was clicked. a value of two refers to button with text of "no". 
	 */
	public function buttonCodeValues():Void
	{
		// buying a furniture item.
		if (Reg._yesNoKeyPressValueAtMessage == 1 && Reg._buttonCodeValues == "f1000")
		{
			Reg._buttonCodeValues = ""; // do not enter this block of code the second time.
			Reg._yesNoKeyPressValueAtMessage = 0; // no button is clicked.
		
			RegTypedef._dataStatistics._houseCoins -= RegHouse._coins[_idCurrentItemPurchased];
			
			RegHouse._totalPurchased += 1;

			if (RegHouse._namesPurchased[0] == null)
			{
				RegHouse._namesPurchased.push("");
				RegHouse._namesPurchased[0] = "No item selected.";
				RegHouse._namesPurchased.push("");
			}
			
			if (RegHouse._namesPurchased[0] != "No item selected.")
			{
				RegHouse._namesPurchased.unshift("No item selected.");
			}
			
			RegHouse._namesPurchased[RegHouse._totalPurchased+1] = RegHouse._namesCanPurchase[_idCurrentItemPurchased];
			RegHouse._namesPurchased.push("");
			
			RegHouse._sprite_number[RegHouse._totalPurchased] = _idCurrentItemPurchased;
			
			RegTriggers._furnitureItemSpriteAddToMapFront = true;
			RegTriggers._furnitureItemSpriteAddToMapBack = true;
			
			RegTriggers._furnitureItemSpriteAddToPutPanel = true;
			
			RegTypedef._dataPlayers._house_items_daily_total += 1;
		}
		
		if (Reg._yesNoKeyPressValueAtMessage > 1 && Reg._buttonCodeValues == "f1000")
		{
			Reg._buttonCodeValues = ""; // do not enter this block of code the second time.
			Reg._yesNoKeyPressValueAtMessage = 0; // no button is clicked.
		}
		
		// not enough house coins to buy a furniture item.
		// buying a furniture item.
		if (Reg._yesNoKeyPressValueAtMessage == 1 && Reg._buttonCodeValues == "f1010")
		{
			Reg._buttonCodeValues = ""; // do not enter this block of code the second time.
			Reg._yesNoKeyPressValueAtMessage = 0; // no button is clicked.
		
		}	
		
		if (Reg._yesNoKeyPressValueAtMessage > 1 && Reg._buttonCodeValues == "f1010")
		{
			Reg._buttonCodeValues = ""; // do not enter this block of code the second time.
			Reg._yesNoKeyPressValueAtMessage = 0; // no button is clicked.
		}
		
	}
	
	/******************************
	 * 
	 * @param	id		id number of the furniture item that was selected.
	 */
	private function buyingFurnitureItemConfirm(id:Int):Void
	{
		_idCurrentItemPurchased = id;
		
		Reg._messageId = 6001;
		
		_haveEnoughHouseCoins = false;		
		
		// check to see if player has enough cash.
		if (RegTypedef._dataStatistics._houseCoins - RegHouse._coins[_idCurrentItemPurchased] >= 0)
		{
			_haveEnoughHouseCoins = true;
			Reg._buttonCodeValues = "f1000";
		}
		
		else Reg._buttonCodeValues = "f1010";
				
		SceneGameRoom.messageBoxMessageOrder();

	}
	
	public function fixScrollbarElementOffsetY():Void
	{
		// might need to recreate the scrollbar to bring it back up.
		
		// this is needed to set the group at the top of the panel. boxScroller.scroll.y changes in value when its content changes. The result would be group.y value offsetting at boxScroller. 		
		_group.y = __boxscroller.scroll.y - 260; // _offset_y;
			
		// now that the top of the boxScroller is fixed we need to set this so that the last element is correctly displayed. without this code the last element would not be seen or may be seen party cut off at the bottom of the boxScroller.
		__boxscroller.content.height += Std.int(__boxscroller.scroll.y) + _offset_y;
	}
	
}//