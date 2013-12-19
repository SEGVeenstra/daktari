package game.objects.level1.tutorial 
{
	import core.asset.Assets;
	import core.gameobject.TutorialObject;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class TutorialEnemy extends TutorialObject 
	{
		private var image:Image = new Image(Assets.GetAtlas('tutorial').getTexture('enemy'));
		
		public function TutorialEnemy(id:String,x:Number,y:Number) 
		{
			super(id, x, y, 5, 1);
			addChild(image);
			image.y = -300;
			image.x = -32;
		}
		
		override protected function Check():void 
		{
			if (Game.gameScreen.level.player)
			{
				if (collider.intersects(Game.gameScreen.level.player.collider))
				{
					image.visible = true;
				}
				else
				{
					image.visible = false;
				}
			}
		}
		
	}

}