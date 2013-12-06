package core.gameobject 
{
	import core.level.Level;
	import flash.geom.Rectangle;
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
		
		private var shape:Shape;
		
		public var requiredKey:Key;
		
		public function Door(id:String, x:Number, y:Number) 
		{
			super(id, x, y);
			Draw(64, 112);
			x *= Level.GRIDSIZE;
			y *= Level.GRIDSIZE;
			collider = new Rectangle(x,y,64, 112);
			solid = false;
		}
		
		protected function Draw(width:Number,height:Number):void 
		{	
			shape = new Shape();
			shape.graphics.beginFill(0x990099, 0.6);
			shape.graphics.drawRect(0, 0, width, height);
			shape.graphics.endFill();
			
			addChild(shape);
		}
		
		public function SetExits(exitLeft:Door = null, exitRight:Door = null, exitUp:Door = null,exitDown:Door = null):void 
		{
			this.exitDown = exitDown;
			this.exitUp = exitUp;
			this.exitLeft = exitLeft;
			this.exitRight = exitRight;
		}
	}

}