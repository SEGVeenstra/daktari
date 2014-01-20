package game.screens 
{
	import core.key.Key;
	import core.menu.Menu;
	import core.menu.menuobject.Button;
	import core.screen.Screen;
	import game.comics.ComicOutro1;
	import starling.display.Shape;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class VictoryScreen extends Menu 
	{
		private var backgroundShape:Shape;
		private var titleText:TextField = new TextField(800, 100, 'Finished!', 'Arial', 60, 0 , true);
		private var scoreText:TextField = new TextField(800, 100, 'score', 'Arial', 48, 0 , true);
		
		private var nextButton:Button = new Button('next_button', 200, 50, 'Next');
		private var restartButton:Button = new Button('restart_button', 200, 50, 'Restart');
		private var stopButton:Button = new Button('stop_button', 200, 50, 'Stop');
		
		public function VictoryScreen() 
		{
			super(1);
			active = false;
			Create();
			activeItemPosition = 0;
		}
		
		public function SetScore(points:int):void
		{
			scoreText.text = 'Score: ' + points + ' points!';
		}
		
		private function Create():void 
		{
			backgroundShape = new Shape();
			backgroundShape.graphics.beginFill(0xFFFFFF, 0.6);
			backgroundShape.graphics.drawRect(0, 0, 800, 600);
			backgroundShape.graphics.endFill();
			addChild(backgroundShape);
			addChild(titleText);
			addChild(scoreText);
			scoreText.y = 100;
			AddMenuObject(nextButton, 300, 200);
			AddMenuObject(restartButton, 300, 250);
			AddMenuObject(stopButton, 300, 300);
			
		}
		
		override public function Control(e:KeyboardEvent):void 
		{
			super.Control(e);
			if (e.keyCode == Key.ENTER)
			{
				if (activeItem == nextButton && Game.gameScreen.level.endingComic)
				{
					Game.LoadComic(Game.gameScreen.level.endingComic);
				}
				else if (activeItem == restartButton)
				{
					Game.gameScreen.Reset();
				}
				else if (activeItem == stopButton)
				{
					Game.menuScreen.loadMenu(new MainMenu());
					Game.focus = Game.menuScreen ;
				}
			}
		}
		
	}

}