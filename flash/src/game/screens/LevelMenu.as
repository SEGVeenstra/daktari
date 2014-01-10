package game.screens 
{
	import core.asset.Assets;
	import core.key.Key;
	import core.menu.Menu;
	import core.menu.menuobject.Button;
	import game.comics.ComicIntro1;
	import game.levels.Level1;
	import game.levels.Level2;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class LevelMenu extends Menu 
	{
		private var level1Button:Button = new Button('button_level_1', 100, 100, '1',Assets.GetTextureFromAtlas('menu','level-menu'),Assets.GetTextureFromAtlas('menu','level-menu-active'));
		private var level2Button:Button = new Button('button_level_2', 100, 100, '2',Assets.GetTextureFromAtlas('menu','level-menu'),Assets.GetTextureFromAtlas('menu','level-menu-active'));
		
		public function LevelMenu() 
		{
			super(1);
			Build();
			activeItemPosition = 0;
		}
		
		private function Build():void 
		{
			AddMenuObject(level1Button, 100, 250);
			AddMenuObject(level2Button, 225, 250);
			addChild(new TextField(800, 50, 'Level Menu', 'Arial', 30, 0, true));
		}
		
		override public function Control(e:KeyboardEvent):void 
		{
			super.Control(e);
			if (e.keyCode == Key.ENTER)
			{
				if (activeItem == level1Button)
				{
					Game.LoadComic(ComicIntro1);
				}
				else if (activeItem == level2Button)
					Game.LoadLevel(Level2);
			}
			else if (e.keyCode == Key.ESCAPE)
				Game.LoadMenu(MainMenu);
		}
	}

}