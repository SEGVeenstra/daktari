package core.menu 
{
	import core.key.Key;
	import core.menu.menuobject.MenuObject;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Menu extends Sprite 
	{
		private var _grid:int;
		private var _active:Boolean;
		protected var loop:Boolean = true;
		private var _activeItemPosition:int;
		private var _activeItem:MenuObject;
		
		protected var menuObjects:Vector.<MenuObject> = new Vector.<MenuObject>();
		
		public function Menu(grid:int = 1) 
		{
			this.grid = grid;
			
		}
		
		/**
		 * Set the grid
		 */
		public function set grid(gridWidth:int):void
		{
			if (gridWidth > 0)
				_grid = gridWidth;
			else
				trace('grid should be greater that 0');
		}
		
		/**
		 * return the grid
		 */
		public function get grid():int
		{
			return _grid;
		}
		
		/**
		 * Set the active state of this menu
		 */
		public function set active(setting:Boolean):void
		{
			_active = setting;
			visible = setting;
		}
		
		/**
		 * Returns the active state of this menu
		 */
		public function get active():Boolean
		{
			return _active;
		}
		
		/**
		 * Set the active item
		 */
		public function set activeItemPosition(position:int):void
		{
			var oldPos:int = activeItemPosition;
			
			var newPos:int = position % menuObjects.length;
			if (newPos < 0)
				newPos += menuObjects.length;
			
			menuObjects[oldPos].active = false;
			menuObjects[newPos].active = true;
			_activeItemPosition = newPos;
			_activeItem = menuObjects[newPos];
		}
		
		/**
		 * Returns the active item position
		 */
		public function get activeItemPosition():int
		{
			return _activeItemPosition;
		}
		
		/**
		 * Return the  active item
		 */
		public function get activeItem():MenuObject
		{
			return _activeItem;
		}
		
		/**
		 * Adds an menu object
		 * @param	menuObject
		 * @param	x
		 * @param	y
		 */
		public function AddMenuObject(menuObject:MenuObject, x:Number = 0, y:Number = 0):void
		{
			for each(var m:MenuObject in menuObjects)
			{
				if (menuObject == m || menuObject.id == m.id)
					return;
			}
			menuObjects.push(menuObject);
			menuObject.x = x;
			menuObject.y = y;
			addChild(menuObject);
		}
		
		/**
		 * Get an added menuObject by it's id
		 * @param	id
		 * @return
		 */
		public function GetMenuObjectByID(id:String):MenuObject
		{
			for each(var m:MenuObject in menuObjects)
			{
				if (id == m.id)
					return m;
			}
			return null;
		}
		
		/**
		 * Handles the KeyboardEvent thats passed on by the screen
		 * @param	e
		 */
		public function Control(e:KeyboardEvent):void
		{
			if (e.keyCode == Key.ARROW_RIGHT)
				activeItemPosition += 1;
			if (e.keyCode == Key.ARROW_LEFT)
				activeItemPosition -= 1;
			if (e.keyCode == Key.ARROW_DOWN)
				activeItemPosition += grid;
			if (e.keyCode == Key.ARROW_UP)
				activeItemPosition -= grid;
		}
	}

}