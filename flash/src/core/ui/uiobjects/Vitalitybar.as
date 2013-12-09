package core.ui.uiobjects 
{
	/**
	 * ...
	 * @author Henderikus
	 */
	public class Vitalitybar extends UiObject 
	{
	
		private var _maxVitality:Number = 100;
		private var _curVitality:Number;
		private var _visible:Boolean = false;
		
		public function Vitalitybar() 
		{
			curVitality(maxVitality);
		}
		
		
		
		/**
		 * this method sets curVitality 
		 */
		public function set curVitality(setting:Number):void {
			_curVitality = setting;
		}
		
		/**
		 * set visibilty of indicator
		 * if true indicator visible, if false indicator not visible
		 */
		public function set visible(setting:Boolean):void {
			_visible = setting;
		}
		
		/**
		 * 
		 * @return _maxVitality
		 */
		public function get maxVitality():Number{
			return _maxVitality;
		}
		
		/**
		 * 
		 * @return _curVitality
		 */
		public function get curVitality():Number {
			return _curVitality;
		}
		
		/**
		 * returns visibilty of indicator
		 * if true indicator visible, if false indicator not visible
		 * @return visibilty
		 */
		public function get visible():Boolean {
			return _visible;
		}
		
		
	}

}