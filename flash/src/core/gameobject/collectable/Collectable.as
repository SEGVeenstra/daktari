package core.gameobject.collectable 
{
	import core.gameobject.GameObject;
	import core.level.Level;
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
			solid = false;
		}
		
		override protected function Create():void 
		{
			Draw(4, 4);
			collider.x = x;
			collider.y = y;
			collider.width = 4 * Level.GRIDSIZE;
			collider.height = 4 * Level.GRIDSIZE;
		}
		
		protected function Draw(width:Number,height:Number):void 
		{	
			shape = new Shape();
			shape.graphics.beginFill(0xFFB300, 0.6);
			shape.graphics.drawRect(0, 0, width * Level.GRIDSIZE, height * Level.GRIDSIZE);
			shape.graphics.endFill();
			
			addChild(shape);
		}
	}

}