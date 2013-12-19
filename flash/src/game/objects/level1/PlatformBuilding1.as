package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.Platform;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class PlatformBuilding1 extends Platform 
	{
		
		
		public function PlatformBuilding1(id:String, x:Number, y:Number) 
		{
			super(id, x, y, 26, 1);
			art = new Image(Assets.GetAtlas('level_1').getTexture('platform_b1_small'));
		}
		
	}

}