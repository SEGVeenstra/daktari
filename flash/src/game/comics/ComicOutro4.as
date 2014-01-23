package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicOutro4 extends Comic 
	{
		
		public function ComicOutro4() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_4', 'page_1')));
			SetComic(ComicIntro5);
		}
		
	}

}