package game.levels 
{
	import core.asset.Assets;
	import core.gameobject.Finish;
	import core.gameobject.Platform;
	import core.level.Level;
	import game.comics.ComicOutro4;
	import game.objects.characters.Adult;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author Stephan E.G. Veenstra
	 */
	public class Level4 extends Level 
	{
		
		public function Level4() 
		{
			super(0, 0);
			SetEndingComic(ComicOutro4);
		}

		override protected function Build():void 
		{
			Game.gameScreen.userInterface.activateDisease(true);
			SetBackground(new Image(Assets.GetAtlas('level_1').getTexture('background')));
			SetPlayer(new Adult('player', 3, 45, true));
			
			// Borders
			AddGameObject(new Platform('ground', 0, 55, 150, 5));
			AddGameObject(new Platform('top_border', 0, 0, 150, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 60));
			AddGameObject(new Platform('right_border', 149, 0, 1, 60));
			
			AddGameObject(new Finish('finish', 145, 54, 4, 1));
		}
	}

}