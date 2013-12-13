package core.gameobject 
{
	import game.objects.Key;
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
			debugShape = new Shape();
			debugShape.graphics.beginFill(0x990099, 0.6);
			debugShape.graphics.drawRect(0, 0, width, height);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
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
				requiredKey = null;
			else
				trace('The provided key is invalid!');
		}
	}

}