package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicOutro1 extends Comic 
	{
		
		public function ComicOutro1() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_1', 'page_1')));
			SetComic(ComicIntro2);
		}
		
	}

}