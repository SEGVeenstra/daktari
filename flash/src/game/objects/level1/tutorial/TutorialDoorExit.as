package game.objects.level1.tutorial 
{
	import core.asset.Assets;
	import core.gameobject.Character;
	import core.gameobject.TutorialObject;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class TutorialDoorExit extends TutorialObject 
	{
		private var image:Image = new Image(Assets.GetAtlas('tutorial').getTexture('door_exit'));
		
		public function TutorialDoorExit(id:String,x:Number,y:Number) 
		{
			super(id, x, y, 4, 1);
			addChild(image);
			image.y = -300;
		}
		
		override protected function Check():void 
		{
			if (Game.gameScreen.level.player)
			{
				if (collider.intersects(Game.gameScreen.level.player.collider))
				{
					if (Game.gameScreen.level.player.mode == Character.MODE_INDOOR)
					{
						image.visible = true;
					}
					else 
					{
						image.visible = false;
					}
						
				}
				else if (!collider.intersects(Game.gameScreen.level.player.collider))
				{
					image.visible = false;
				}
			}
		}
	}

}