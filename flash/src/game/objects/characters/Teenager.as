package game.objects.characters 
{
	import core.asset.Assets;
	import core.gameobject.Character;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Teenager extends Character 
	{
		
		public function Teenager(id:String,x:Number,y:Number) 
		{
			super(id, x, y);
			addChild(new Image(Assets.GetAtlas('teenager').getTexture('teenager_1')));
		}
		
	}

}