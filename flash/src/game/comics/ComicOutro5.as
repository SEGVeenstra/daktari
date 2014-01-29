package game.comics 
{
	import core.asset.Assets;
	import core.comic.Comic;
	import game.screens.MainMenu;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ComicOutro5 extends Comic 
	{
		
		public function ComicOutro5() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('outro_5', 'page_1')));
			AddPage(new Image(Assets.GetTextureFromAtlas('other', 'credits')));
			SetMenu(MainMenu);
		}
		
	}

}