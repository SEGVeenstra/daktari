package game.objects.items.powerups 
{
	import core.asset.Assets;
	import core.gameobject.collectable.PowerUp;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Juice extends PowerUp 
	{
		
		public function Juice(id:String,x:Number,y:Number) 
		{
			super(id, x, y, 50, 5);
			image = new Image(Assets.GetCollectableTexture('juice'));
			addChild(image);
		}
		
	}

}