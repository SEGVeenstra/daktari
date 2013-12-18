package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.Enemy;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author Henderikus
	 */
	public class Dog extends Enemy 
	{
		private var art:Image;
		public function Dog(id:String, x:Number,y:Number, width:Number,height:Number, damage:int, points:int) 
		{
			super(id, x, y, width, height, damage, points);
			art = new Image(Assets.GetAtlas('dog').getTexture('dog2'));
			addChild(art);	
		}
		
	}

}