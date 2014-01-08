package core.gameobject 
{
	import core.level.Level;
	import flash.geom.Rectangle;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	/**
	 * Is an object that can be placed into a level
	 * @author SEG.Veenstra
	 */
	public class GameObject extends Sprite 
	{
		public var debugShape:Shape;
		private var debugId:TextField = new TextField(150, 24, '' , 'Ariel', 12, 0 , false);
		
		public var id:String;
		public var collider:Rectangle = new Rectangle(0, 0, 10, 10);;
		private var _startX:Number;
		private var _startY:Number;
		private var _active:Boolean = true;
		private var _paused:Boolean = true;
		public var solid:Boolean = false;
		
		public function GameObject(id:String, gridX:Number, gridY:Number)
		{
			this.id = id;
			debugId.text = id;
		//	addChild(debugId);
			debugId.y -= 16;
			debugId.hAlign = 'left';
			_startX = gridX;
			_startY = gridY;
			x = _startX * Level.GRIDSIZE;
			y = _startY * Level.GRIDSIZE;
			Create();
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		/**
		 * Creates the object (Collider & Shape)
		 */
		protected function Create():void
		{
			
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
		
		/**
		 * A function that gets called on interaction
		 */
		public function Interact():void
		{
			
		}
		
	}

}