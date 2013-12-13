package core.gameobject 
{
	import core.gameobject.collectable.Item;
	import core.level.Level;
	import flash.geom.Rectangle;
	import starling.display.Shape;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Enemy extends GameObject 
	{
		public var requiredItem:Item;
		public var damage:int;
		public var points:int;
		
		public function Enemy(id:String, x:Number,y:Number, width:Number,height:Number, damage:int, points:int) 
		{
			super(id, x, y);
			this.damage = damage;
			this.points = points;
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
			debugShape.graphics.beginFill(0xFF0000, 0.6);
			debugShape.graphics.drawRect(0, 0, width, height);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
		
	}

}