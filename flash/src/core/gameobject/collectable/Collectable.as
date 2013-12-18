package core.gameobject.collectable 
{
	import core.gameobject.GameObject;
	import core.level.Level;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Shape;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Collectable extends GameObject 
	{
		public var art:Image;
		
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
			debugShape = new Shape();
			debugShape.graphics.beginFill(0xFFB300, 0.6);
			debugShape.graphics.drawRect(0, 0, width * Level.GRIDSIZE, height * Level.GRIDSIZE);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
	}

}