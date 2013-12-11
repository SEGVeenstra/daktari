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
		private var arc:Number = 360
		private var bar:Shape;
		
		public function Vitalitybar(centerX:Number, centerY:Number) 
		{
			_curVitality = maxVitality;
			draw(centerX, centerY);
		}
		
		/**
		 * draws to actual indicator
		 */
		private function draw(centerX:Number, centerY:Number):void {
			var deg:Number = 0;
			bar = new Shape();
			addChild(bar);
			bar.x = centerX;
			bar.y = centerY;
			drawWedge(deg);
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
		public function decreaseVitality(dec:Number):void {
			if (active) {
				if (play) {
					var deg:Number;
					var perc:Number;
					if (curVitality > 0 && curVitality - dec >= 0) {
						curVitality -= dec;
						perc = 100 - (curVitality / maxVitality * 100);
						trace(perc);
						deg = perc * arc / 100;
						drawWedge(deg);
						trace(deg);
					}
				}
			}
		}
		
		/**
		 * increase vitality
		 * @param	inc
		 */
		public function increaseVitality(inc:Number):void {
			if (active) {
				if (play) {
					var deg:Number;
					if (curVitality > 0  && curVitality < maxVitality) {
						if (curVitality + inc >= maxVitality) {
							curVitality = maxVitality;
							deg = 0;
						}else {
							curVitality += inc;
							var perc:Number = 100 - (curVitality / maxVitality * 100);
							deg = perc * arc / 100;
						}
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