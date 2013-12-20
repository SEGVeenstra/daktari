package game.screens 
{
	import core.key.Key;
	import core.menu.Menu;
	import core.menu.menuobject.Button;
	import game.levels.Level1;
	import game.levels.Level2;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class MainMenu extends Menu 
	{
		private var playButton:Button = new Button('play_button', 200, 30, 'Play');
		private var level2Button:Button = new Button('level2_button', 200, 30, 'Level 2 (Pim)');
		
		public function MainMenu() 
		{
			super(1);
			Build();
			activeItemPosition = 0;
		}
		
		private function Build():void 
		{
			AddMenuObject(playButton, 300, 100);
			AddMenuObject(level2Button, 300, 200);
			addChild(new TextField(800, 50, 'Main Menu', 'Arial', 30, 0, true));
		}
		
		override public function Control(e:KeyboardEvent):void 
		{
			super.Control(e);
			if (e.keyCode == Key.ENTER)
			{
				if (activeItem == playButton)
				{
					Game.gameScreen.loadLevel(new Level1());
					Game.focus = Game.gameScreen;
					Game.gameScreen.Play();
				}
				else if (activeItem == level2Button)
				{
					Game.gameScreen.loadLevel(new Level2());
					Game.focus = Game.gameScreen;
					Game.gameScreen.Play();
				}
				
			}
		}
	}

}