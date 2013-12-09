package core.screen 
{
	import core.key.Key;
	import core.level.Level;
	import core.menu.Menu;
	import core.ui.UserInterface;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import game.screens.GameOverScreen;
	import game.screens.PauseScreen;
	import starling.events.EnterFrameEvent;
	import starling.events.KeyboardEvent;
	/**
	 * A Screen that represents a level ofthe Game.
	 * @author SEG.Veenstra
	 */
	public class GameScreen extends Screen 
	{
		private const CAMERA_SPEED:int = 20;
		
		private var _level:Level;
		private var _userInterface:UserInterface;
		private var _pause:Boolean = false;
		
		private var _pauseScreen:PauseScreen;
		private var _gameOverScreen:GameOverScreen;
		
		private var cameraPoint:Point = new Point(0, 0);
		
		public function GameScreen(level:Level = null) 
		{
			trace('GameScreen loaded');
			if(level)
				loadLevel(level);
			_userInterface = new UserInterface();
			_pauseScreen = new PauseScreen();
			_gameOverScreen = new GameOverScreen();
			addChild(_userInterface);
			addChild(_gameOverScreen);
			addChild(_pauseScreen);
			addEventListener(EnterFrameEvent.ENTER_FRAME, OnEnterFrame);
		}
		
		private function OnEnterFrame(e:EnterFrameEvent):void 
		{
			if (active && !paused && level.player)
			{
				cameraPoint.x = level.player.x;
				cameraPoint.y = level.player.y;
					
				if (cameraPoint.x < stage.stageWidth / 2)
					cameraPoint.x = stage.stageWidth / 2;
				else if (cameraPoint.x > level.width -stage.stageWidth / 2)
					cameraPoint.x = level.width -stage.stageWidth / 2;
				if (cameraPoint.y < stage.stageHeight / 2)
					cameraPoint.y = stage.stageHeight / 2;
				else if (cameraPoint.y > level.height -stage.stageHeight / 2)
					cameraPoint.y = level.height -stage.stageHeight / 2;
					
				level.x -= ((level.x - stage.stageWidth / 2) + cameraPoint.x) / CAMERA_SPEED;
				level.y -= ((level.y - stage.stageHeight / 2) + cameraPoint.y) / CAMERA_SPEED;
				
			}
		}
		
		public function get userInterface():UserInterface
		{
			return _userInterface;
		}
		
		public function get level():Level
		{
			return _level;
		}
		
		public function get paused():Boolean
		{
			return _pause;
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
			if (!level.paused)
			{
				if (e.keyCode == Key.PAUSE)
				{
					Pause();
				}
			}
			if (_pauseScreen.active)
				_pauseScreen.Control(e);
		}
		
		/**
		 * Pause the GameScreen
		 */
		override public function Pause():void 
		{
			super.Pause();
			level.Pause();
			_pauseScreen.active = true;
			_pauseScreen.activeItemPosition = 0;
			setChildIndex(_pauseScreen, numChildren -1);
			_pause = true;
		}
		
		/**
		 * Play the Screen
		 */
		override public function Play():void 
		{
			super.Play();
			level.Play();
			_pauseScreen.active = false;
			setChildIndex(level, numChildren -2);
			setChildIndex(userInterface, numChildren -1);
			_pause = false;
		}
		
		override public function Reset():void 
		{
			super.Reset();
			var c:Class = Class(getDefinitionByName(getQualifiedClassName(Game.gameScreen.level)));
			loadLevel(new c);
			Play();
		}
		
		/**
		 * Show game over screen
		 */
		public function GameOver():void
		{
			super.Pause();
			level.Pause();
			_gameOverScreen.active = true;
			_pause = true;
		}
	}

}