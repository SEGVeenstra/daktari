package core.gameobject 
{
	import core.collision.Collider;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * Is an object that can be placed into a level
	 * @author SEG.Veenstra
	 */
	public class GameObject extends Sprite 
	{
		public var id:String;
		public var collider:Collider;
		public var active:Boolean = false;
		
		public function GameObject(id:String, x:Number, y:Number, width:Number, height:Number) 
		{
			this.id = id;
			this.x = x;
			this.y = y;
			
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			
		}
		
		/**
		 * Checks if this GameObject collides with the given GameObject
		 * @param	gameObject to check collision with
		 * @return 	TRUE or FALSE depending on if this GameObject hits the other GameObject
		 */
		public function Collide(gameObject:GameObject):Boolean
		{
			return collider.Collide(gameObject.collider);
		}
		
	}

}