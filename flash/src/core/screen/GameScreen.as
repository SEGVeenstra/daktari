package core.screen 
{
	import core.key.Key;
	import core.level.Level;
	import core.ui.UserInterface;
	import starling.events.KeyboardEvent;
	/**
	 * A Screen that represents a level ofthe Game.
	 * @author SEG.Veenstra
	 */
	public class GameScreen extends Screen 
	{
		private var _level:Level;
		private var _userInterface:UserInterface;
		
		public function GameScreen(level:Level = null) 
		{
			trace('GameScreen loaded');
			if(level)
				loadLevel(level);
			_userInterface = new UserInterface();
			addChild(_userInterface);
		}
		
		public function get userInterface():UserInterface
		{
			return _userInterface;
		}
		
		public function get level():Level
		{
			return _level;
		}
		
		/**
		 * Load a level in this screen
		 * @param	level
		 */
		public function loadLevel(level:Level):void
		{
			if (this.level)
				removeChild(this.level);
			addChild(level);
			this._level = level;
		}
		
		/**
		 * Handle the KeyboardEvent that was passed on by Game
		 * @param	e
		 */
		override public function Control(e:KeyboardEvent):void 
		{
			if (e.keyCode == Key.PAUSE)
				Pause();
			if (e.keyCode == Key.ENTER)
				Play();
		}
		
		/**
		 * Pause the GameScreen
		 */
		override public function Pause():void 
		{
			super.Pause();
			level.Pause();
		}
		
		/**
		 * Play the Screen
		 */
		override public function Play():void 
		{
			super.Play();
			level.Play();
		}
	}

}