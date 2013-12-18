package game.objects.level1 
{
	import core.asset.Assets;
	import core.visualobject.VisualObject;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class WallBuilding1 extends VisualObject 
	{
		
		public function WallBuilding1() 
		{
			super(Assets.GetAtlas('level_1').getTexture('wall-building-1'));
		}
		
	}

}