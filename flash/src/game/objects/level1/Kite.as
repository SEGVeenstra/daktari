package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.collectable.Item;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Kite extends Item 
	{
		
		public function Kite(id:String, x:Number, y:Number) 
		{
			super(id, x, y);
			art = new Image(Assets.GetCollectableTexture('kite'));
			addChild(art);
		}
	}

}