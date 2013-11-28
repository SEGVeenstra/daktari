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
			play = true;
		}
		
		/**
		 * pause the game
		 */
		public function pause():void {
			if (play) {
				this.play = false;
			}
		}
		/**
		 * continue the game
		 */
		public function resume():void {
			if (!play) {
				this.play = true;
			}
		}
		
		/**
		 * check if paused
		 * @return
		 */
		public function getState():Boolean {
			return play;
		}
		
	}

}