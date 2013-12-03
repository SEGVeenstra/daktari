package game.screens 
{
	import core.key.Key;
	import core.menu.Menu;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	
	/**
	 * Sample of using MenuScreen
	 * @author SEG.Veenstra
	 */
	public class IntroScreen extends Menu 
	{
		private var title:TextField = new TextField(800, 80, 'Daktari Msaidizi', 'Arial', 60, 0, true);
		private var subTitle:TextField = new TextField(800, 40, 'press \'ENTER\' to start', 'Arial', 30, 0x666666);
		
		public function IntroScreen() 
		{
			Build();
		}
		
		public function Build():void
		{
			title.y = 250;
			subTitle.y = 330;
			addChild(title);
			addChild(subTitle);
		}
		
		override public function Control(e:KeyboardEvent):void 
		{
			if (e.keyCode == Key.ENTER)
			{
				Game.menuScreen.loadMenu(new MainMenu());
			}
		}
		
	}

}