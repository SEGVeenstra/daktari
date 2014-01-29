package game.screens 
{
	import core.key.Key;
	import core.menu.Menu;
	import core.menu.menuobject.Button;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import starling.display.Shape;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class PauseScreen extends Menu 
	{
		private var backgroundShape:Shape;
		private var titleText:TextField = new TextField(800, 100, 'Paused', 'Arial', 60, 0 , true); 
		
		private var resumeButton:Button = new Button('resume_button', 200, 50, 'Resume');
		private var restartButton:Button = new Button('restart_button', 200, 50, 'Restart');
		private var stopButton:Button = new Button('stop_button', 200, 50, 'Stop');
		
		public function PauseScreen() 
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
			AddMenuObject(resumeButton, 300, 200);
			AddMenuObject(restartButton, 300, 250);
			AddMenuObject(stopButton, 300, 300);
			
		}
		
		override public function Control(e:KeyboardEvent):void 
		{
			super.Control(e);
			if (e.keyCode == Key.ENTER)
			{
				if (activeItem == resumeButton)
					Game.gameScreen.Play();
				else if (activeItem == restartButton)
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