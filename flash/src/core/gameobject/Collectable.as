package core.gameobject 
{
	import flash.geom.Rectangle;
	import starling.display.Shape;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Collectable extends GameObject 
	{
		private var shape:Shape;
		
		public function Collectable(id:String, x:Number, y:Number) 
		{
			super(id, x, y);
			Draw(4 * 16, 4*16);
			collider = new Rectangle(x,y,4*16,4*16);
			solid = false;
		}
		
		protected function Draw(width:Number,height:Number):void 
		{	
			shape = new Shape();
			shape.graphics.beginFill(0xFFB300, 0.6);
			shape.graphics.drawRect(0, 0, width, height);
			shape.graphics.endFill();
			
			addChild(shape);
		}
	}

}