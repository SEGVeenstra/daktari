package core.ui.uiobjects 
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Henderikus
	 */
	public class UiObject extends Sprite 
	{
		protected var play:Boolean;
		
		public function UiObject() 
		{
			
		}
		
		/**
		 * pause the game
		 * @param	play
		 */
		public function pauseGame(play:Boolean):void {
			if (play) {
				this.play = false;
			}
		}
		/**
		 * continue the game
		 * @param	play
		 */
		public function resumePlay(play:Boolean):void {
			if (!play) {
				this.play = true;
			}
		}
		
	}

}