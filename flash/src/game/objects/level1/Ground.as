package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.Platform;
	import flash.geom.Matrix;
	import starling.display.Image;
	import starling.display.Shape;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Ground extends Platform 
	{
		 private var image:Image = new Image(Assets.GetAtlas('level_1').getTexture('ground'));
		public function Ground(id:String,x:Number,y:Number) 
		{
			super(id, x, y, 100, 5);
			
			addChild(image);
		}
		
	}

}