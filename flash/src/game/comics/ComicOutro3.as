package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicOutro3 extends Comic 
	{
		
		public function ComicOutro3() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_1', 'page_1')));
			SetComic(ComicIntro1);
		}
		
	}

}