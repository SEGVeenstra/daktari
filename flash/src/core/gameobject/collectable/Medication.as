package core.gameobject.collectable 
{
	import core.asset.Assets;
	import starling.display.Image;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Medication extends Item 
	{
		
		public function Medication(id:String,x:Number,y:Number) 
		{
			super(id, x, y);
			art = new Image(Assets.GetCollectableTexture('medicines'));
		}
		
	}

}