package game.screens 
{
	import core.menu.Menu;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class MainMenu extends Menu 
	{
		private var playButton:Button = new Button('play_button', 200, 30, 'Play');
		private var restartButton:Button = new Button('restart_button', 200, 30, 'Restart');
		private var stopButton:Button = new Button('stop_button', 200, 30, 'Stop');
		
		public function MainMenu() 
		{
			super(1);
			Build();
			activeItemPosition = 0;
		}
		
		private function Build():void 
		{
			AddMenuObject(playButton, 300, 100);
			AddMenuObject(restartButton, 300, 200);
			AddMenuObject(stopButton, 300, 300);
			addChild(new TextField(800, 50, 'Test Menu', 'Arial', 30, 0, true));
		}
		
		override public function Control(e:KeyboardEvent):void 
		{
			super.Control(e);
			if (e.keyCode == Key.ENTER)
			{
				if (activeItem == playButton)
				{
					Game.gameScreen.loadLevel(new TestLevel());
					Game.focus = Game.gameScreen;
					Game.gameScreen.Play();
				}
				
			}
		}
	}

}