package core.gameobject 
{
	import core.gameobject.Enemy;
	import core.gameobject.GameObject;
	import core.level.Level;
	import starling.display.Image;
	import starling.display.Shape;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Obstacle extends Platform 
	{
		
		public function Obstacle(id:String,x:Number,y:Number,width:Number,height:Number) 
		{
			super(id, x, y,width,height);
			solid = true;
			collider.x = this.x;
			collider.y = this.y;
			collider.height = height * Level.GRIDSIZE;
			collider.width = width * Level.GRIDSIZE;
		}
		
		override protected function Draw(width:Number,height:Number):void
		{
			debugShape = new Shape();
			debugShape.graphics.beginFill(0xff00ff, 0.6);
			debugShape.graphics.drawRect(0, 0, width, height);
			debugShape.graphics.endFill();
			addChild(debugShape);
		}
		
		/**
		 * Clear this object (make it NOT solid)
		 */
		public function Clear():void 
		{
			solid = false;
		}
		
	}

}