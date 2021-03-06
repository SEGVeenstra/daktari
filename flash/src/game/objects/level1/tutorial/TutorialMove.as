package game.objects.level1.tutorial 
{
	import core.asset.Assets;
	import core.gameobject.TutorialObject;
	import starling.display.Image;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class TutorialMove extends TutorialObject 
	{
		private var image:Image = new Image(Assets.GetAtlas('tutorial').getTexture('movement'));
		
		public function TutorialMove(id:String,x:Number,y:Number) 
		{
			super(id, x, y, 5, 1);
			addChild(image);
			image.y = -300;
		}
		
		override protected function Check():void 
		{
			if (Game.gameScreen.level.player)
			{
				if (collider.intersects(Game.gameScreen.level.player.collider) && !image.visible)
				{
					image.visible = true;
				}
				else if (!collider.intersects(Game.gameScreen.level.player.collider) && image.visible)
				{
					image.visible = false;
				}
			}
		}
	}

}