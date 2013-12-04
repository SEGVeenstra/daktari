package core.level 
{
	import core.gameobject.Character;
	import core.gameobject.GameObject;
	import starling.display.Sprite;
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
		
		private var _active:Boolean = true;
		private var _paused:Boolean = false;
		
		public function Level() 
		{
			Build();
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		/**
		 * Build the level by creating and adding GameObjects, Backgrounds etc
		 */
		protected function Build():void
		{
			
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
		 * Resets the level to the start
		 */
		public function Reset():void
		{
			
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