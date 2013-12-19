package game.objects.level1.tutorial 
{
	import core.gameobject.TutorialObject;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class TutorialMove extends TutorialObject 
	{
		private var text:TextField = new TextField(200, 50, 'Use The ArrowKeys to move', 'Arial', 12, 0xFFFFFF, true);
		
		public function TutorialMove(id:String,x:Number,y:Number) 
		{
			super(id, x, y, 5, 1);
			addChild(text);
		}
		
		override protected function Check():void 
		{
			if (Game.gameScreen.level.player)
			{
				if (collider.intersects(Game.gameScreen.level.player.collider) && !text.visible)
				{
					text.visible = true;
				}
				else if (!collider.intersects(Game.gameScreen.level.player.collider) && text.visible)
				{
					text.visible = false;
				}
			}
		}
	}

}