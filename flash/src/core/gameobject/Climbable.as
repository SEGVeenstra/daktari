package core.gameobject 
{
	import flash.geom.Rectangle;
	import starling.display.Shape;
	/**
	 * Creates an object that is climbable for the character
	 * @author SEG.Veenstra
	 */
	public class Climbable extends GameObject 
	{
		private var shape:Shape;
		
		public function Climbable(id:String, x:Number, y:Number, width:Number, height:Number) 
		{
			super(id, x, y);
			solid = false;
			collider = new Rectangle(x, y, width, height);
			Draw(width,height);
		}
		
		private function Draw(width:Number, height:Number):void
		{
			shape = new Shape();
			shape.graphics.beginFill(0x0000FF, 0.6);
			shape.graphics.drawRect(0, 0, width, height);
			shape.graphics.endFill();
			
			addChild(shape);
		}
	}

}