package core.menu.menuobject 
{
	import starling.display.Sprite;
	
	/**
	 * Main class for objects that can be added to a menu
	 * @author SEG.Veenstra
	 */
	public class MenuObject extends Sprite 
	{
		private var _id:String;
		
		public function MenuObject(id:String) 
		{
			_id = id;
		}
		
		public function get id():String
		{
			return _id;
		}
	}

}