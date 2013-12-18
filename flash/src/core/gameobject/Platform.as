package core.gameobject 
{
	import core.level.Level;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Shape;
	/**
	 * Creates a basic GameObject representing a platform
	 * @author SEG.Veenstra
	 */
	public class Platform extends GameObject 
	{
		private var _art:Image;
		
		public function Platform(id:String, x:Number, y:Number, width:Number, height:Number) 
		{
			super(id, x, y);
			width *= Level.GRIDSIZE;
			height *= Level.GRIDSIZE;
			x *= Level.GRIDSIZE;
			y *= Level.GRIDSIZE;
			Draw(width, height);
			collider = new Rectangle(x,y,width,height);
			solid = true;
		}
		
		public function set art(image:Image):void
		{
			_art = image;
			addChild(image);
		}
		
		protected function Draw(width:Number,height:Number):void 
		{	
			debugShape = new Shape();
			debugShape.graphics.beginFill(0x000000, 0.6);
			debugShape.graphics.drawRect(0, 0, width, height);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
		
	}

}