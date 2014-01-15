package game.levels 
{
	import core.asset.Assets;
	import core.gameobject.collectable.Item;
	import core.gameobject.collectable.Medication;
	import core.gameobject.Platform;
	import core.level.Level;
	import game.objects.characters.Teenager;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Level3 extends Level 
	{
		
		public function Level3() 
		{
			super(0, 0);
		}
		
		override protected function Build():void 
		{
			Game.gameScreen.userInterface.activateDisease(true);
			
			SetBackground(new Image(Assets.GetAtlas('level_1').getTexture('background')));
			SetPlayer(new Teenager('player', 2, 30,true));
			AddGameObject(new Platform('ground', 0, 90, 125, 5));
			AddGameObject(new Platform('top_border', 0, 0, 125, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 90));
			AddGameObject(new Platform('right_border', 124, 0, 1, 90));
			
			AddGameObject(new Platform('platform_1', 10, 85, 10, 1));
			
			AddGameObject(new  Medication('med',30,85));
			
			debug = true;
		}
	}

}