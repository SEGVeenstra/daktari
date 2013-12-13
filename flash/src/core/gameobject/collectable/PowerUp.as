package core.gameobject.collectable 
{
	import core.level.Level;
	import starling.display.Shape;
	/**
	 * A power up can be collected by the player and takes effect immidetly
	 * @author SEG.Veenstra
	 */
	public class PowerUp extends Collectable 
	{
		private var _health:int;
		private var _points:int;
		
		public function PowerUp(id:String, x:Number, y:Number, points:int, health:int) 
		{
			super(id, x, y);
			_points = points;
			_health = health;
		}
		
		/**
		 * Returns the amount of health that this item restores
		 */
		public function get health():int
		{
			return _health;
		}
		
		/**
		 * Returns the amount of points this item rewards
		 */
		public function get points():int
		{
			return _points;
		}
		
		override protected function Create():void 
		{
			collider.x = x;
			collider.y = y;
			collider.width = 3 * Level.GRIDSIZE;
			collider.height = 3 * Level.GRIDSIZE;
			
			debugShape = new Shape();
			debugShape.graphics.beginFill(0xFFFF00, 0.6);
			debugShape.graphics.drawRect(0, 0, 3 * Level.GRIDSIZE, 3 * Level.GRIDSIZE);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
	}

}