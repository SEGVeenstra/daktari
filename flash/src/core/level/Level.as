package core.level 
{
	import core.comic.Comic;
	import core.gameobject.Character;
	import core.gameobject.GameObject;
	import core.visualobject.VisualObject;
	import flash.utils.getDefinitionByName;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import core.sound.SoundManager;
	import flash.media.Sound;
	
	/**
	 * Can be extended to create a new level
	 * @author SEG.Veenstra
	 */
	public class Level extends Sprite 
	{
		public static const GRIDSIZE:int = 16;
		
		public var gameObjects:Vector.<GameObject> = new Vector.<GameObject>();
		public var player:Character;
		public var background:Image;
		
		private var _active:Boolean = true;
		private var _paused:Boolean = false;
		
		public var levelWidth:Number;
		public var levelHeight:Number;
		
		private var _debug:Boolean =  true;
		
		private var _endingComic:Class;
		
		private var _backgroundmusic:String;
		
		public function Level(width:Number, height:Number) 
		{
			levelWidth = width * GRIDSIZE;
			levelHeight = height * GRIDSIZE;
			Build();
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		public function get endingComic():Class
		{
			return _endingComic;
		}
		
		public function SetEndingComic(comic:Class):void
		{
			_endingComic = comic;
		}
		
		public function get backgroundmusic():String {
			return _backgroundmusic;
		}
		
		public function set backgroundmusic(backgroundmusic:String):void {
			this._backgroundmusic = backgroundmusic;
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			addEventListener(EnterFrameEvent.ENTER_FRAME, OnEnterFrame);
		}
		
		private function OnEnterFrame(e:EnterFrameEvent):void 
		{
			if (_active && background)
			{
				var perWidth:Number =  (background.width-stage.stageWidth) / (width-stage.stageWidth);
				var perHeight:Number =  (background.height - stage.stageHeight) / (height - stage.stageHeight);
				background.x = x * perWidth;
				background.y = y * perHeight;
			}
		}
		
		public function set debug(setting:Boolean):void
		{
			if (_debug != setting)
			{

					for each(var g:GameObject in gameObjects)
					{
						g.debugShape.visible = setting;
					}
					player.debugShape.visible = setting;
			}
		}
		
		public function get debug():Boolean
		{
			return _debug;
		}
		
		protected function SetBackground(image:Image):void
		{
			if (background)
				Game.gameScreen.removeChild(background);
			background = image;
			Game.gameScreen.addChild(background);
			Game.gameScreen.setChildIndex(background, -1);
		}
		/**
		 * Build the level by creating and adding GameObjects, Backgrounds etc
		 */
		protected function Build():void
		{
			
		}
		
		/**
		 * returns the paused state
		 */
		public function get paused():Boolean
		{
			return _paused;
		}
		
		/**
		 * Add the given GameObject if the id is not yet used
		 * @param	gameObject
		 */
		public function AddGameObject(gameObject:GameObject):void
		{
			if (!GetGameObjectByID(gameObject.id))
			{
				trace('add to screen:', gameObject, gameObject.id);
				gameObjects.push(gameObject);
				addChild(gameObject);
			}
		}
		
		/**
		 * Add the given VisualObject to the level at the given grid x and y
		 * @param	visualObject
		 */
		public function AddVisualObject(visualObject:VisualObject, gridX:int, gridY:int):void
		{
			visualObject.x = gridX * GRIDSIZE;
			visualObject.y = gridY * GRIDSIZE;
			addChild(visualObject);
		}
		
		/**
		 * Removes a GameObject from the list and screen
		 * @param	o
		 */
		public function RemoveGameObject(o:GameObject):void
		{
			if (GetGameObjectByID(o.id))
			{
				trace('removed from screen:', o, o.id);
				gameObjects.splice(gameObjects.indexOf(o),1);
				removeChild(o);
			}
		}
		
		/**
		 * Get the GameObject with the given id
		 * @param	id
		 * @return	GameObject is found, else null
		 */
		public function GetGameObjectByID(id:String):GameObject
		{
			for each(var gameObj:GameObject in gameObjects)
			{
				if (gameObj.id == id)
					return gameObj;
			}
			return null;
		}
		
		/**
		 * Set the player for this level
		 * @param	player
		 */
		protected function SetPlayer(player:Character):void
		{
			if (!this.player)
			{
				this.player = player;
				addChild(player);
			}
		}
		
		/**
		 * Pauses the level by pausing/inactivating all GameObjects
		 */
		public function Pause(): void
		{
			for each(var gameObj:GameObject in gameObjects)
			{
				gameObj.Pause();
				player.Pause();
			}
		}
		
		/**
		 * Continues a paused/reseted game
		 */
		public function Play():void 
		{
			for each(var gameObj:GameObject in gameObjects)
			{
				gameObj.Play();
				player.Play();
			}
		}
		
	}

}