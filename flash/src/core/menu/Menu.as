package core.menu 
{
	import core.menu.menuobject.MenuObject;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Menu extends Sprite 
	{
		public var title:String;
		protected var menuObjects:Vector.<MenuObject> = new Vector.<MenuObject>();
		
		public function Menu(title:String) 
		{
			
		}
		
		public function AddMenuObject(menuObject:MenuObject):void
		{
			
		}
		
	}

}