package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.Door;
	import core.gameobject.collectable.Key;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class BlueDoor extends Door 
	{
		
		public function BlueDoor(id:String,x:Number,y:Number, locked:Boolean = false, requiredKey:Key = null) 
		{
			super(id, x, y, locked, requiredKey);
			openImage = new Image(Assets.GetAtlas('level_1').getTexture('door_b1_open'));
			closedImage = new Image(Assets.GetAtlas('level_1').getTexture('door_b1_closed'));
		}
		
	}

}