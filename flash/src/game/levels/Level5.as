package game.levels 
{
	import core.asset.Assets;
	import core.gameobject.Enemy;
	import core.gameobject.Finish;
	import core.gameobject.Platform;
	import core.level.Level;
	import core.visualobject.VisualObject;
	import game.comics.ComicOutro5;
	import game.objects.characters.Adult;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author Stephan E.G. Veenstra
	 */
	public class Level5 extends Level 
	{
		
		public function Level5() 
		{
			super(0, 0);
			SetEndingComic(ComicOutro5);
		}

		override protected function Build():void 
		{
			Game.gameScreen.userInterface.activateDisease(true);
			SetBackground(new Image(Assets.GetAtlas('level_5').getTexture('background')));
			
			// visuals
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'tree')),56,28);
			
			SetPlayer(new Adult('player', 3, 45, true));
			
			// Visual
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'ground')),0,52);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'ground')),75,52);
			
			// Borders
			AddGameObject(new Platform('ground', 0, 55, 150, 5));
			AddGameObject(new Platform('top_border', 0, 0, 150, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 60));
			AddGameObject(new Platform('right_border', 149, 0, 1, 60));
			
			AddGameObject(new Finish('finish', 145, 54, 4, 1));
			
			AddGameObject(new Platform('house_1_p1', 30, 46, 24, 1, true));
			AddGameObject(new Platform('house_1_p2', 30, 42, 24, 1, true));
			AddGameObject(new Platform('barrel', 56, 51, 3, 1, true));
			
			AddGameObject(new Platform('house_2_p1', 125, 46, 20, 1, true));
			
			AddGameObject(new Platform('tree_1_p1', 62, 40, 5, 1, true));
			AddGameObject(new Platform('tree_1_p2', 70, 38, 5, 1, true));
			AddGameObject(new Platform('tree_2_p1', 85, 39, 5, 1, true));
			AddGameObject(new Platform('tree_2_p2', 100, 42, 5, 1, true));
			AddGameObject(new Platform('tree_3_p1', 20, 35, 5, 1, true));
			AddGameObject(new Platform('tree_3_p2', 10, 32, 5, 1, true));
			
			AddGameObject(new Enemy('cows', 77, 49, 30, 6, 25,0));
		}
	}

}