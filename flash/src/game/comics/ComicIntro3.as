package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import game.levels.Level1;
	import game.levels.Level3;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicIntro3 extends Comic 
	{
		
		public function ComicIntro3() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_3', 'page_1')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_3', 'page_2')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_3', 'page_3')));
			SetLevel(Level3);
		}
		
	}

}