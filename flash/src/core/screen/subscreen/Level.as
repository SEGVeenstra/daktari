package core.screen.subscreen 
{
	import core.gameobject.GameObject;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * Can be extended to create a new level
	 * @author SEG.Veenstra
	 */
	public class Level extends Sprite 
	{
		private var gameObjects:Vector.<GameObject>;
		public var active:Boolean;
		
		public function Level() 
		{
			GameObject = new Vector.<GameObject>();
			active = false;
			Build();
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			
			Play();
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
				gameObjects.push(gameObject);
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
				gameObj.id == id ? return gameObj;
			}
			return null;
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
				gameObj.active = false;
			}
		}
		
		/**
		 * Continues a paused/reseted game
		 */
		public function Play():void 
		{
			for each(var gameObj:GameObject in gameObjects)
			{
				gameObj.active = true;
			}
		}
		
	}

}