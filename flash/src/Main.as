package 
{
	import flash.display.Sprite;
	import starling.core.Starling;
	
	/**
	 * Starts the starling framework
	 * @author SEG.Veenstra
	 */
	public class Main extends Sprite 
	{
		private var starling:Starling;
		
		public function Main():void 
		{
			starling = new Starling(Game, stage);
			starling.antiAliasing = 1;
			starling.start();
		}
		
	}
	
}