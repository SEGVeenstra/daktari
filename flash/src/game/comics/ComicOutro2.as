package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import starling.display.Image;
	import game.comics.
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicOutro2 extends Comic 
	{
		
		public function ComicOutro2() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_1', 'page_1')));
			SetComic(ComicIntro3);
		}
		
	}

}