package core.key
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	/**
	 * Keeps track of buttons that are held down on the keyboard
	 * @author SEG.Veenstra
	 */
	public class Key extends Sprite 
	{
		// Define some static constants for easy usage
		public static const ARROW_LEFT:uint = 37;
		public static const ARROW_RIGHT:uint = 39;
		public static const ARROW_UP:uint = 38;
		public static const ARROW_DOWN:uint = 40;
		public static const SPACEBAR:uint = 32;
		public static const ENTER:uint = 13;
		public static const ESCAPE:uint = 27;
		
		// Object wich stores all the currently pressed keys
		private static var Keys:Object;
		
		public function Key() 
		{
			Keys = new Object();
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		private function onAddToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			delete Keys[e.keyCode];
		}
		
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			Keys[e.keyCode] = true;
			trace(e.keyCode);
		}
		
		public static function isDown(key:uint):Boolean
		{
			return Keys[key] ? true : false;
		}
	}

}