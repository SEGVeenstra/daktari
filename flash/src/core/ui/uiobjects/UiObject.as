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
		public function pause(play:Boolean) {
			if (play) {
				this.play = false;
			}
		}
		/**
		 * continue the game
		 * @param	play
		 */
		public function play(play:Boolean) {
			if (!play) {
				this.play = true;
			}
		}
		
	}

}