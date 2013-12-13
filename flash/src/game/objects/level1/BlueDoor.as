package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.Door;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class BlueDoor extends Door 
	{
		private var art:Image;
		
		public function BlueDoor(id:String,x:Number,y:Number) 
		{
			super(id, x, y);
			art = new Image(Assets.GetAtlas('level_1').getTexture('blue-door-building-1'));
			addChild(art);
		}
		
	}

}