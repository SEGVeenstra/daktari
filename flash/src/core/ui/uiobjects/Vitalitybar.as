package core.ui.uiobjects 
{
	import starling.display.Sprite;
	import starling.display.Shape;

	/**
	 * ...
	 * @author Henderikus
	 */
	public class Vitalitybar extends UiObject 
	{
	
		private var _maxVitality:Number = 100;
		private var _curVitality:Number;
		private var _active:Boolean = false;
		private var arc:Number = 360;
		private var bar:Shape;
		
		public function Vitalitybar() 
		{
			_curVitality = maxVitality;
			draw();
		}
		
		/**
		 * draws to actual indicator
		 */
		private function draw():void {
			bar = new Shape();
			addChild(bar);
			drawWedge(arc);
		}
		
		/**
		 * draw indicator segment
		 * @param	deg
		 * @param	color
		 */
		private function drawWedge(deg:Number):void {
			var radius:Number = 20;
			var color:uint = 0x00CC00;
			bar.graphics.clear();
			bar.graphics.beginFill(color);
			bar.graphics.moveTo(0, 0);
			bar.graphics.lineTo(radius * Math.sin(deg / 180 * Math.PI), radius * Math.cos(deg / 180 * Math.PI));
			for (var i:int = deg; i<=arc; i++)
			{
				bar.graphics.lineTo(radius * Math.sin(i / 180 * Math.PI), radius * Math.cos(i / 180 * Math.PI));
			}
			bar.graphics.lineTo(0,0);
			bar.graphics.endFill();
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
		public function set active(setting:Boolean):void {
			_active = setting;
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
		public function get active():Boolean {
			return _active;
		}
		
		/**
		 * decrease vitality
		 * @param	dec
		 */
		public function setVitality(vitality:Number):void {
			var deg:Number;
			if (active) {
				if (play) {
					if (vitality >= 0 && vitality <= maxVitality && vitality != curVitality) {
						trace(curVitality);
						curVitality = vitality;
						deg = arc - (curVitality * arc / 100);
						drawWedge(deg);
					}
				}
			}
		}
		
		/**
		* reset the vitalitybar
		*/
		public function reset():void {
			curVitality = maxVitality;
			var deg:Number = 0;
			drawWedge(deg);
		}
		
	}
	
	

}