package core.screen 
{
	import core.menu.Menu;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	/**
	 * Can be extended to create custom MenuScreens
	 * @author SEG.Veenstra
	 */
	public class MenuScreen extends Screen 
	{
		public var _current:Menu;
		
		public function MenuScreen(startMenu:Menu)
		{
			trace('MenuScreen loaded');
			loadMenu(startMenu);
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		/**
		 * Handle the keyboardEvent that was passed on by game
		 * @param	e
		 */
		override public function Control(e:KeyboardEvent):void 
		{
			current.Control(e);
		}
		
		/**
		 * Returns the current loaded menu
		 */
		public function get current():Menu
		{
			return _current;
		}
		
		/**
		 * Load a a menu
		 * @param	menu
		 */
		public function loadMenu(menu:Menu):void
		{
			if (current)
			{
				removeChild(current);
			}
			_current = menu;
			addChild(menu);
		}
	}

}