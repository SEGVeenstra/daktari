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
	public class TutorialDoor extends TutorialObject 
	{
		private var image:Image = new Image(Assets.GetAtlas('tutorial').getTexture('door'));
		private var imageMovement:Image = new Image(Assets.GetAtlas('tutorial').getTexture('door_movement'));
		
		public function TutorialDoor(id:String,x:Number,y:Number) 
		{
			super(id, x, y, 4, 1);
			addChild(image);
			addChild(imageMovement);
			image.y = -300;
			imageMovement.y = -300;
		}
		
		override protected function Check():void 
		{
			if (Game.gameScreen.level.player)
			{
				if (collider.intersects(Game.gameScreen.level.player.collider))
				{
					if (Game.gameScreen.level.player.mode != Character.MODE_INDOOR)
					{
						image.visible = true;
						imageMovement.visible = false;
					}
					else 
					{
						image.visible = false;
						imageMovement.visible = true;
					}
						
				}
				else if (!collider.intersects(Game.gameScreen.level.player.collider))
				{
					image.visible = false;
					imageMovement.visible = false;
				}
			}
		}
	}

}