package core.gameobject.collectable 
{
	import core.level.Level;
	import starling.display.Image;
	import starling.display.Shape;
	/**
	 * Items can be collected by the player and are stored in the Inventory
	 * @author SEG.Veenstra
	 */
	public class Item extends Collectable 
	{
		
		public function Item(id:String,x:Number,y:Number,image:Image = null) 
		{
			super(id, x, y);
			if(image) art = image;
		}
		
		override protected function Create():void 
		{
			collider.x = x;
			collider.y = y;
			collider.width = 4 * Level.GRIDSIZE;
			collider.height = 4 * Level.GRIDSIZE;
			
			debugShape = new Shape();
			debugShape.graphics.beginFill(0xFF8000, 0.6);
			debugShape.graphics.drawRect(0, 0, 4 * Level.GRIDSIZE, 4 * Level.GRIDSIZE);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
		
	}

}