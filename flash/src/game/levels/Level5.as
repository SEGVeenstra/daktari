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
	import game.objects.items.powerups.Banana;
	import game.objects.items.powerups.Pineapple;
	import starling.display.Image;
	import starling.display.MovieClip;
	
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
			this.backgroundmusic = "musiclevel5";
		}

		override protected function Build():void 
		{
			Game.gameScreen.userInterface.activateDisease(true);
			SetBackground(new Image(Assets.GetAtlas('level_5').getTexture('background')));
			
			// visuals
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'tree')),56,28);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'tree2')),83,18);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'tree3')), 8, 15);
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'long_house')), 30, 42);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'small_house')), 124, 38);
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'barrel')), 56, 51);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'barrel')), 123, 51);
			
			SetPlayer(new Adult('player', 3, 45, true));
			
			// Visual
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'ground')),0,52);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_5', 'ground')),75,52);
			
			// Borders
			AddGameObject(new Platform('ground', 0, 55, 150, 5));
			AddGameObject(new Platform('top_border', 0, 0, 150, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 60));
			AddGameObject(new Platform('right_border', 149, 0, 1, 60));
			
			AddGameObject(new Finish('finish', 137, 54, 4, 1));
			
			AddGameObject(new Platform('house_1_p1', 30, 47, 30, 1, true));
			AddGameObject(new Platform('house_1_p2', 32, 42, 24, 1, true));
			AddGameObject(new Platform('barrel_1', 56, 51, 3, 1, true));
			
			AddGameObject(new Platform('house_2_p1', 125, 47, 20, 1, true));
			AddGameObject(new Platform('barrel_2', 123, 51, 3, 1, true));
			
			AddGameObject(new Platform('tree_1_p1', 62, 40, 5, 1, true));
			AddGameObject(new Platform('tree_1_p2', 70, 38, 5, 1, true));
			AddGameObject(new Platform('tree_2_p1', 85, 39, 5, 1, true));
			AddGameObject(new Platform('tree_2_p2', 100, 42, 5, 1, true));
			AddGameObject(new Platform('tree_3_p1', 20, 35, 5, 1, true));
			AddGameObject(new Platform('tree_3_p2', 10, 32, 5, 1, true));
			
			var cows:Enemy = new Enemy('cows', 77, 49, 20, 6, 25, 0);
			cows.SetAnimations(new MovieClip(Assets.GetAtlas('enemy').getTextures('cows_'), 2));
			AddGameObject(cows);
			
			// Power ups
			
			AddGameObject(new Banana('banana_1', 11, 28));
			AddGameObject(new Banana('banana_2', 21, 31));
			AddGameObject(new Banana('banana_3', 63, 36));
			AddGameObject(new Banana('banana_4', 71, 34));
			AddGameObject(new Pineapple('pineapple_1', 86, 35));
			AddGameObject(new Pineapple('pineapple_2', 101, 38));
			
			
			debug = false;
		}
	}

}