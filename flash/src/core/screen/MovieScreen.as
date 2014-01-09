package core.screen 
{
	import core.comic.Comic;
	import core.key.Key;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	/**
	 * Can be extended/used to create a MovieScreen
	 * @author SEG.Veenstra
	 */
	public class MovieScreen extends Screen 
	{
		
		private var comic:Comic;
		private var _currentPageNumber:int = 1;
		private var _currentPage:Image;
		
		public function MovieScreen()
		{
			trace('MovieScreen loaded');
			addEventListener(Event.ADDED_TO_STAGE, DrawBackground);
		}
		
		private function DrawBackground():void 
		{
			var background:Shape = new Shape();
			background.graphics.beginFill(0x000000);
			background.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			background.graphics.endFill();
			addChild(background);
		}
		
		/**
		 * Load a new comic
		 * @param	comic
		 */
		public function LoadComic(comic:Comic):void
		{
			if (this.comic)
				removeChild(this.comic);
			this.comic = comic;
			LoadPage(1);
		}
		
		/**
		 * Load a page from the comic
		 * @param	page
		 */
		private function LoadPage(page:int):void
		{
			trace('Load page',page);
			if (page > 0 && page <= comic.count)
			{
				if (_currentPage)
					removeChild(_currentPage);
				_currentPageNumber = page;
				_currentPage = comic.GetPage(page);
				addChild(_currentPage);
			}
		}
		
		override public function Control(e:KeyboardEvent):void 
		{
			super.Control(e);
			if (e.keyCode == Key.ARROW_RIGHT)
				NextPage();
			if (e.keyCode == Key.ARROW_LEFT)
				PreviousPage();
			if (e.keyCode == Key.SPACEBAR)
				Game.LoadLevel(comic.level);
		}
		
		/**
		 * Select the next page (if possible)
		 */
		private function NextPage():void 
		{
			trace(comic.count,_currentPageNumber+1);
			if (_currentPageNumber + 1 <= comic.count)
			{
				LoadPage(_currentPageNumber + 1);
			}
			else if (_currentPageNumber + 1 > comic.count)
				Game.LoadLevel(comic.level);
		}
		
		/**
		 * Select the next page (if possible)
		 */
		private function PreviousPage():void 
		{
			trace(comic.count,_currentPageNumber+1);
			if (_currentPageNumber - 1 != 0)
			{
				LoadPage(_currentPageNumber-1);
			}
		}
		
		override public function Reset():void 
		{
			super.Reset();
			_currentPageNumber = 1;
		}
	}

}