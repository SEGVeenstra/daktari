package core.gameobject 
{
	import starling.display.Image;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Gate extends Obstacle 
	{
		
		private var openImage:Image;
		private var closedImage:Image;
		
		public function Gate(id:String, x:Number, y:Number, width:Number, height:Number, openImage:Image, closedImage:Image, locked:Boolean = true ) 
		{
			super(id, x, y, width, height);
			solid = locked;
			this.openImage = openImage;
			this.closedImage = closedImage;
			addChild(openImage);
			addChild(closedImage);
			openImage.visible = !locked;
			closedImage.visible  = locked;
		}
		
		public function Unlock():void
		{
			solid = false;
			openImage.visible = true;
			closedImage.visible = false;
		}
		
		public function get isLocked():Boolean
		{
			return solid;
		}
	}

}