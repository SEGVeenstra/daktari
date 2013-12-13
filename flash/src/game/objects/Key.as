package game.objects 
{
	import core.asset.Assets;
	import core.gameobject.collectable.Item;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Key extends Item 
	{
		private var art:Image;
		
		public function Key(id:String, x:Number, y:Number) 
		{
			super(id, x, y);
			art = new Image(Assets.GetAtlas('items_level_1').getTexture('key'));
			addChild(art);
		}
		
	}

}