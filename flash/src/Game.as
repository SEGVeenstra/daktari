package  
{
	import core.key.Key;
	import core.screen.GameScreen;
	import core.screen.MenuScreen;
	import core.screen.MovieScreen;
	import core.screen.Screen;
	import starling.display.Sprite;
	import starling.events.Event;
	import test.TestLevel;
	
	/**
	 * Manages the screens and playerdata
	 * @author SEG.Veenstra
	 */
	public class Game extends Sprite 
	{	
		private static var instance:Game;
		public static const SCREEN_GAME:GameScreen = new GameScreen();
		public static const SCREEN_SCREEN:MenuScreen = new MenuScreen();
		
		public var focus:Screen;
		
		public var gameScreen:GameScreen;
		public var menuScreen:MenuScreen;
		public var movieScreen:MovieScreen;
		
		public function Game() 
		{
			instance = this;
			addChild(new Key());
			
			gameScreen = new GameScreen();
			menuScreen = new MenuScreen();
			movieScreen = new MovieScreen();
			
			addChild(gameScreen);
			addChild(menuScreen);
			addChild(movieScreen);			
			
			gameScreen.loadLevel(new TestLevel());
			
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		public function FocusScreen(screen:Screen):void
		{
			if (focus)
			{
				if (focus != screen)
				{
					focus.active = false;
					focus.visible = false;
					
					screen.visible = true;
					screen.active = true;
					focus = screen;
				}
			}
			else
			{
				focus = screen;
			}
		}
		
	}

}