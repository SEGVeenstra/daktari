package core.comic 
{
	import core.asset.Assets;
	import core.level.Level;
	import core.menu.Menu;
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
		private var _menu:Class;
		private var _comic:Class;
		
		public function Comic() 
		{
			
		}
		
		protected function AddPage(image:Image):void
		{
			_pages.push(image);
		}
		
		protected function SetLevel(level:Class):void
		{
			_level = level;
			_comic = null;
			_menu = null
		}
		
		protected function SetMenu(menu:Class):void
		{
			_menu = menu;
			_comic = null;
			_level = null;
		}
		
		protected function SetComic(comic:Class):void
		{
			_comic = comic;
			_level = null;
			_menu = null;
		}
		
		public function get level():Class
		{
			return _level;
		}
		
		public function get menu():Class
		{
			return _menu;
		}
		
		public function get comic():Class
		{
			return _comic;
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