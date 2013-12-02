package core.screen
{
	import starling.display.Sprite;
	
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
		
		public function get active():Boolean
		{
			return _active;
		}
		
		public function Pause():void
		{
			_paused = true;
		}
		
		public function Play():void
		{
			_paused = false;
		}
		
		public function Reset():void
		{
			trace('reset Screen:', this);
		}
	}

}