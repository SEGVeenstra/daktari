package core.screen
{
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	
	/**
	 * Can be extended to create acustom screen for the Game to load
	 * @author SEG.Veenstra
	 */
	public class Screen extends Sprite 
	{
		
		private var _paused:Boolean = false;
		private var _active:Boolean = false;
		
		public function Screen()
		{
			visible = false;
		}
		
		public function set active(setting:Boolean):void
		{
			_active = setting;
			visible = setting;
		}
		
		/**
		 * Handle the KLeyboardEvent that was passed on by Game
		 * @param	e
		 */
		public function Control(e:KeyboardEvent):void 
		{
			
		}
		
		/**
		 * Returns the active value of this screen
		 */
		public function get active():Boolean
		{
			return _active;
		}
		
		/**
		 * Pause this screen
		 */
		public function Pause():void
		{
			_paused = true;
		}
		
		/**
		 * Play this screen
		 */
		public function Play():void
		{
			_paused = false;
		}
		
		/**
		 * Reset this screen
		 */
		public function Reset():void
		{
			trace('reset Screen:', this);
		}
	}

}