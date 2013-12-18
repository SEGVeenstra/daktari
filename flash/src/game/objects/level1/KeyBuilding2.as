package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.collectable.Key;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class KeyBuilding2 extends Key 
	{
		
		public function KeyBuilding2(id:String, x:Number, y:Number) 
		{
			super(id, x, y);
			art = new Image(Assets.GetAtlas('items_level_1').getTexture('key'));
			addChild(art);
		}
		
	}

}