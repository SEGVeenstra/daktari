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
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_2_1', 'page_1')));
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_2_1', 'page_2')));
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_2_1', 'page_3')));
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_2_1', 'page_4')));
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_2_1', 'page_5')));
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_2_1', 'page_6')));
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_2_2', 'page_1')));
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_2_2', 'page_2')));
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_2_2', 'page_3')));
			SetComic(ComicIntro3);
		}
		
	}

}