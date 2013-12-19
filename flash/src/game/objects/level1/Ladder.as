package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.Climbable;
	import core.level.Level;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Ladder extends Climbable 
	{
		
		public function Ladder(id:String, x:Number, y:Number) 
		{
			super(id, x, y, 3, 10);
			var image:Image = new Image(Assets.GetAtlas('level_1').getTexture('ladder'));
			image.y = -2 * Level.GRIDSIZE;
			addChild(image);
		}
		
	}

}