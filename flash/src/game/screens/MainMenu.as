package game.screens 
{
	import core.key.Key;
	import core.menu.Menu;
	import core.menu.menuobject.Button;
	import game.levels.Level1;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class MainMenu extends Menu 
	{
		private var playButton:Button = new Button('play_button', 200, 30, 'Play');
		
		public function MainMenu() 
		{
			super(1);
			Build();
			activeItemPosition = 0;
		}
		
		private function Build():void 
		{
			AddMenuObject(playButton, 300, 100);
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
				
			}
		}
	}

}