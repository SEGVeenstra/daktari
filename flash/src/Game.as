package  
{
	import core.screen.Screen;
	import game.screens.Intro;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * Manages the screens and playerdata
	 * @author SEG.Veenstra
	 */
	public class Game extends Sprite 
	{
		private static var instance:Game;
		
		public function Game() 
		{
			instance = this;
			
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			
			LoadScreen(new IntroScreen());
		}
		
		/**
		 * Loads the given Screen
		 * @param	screen The new Screen that needs to be loaded
		 */
		public static function LoadScreen(screen:Screen):void
		{
			if (Screen.current != screen)
			{
				if (Screen.current)
					instance.removeChild(Screen.current);
					
				instance.addChild(screen);
				Screen.current = screen;
			}
		}
		
	}

}