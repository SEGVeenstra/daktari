package core.screen 
{
	import core.screen.subscreen.Level;
	import core.ui.UserInterface;
	/**
	 * A Screen that represents a level ofthe Game.
	 * @author SEG.Veenstra
	 */
	public class GameScreen extends Screen 
	{
		public var level:Level;
		public var userInterface:UserInterface;
		
		public function GameScreen(level:Level = null, userInterface:UserInterface = null) 
		{
			trace('GameScreen loaded');
			if(level)
				loadLevel(level);
			
		}
		
		public function loadLevel(level:Level):void
		{
			if (this.level)
				removeChild(this.level);
			addChild(level);
		}
	}

}