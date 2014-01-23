package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import game.levels.Level1;
	import game.levels.Level3;
	import game.levels.Level4;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicIntro4 extends Comic 
	{
		
		public function ComicIntro4() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_4', 'page_1')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_4', 'page_2')));
			SetLevel(Level4);
		}
		
	}

}