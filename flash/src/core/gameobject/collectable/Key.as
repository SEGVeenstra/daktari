package core.gameobject.collectable 
{
	import core.level.Level;
	import starling.display.Image;
	import starling.display.Shape;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Key extends Item 
	{
		
		public function Key(id:String, x:Number, y:Number, image:Image = null) 
		{
			super(id, x, y);
			if(image)
				art = image;
		}
		
	}

}