package core.gameobject 
{
	import starling.display.Shape;
	/**
	 * Creates a basic GameObject representing a platform
	 * @author SEG.Veenstra
	 */
	public class Platform extends GameObject 
	{
		private var shape:Shape;
		
		public function Platform(id:String, x:Number, y:Number, width:Number, height:Number) 
		{
			super(id, x, y, width, height);
			Draw(width,height);
		}
		
		protected function Draw(width:Number,height:Number):void 
		{	
			shape = new Shape();
			shape.graphics.beginFill(0x000000, 0.6);
			shape.graphics.drawRect(0, 0, width, height);
			shape.graphics.endFill();
			
			addChild(shape);
		}
		
	}

}