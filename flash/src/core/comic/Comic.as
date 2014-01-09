package core.comic 
{
	import core.asset.Assets;
	import core.level.Level;
	import feathers.controls.ImageLoader;
	import game.levels.Level1;
	import starling.display.DisplayObject;
	import starling.display.Image;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Comic extends DisplayObject
	{
		private var _pages:Vector.<Image> = new Vector.<Image>();
		private var _level:Class;
		
		public function Comic() 
		{
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_1', 'page_1')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_1', 'page_2')));
			AddPage(new Image(Assets.GetTextureFromAtlas('intro_1', 'page_3')));
			SetLevel(Level1);
		}
		
		protected function AddPage(image:Image):void
		{
			_pages.push(image);
		}
		
		protected function SetLevel(level:Class):void
		{
			_level = level;
		}
		
		public function get level():Class
		{
			return _level;
		}
		
		public function get pages():Vector.<Image>
		{
			return _pages;
		}
		
		public function get count():int
		{
			return _pages.length;
		}
		
		public function GetPage(page:int):Image
		{
			return _pages[page-1];
		}
	}

}