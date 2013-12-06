package core.screen 
{
	import core.key.Key;
	import core.level.Level;
	import core.ui.UserInterface;
	import flash.geom.Point;
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
		
		private var cameraPoint:Point = new Point(0, 0);
		
		public function GameScreen(level:Level = null) 
		{
			trace('GameScreen loaded');
			if(level)
				loadLevel(level);
			_userInterface = new UserInterface();
			addChild(_userInterface);
			addEventListener(EnterFrameEvent.ENTER_FRAME, OnEnterFrame);
		}
		
		private function OnEnterFrame(e:EnterFrameEvent):void 
		{
			if (active && !paused)
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
			_pause = true;
		}
		
		/**
		 * Play the Screen
		 */
		override public function Play():void 
		{
			super.Play();
			level.Play();
			_pause = false;
		}
	}

}