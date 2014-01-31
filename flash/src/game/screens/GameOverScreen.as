package game.screens 
{
	import core.key.Key;
	import core.menu.Menu;
	import core.menu.menuobject.Button;
	import game.comics.ComicOutro1;
	import starling.display.Shape;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class GameOverScreen extends Menu 
	{
		
		private var backgroundShape:Shape;
		private var titleText:TextField = new TextField(800, 100, 'Game Over', 'Arial', 60, 0 , true); 
		
		private var restartButton:Button = new Button('restart_button', 200, 50, 'Restart');
		private var stopButton:Button = new Button('stop_button', 200, 50, 'Stop');
		
		public function GameOverScreen() 
		{
			super(1);
			active = false;
			Create();
			activeItemPosition = 0;
		}
		
		private function Create():void 
		{
			backgroundShape = new Shape();
			backgroundShape.graphics.beginFill(0xFFFFFF, 0.6);
			backgroundShape.graphics.drawRect(0, 0, 800, 600);
			backgroundShape.graphics.endFill();
			addChild(backgroundShape);
			addChild(titleText);
			AddMenuObject(restartButton, 300, 250);
			AddMenuObject(stopButton, 300, 300);
			
		}
		
		override public function Control(e:KeyboardEvent):void 
		{
			super.Control(e);
			if (e.keyCode == Key.ENTER)
			{
				if (activeItem == restartButton)
				{
					Game.gameScreen.Reset();
				}
				else if (activeItem == stopButton)
				{
					Game.LoadMenu(MainMenu);
				}
			}
		}
	}

}