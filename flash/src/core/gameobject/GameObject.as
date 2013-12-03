package core.gameobject 
{
	import flash.geom.Rectangle;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * Is an object that can be placed into a level
	 * @author SEG.Veenstra
	 */
	public class GameObject extends Sprite 
	{
		public var id:String;
		public var collider:Rectangle;
		private var _active:Boolean = true;
		private var _paused:Boolean = true;
		public var solid:Boolean = false;
		
		public function GameObject(id:String, x:Number, y:Number)
		{
			this.id = id;
			this.x = x;
			this.y = y;
			
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		/**
		 * Set the active field of this GameObject, if set to false, this object should no longer do something
		 */
		public function set active(setting:Boolean):void
		{
			_active = setting;
		}
		
		public function get active():Boolean
		{
			return _active;
		}
		
		public function get paused():Boolean
		{
			return _paused;
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
			return collider.intersects(gameObject.collider);
		}
		
		/**
		 * Pause this game object so it will no longer move
		 */
		public function Pause():void
		{
			_paused = true;
		}
		
		/**
		 * Continues to Play this GameObject
		 */
		public function Play():void
		{
			_paused = false;
		}
		
		/**
		 * Resets this GameObject to it's first state
		 */
		public function Reset():void
		{
			
		}
		
	}

}