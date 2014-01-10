package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import game.levels.Level1;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicIntro1 extends Comic 
	{
		
		public function ComicIntro1() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_1', 'page_1')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_1', 'page_2')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_1', 'page_3')));
			SetLevel(Level1);
		}
		
	}

}