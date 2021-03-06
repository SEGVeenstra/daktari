package  
{
	import core.comic.Comic;
	import core.key.Key;
	import core.menu.Menu;
	import core.screen.GameScreen;
	import core.screen.MenuScreen;
	import core.screen.MovieScreen;
	import core.screen.Screen;
	import core.sound.SoundManager;
	import flash.media.Sound;
	import core.sound.Sounds;
	import game.screens.IntroScreen;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	/**
	 * Manages the screens and playerdata
	 * @author SEG.Veenstra
	 */
	public class Game extends Sprite 
	{	
		private static var instance:Game;
		
		private var _focus:Screen;
		private var _soundmanager:SoundManager;
		
		private var _gameScreen:GameScreen;
		private var _menuScreen:MenuScreen;
		private var _movieScreen:MovieScreen;
		
		public function Game() 
		{
			instance = this;
			
			addChild(new Key());
			
			CreateScreens();
			
			// Load the first screen!
			Game.focus = Game.menuScreen;
			
			//sounds
			instance._soundmanager = new SoundManager();
			Sounds.addAllSounds();
			
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			
			//instance._soundmanager.playSound('musiclevel1', 1, 10);
			
		}
		
		static public function get soundmanager():SoundManager
		{
			return instance._soundmanager;
		}
		
		/**
		 * Create the 3 different screens for Game, Menu and Movies
		 */
		private function CreateScreens():void
		{
			_gameScreen = new GameScreen();
			_menuScreen = new MenuScreen(new IntroScreen());
			_movieScreen = new MovieScreen();
			
			addChild(_gameScreen);
			addChild(_menuScreen);
			addChild(_movieScreen);
			
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Control);
		}

		/**
		 * Send the keyboard event to the current focussed screen
		 * @param	e
		 */
		private function Control(e:KeyboardEvent):void 
		{
			focus.Control(e);
		}
		
		/**
		 * Get the gameScreen
		 */
		static public function get gameScreen():GameScreen
		{
			return instance._gameScreen;
		}
		
		/**
		 * Get the menuScreen
		 */
		static public function get menuScreen():MenuScreen
		{
			return instance._menuScreen;
		}
		
		/**
		 * Get the movieScreen
		 */
		static public function get movieScreen():MovieScreen
		{
			return instance._movieScreen;
		}
		
		/**
		 * Load a comic
		 */
		static public function LoadComic(comic:Class):void
		{
			instance._soundmanager.stopAllSounds();
			instance._gameScreen.active = false;
			instance._menuScreen.active = false;
			instance._movieScreen.active = true;
			instance._movieScreen.LoadComic(new comic);
			instance._focus = instance._movieScreen;
		}
		
		/**
		 * Load a level
		 */
		static public function LoadLevel(level:Class):void
		{
			instance._soundmanager.stopAllSounds();
			instance._gameScreen.active = true;
			instance._menuScreen.active = false;
			instance._movieScreen.active = false;
			instance._focus = instance._gameScreen;
			instance._gameScreen.loadLevel(new level);
			instance._focus.active = true;
		}
		
		/**
		 * Load menu
		 */
		static public function LoadMenu(menu:Class):void
		{
			instance._soundmanager.stopAllSounds();
			instance._gameScreen.active = false;
			instance._menuScreen.active = true;
			instance._movieScreen.active = false;
			instance._focus = instance._menuScreen;
			instance._menuScreen.loadMenu(new menu);
			instance._soundmanager.playSound("menu", 1, 10);
		}
		
		/**
		 * Let the game focus on one of the 3 screens (Game.[gameScreen/menuScreen/movieScreen]
		 */
		static public function set focus(screen:Screen):void
		{
			if (instance._focus != screen)
			{
				if (instance._focus)
					instance._focus.active = false
				instance._focus = screen;
				instance._focus.active = true;
			}
			else
				trace('tried to focus the already focussed screen!');
		}
		
		/**
		 * Get the focussed screen
		 */
		public function get focus():Screen
		{
			return _focus;
		}
		
	}

}