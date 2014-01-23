package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import game.levels.Level5;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicIntro5 extends Comic 
	{
		
		public function ComicIntro5() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_5', 'page_1')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_5', 'page_2')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_5', 'page_3')));
			SetLevel(Level5);
		}
		
	}

}