package core.gameobject 
{
	import core.gameobject.collectable.Item;
	import core.gameobject.collectable.Key;
	import core.level.Level;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Shape;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Door extends GameObject 
	{
		public var exitLeft:Door;
		public var exitRight:Door;
		public var exitUp:Door;
		public var exitDown:Door;
		
		public var requiredKey:Key;
		public var locked:Boolean;
		
		private var _closedImage:Image;
		private var _openImage:Image;
		
		private var _open:Boolean = false;
		
		public function Door(id:String, x:Number, y:Number,locked:Boolean = false, requiredKey:Key = null)
		{
			super(id, x, y);
			Draw(64, 112);
			x *= Level.GRIDSIZE;
			y *= Level.GRIDSIZE;
			collider = new Rectangle(x,y,64, 112);
			solid = false;
			this.locked = locked;
			this.requiredKey = requiredKey;
		}
		
		protected function Draw(width:Number,height:Number):void 
		{	
			debugShape = new Shape();
			debugShape.graphics.beginFill(0x990099, 0.6);
			debugShape.graphics.drawRect(0, 0, width, height);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
		
		public function set open(setting:Boolean):void
		{
			if (_openImage)
				_openImage.visible = setting;
			if (_closedImage)
				_closedImage.visible = !setting;
		}
		
		public function get open():Boolean
		{
			return _open;
		}
		
		public function set openImage(image:Image):void
		{
			addChild(image);
			_openImage = image;
			if (open) image.visible = true;
		}
		
		public function set closedImage(image:Image):void
		{
			addChild(image);
			_closedImage = image;
			if (open) image.visible = false;
		}
		
		public function SetExits(exitLeft:Door = null, exitRight:Door = null, exitUp:Door = null,exitDown:Door = null):void 
		{
			this.exitDown = exitDown;
			this.exitUp = exitUp;
			this.exitLeft = exitLeft;
			this.exitRight = exitRight;
		}
		
		public function Unlock(key:Key):void
		{
			if (key == requiredKey)
			{
				locked = false;
				requiredKey = null;
			}
			else
				trace('The provided key is invalid!');
		}

	}

}