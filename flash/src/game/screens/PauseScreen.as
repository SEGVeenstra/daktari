package game.screens 
{
	import core.key.Key;
	import core.menu.Menu;
	import core.menu.menuobject.Button;
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
		
		public function PauseScreen() 
		{
			super(1);
			active = false;
			Create();
			activeItemPosition = 1;
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
		}
		
		override public function Control(e:KeyboardEvent):void 
		{
			super.Control(e);
			if (e.keyCode == Key.ENTER)
			{
				trace('doing');
				if (activeItem == resumeButton)
					Game.gameScreen.Play();
			}
			
		}
		
	}

}