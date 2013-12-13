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
			art = new Image(Assets.GetAtlas('items_level_1').getTexture('kite'));
			addChild(art);
		}
	}

}