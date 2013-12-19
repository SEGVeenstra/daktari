package game.objects.level1.visual 
{
	import core.asset.Assets;
	import core.visualobject.VisualObject;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Railing extends VisualObject 
	{
		
		public function Railing() 
		{
			super(Assets.GetAtlas('level_1').getTexture('railing'));
		}
		
	}

}