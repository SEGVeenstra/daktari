package core.gameobject 
{
	import core.level.Level;
	import flash.geom.Rectangle;
	import starling.display.Shape;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Finish extends GameObject 
	{
		
		public function Finish(id:String, x:Number,y:Number, width:Number,height:Number) 
		{
			super(id, x, y);
			solid = false;
			width *= Level.GRIDSIZE;
			height *= Level.GRIDSIZE;
			x *= Level.GRIDSIZE;
			y *= Level.GRIDSIZE;
			collider = new Rectangle(x,y, width , height);
			Draw(width,height);
		}
		
		private function Draw(width:Number, height:Number):void
		{
			debugShape = new Shape();
			debugShape.graphics.beginFill(0xFF7DD4, 0.6);
			debugShape.graphics.drawRect(0, 0, width, height);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
	}

}