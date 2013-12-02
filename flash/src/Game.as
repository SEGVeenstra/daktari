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
		
		private var _focus:Screen;
		
		private var _gameScreen:GameScreen;
		private var _menuScreen:MenuScreen;
		private var _movieScreen:MovieScreen;
		
		public function Game() 
		{
			instance = this;
			addChild(new Key());
			
			CreateScreens();
			
			// Load the first screen!
			focus = Game.menuScreen;
			
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function CreateScreens():void
		{
			_gameScreen = new GameScreen();
			_menuScreen = new MenuScreen();
			_movieScreen = new MovieScreen();
			
			addChild(_gameScreen);
			addChild(_menuScreen);
			addChild(_movieScreen);	
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		static public function get gameScreen():GameScreen
		{
			return instance._gameScreen;
		}
		
		static public function get menuScreen():MenuScreen
		{
			return instance._menuScreen;
		}
		
		static public function get movieScreen():MovieScreen
		{
			return instance._movieScreen;
		}
		
		/**
		 * Let the game focus on one of the 3 screens (Game.[gameScreen/menuScreen/movieScreen]
		 */
		public function set focus(screen:Screen):void
		{
			if (_focus != screen)
			{
				if (_focus)
					_focus.active = false
				_focus = screen;
				_focus.active = true;
			}
			else
				trace('tried to focus the already focussed screen!');
		}
		
		public function get focus():Screen
		{
			return _focus;
		}
		
	}

}