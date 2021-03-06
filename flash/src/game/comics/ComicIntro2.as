package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import game.levels.Level2;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicIntro2 extends Comic 
	{
		
		public function ComicIntro2() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_2', 'page_1')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_2', 'page_2')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_2', 'page_3')));
			SetLevel(Level2);
		}
		
	}

}