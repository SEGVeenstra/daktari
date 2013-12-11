package core.ui.uiobjects 
{
	import starling.text.TextField;
	/**
	 * ...
	 * @author Henderikus
	 */
	public class HighScore extends UiObject 
	{
		private var _highscore:Number;
		private var indicator:TextField;
		
		public function HighScore() 
		{
			super();
			_highscore = 0;
			var text:String = highScore.toString();
			indicator = new TextField(70, 40, text,'arial', 20, 0, true);
			draw();
		}
		
		/**
		 * draw textfield
		 */
		private function draw():void {
			addChild(indicator);
		}
		/**
		 * get highscore
		 * @return _highscore
		 */
		public function get highScore():Number {
			return _highscore;
		}
		
		/**
		 * 
		 * @param	score
		 */
		private function setHighScore(score:Number):void {
			_highscore = score;
			updateIndicator();
		}
		
		/**
		 * update indicator
		 * 
		 */
		private function updateIndicator():void {
			var text:String;
			text = highScore.toString();
			indicator.text = text;
		}
		
		/**
		 * update highscore
		 * @param	points
		 */
		public function addScore(points:Number):void {
			if (play) {
				_highscore += points;
				updateIndicator();
				
			}
		}
		
		/**
		 * reset
		 */
		public function reset():void {
			setHighScore(0);
		}
	}

}