package core.level 
{
	import core.gameobject.Character;
	import core.gameobject.GameObject;
	import flash.utils.getDefinitionByName;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	
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
		
		public function Level(width:Number, height:Number) 
		{
			levelWidth = width * GRIDSIZE;
			levelHeight = height * GRIDSIZE;
			Build();
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
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