package core.menu.menuobject 
{
	import starling.display.Sprite;
	import starling.text.TextField;
	
	/**
	 * Main class for objects that can be added to a menu
	 * @author SEG.Veenstra
	 */
	public class MenuObject extends Sprite 
	{
		private var _id:String;
		private var _active:Boolean = false;
		
		public function MenuObject(id:String) 
		{
			_id = id;
		}
		
		public function get id():String
		{
			return _id;
		}
		
		public function set active(setting:Boolean):void
		{
			_active = setting;
		}
		
		public function get active():Boolean
		{
			return _active;
		}
	}

}