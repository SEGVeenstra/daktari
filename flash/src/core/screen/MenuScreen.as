package core.screen 
{
	import core.screen.subscreen.Menu;
	
	/**
	 * Can be extended to create custom MenuScreens
	 * @author SEG.Veenstra
	 */
	public class MenuScreen extends Screen 
	{
		public var menu:Menu;
		
		public function MenuScreen(menu:Menu = null)
		{
			trace('MenuScreen loaded');
			if (this.menu)
				loadMenu(menu);
		}
		
		public function loadMenu(menu:Menu):void
		{
			if (menu)
				removeChild(this.menu);
			this.menu = menu;
			addChild(menu);
		}
	}

}