package core.ui.uiobjects 
{
	import starling.display.Graphics;
	import starling.display.Sprite;
	/**
	 * This class contains everything concerning the healthbar
	 * @author Henderikus
	 */
	public class Healthbar extends UiObject 
	{
		private var maxHealth:Number = 100;
		private var curHealth:Number;
		private var healthBar:Sprite;
		
		
		public function Healthbar() 
		{
			curHealth = maxHealth;
			buildHealthBar();
		}
		
		/**
		 * build healthbar
		 */
		private function buildHealthBar():void {
			var high:Number = 15;
			var hbol:Sprite = new Sprite(); // background healthbar
			addChild(hbol);
		
			//outline background healthbar
			var ol:Graphics = hbol.graphics;
		
			ol.lineStyle(1, 0x000000);
			ol.beginFill(0x666666);
			ol.lineTo(maxHealth, 0);
			ol.lineTo(maxHealth, high);
			ol.lineTo(0, high);
			ol.lineTo(0, 0);
			ol.endFill();
		
			// actual healthbar
			healthBar = new Sprite();
			hbol.addChild(healthBar);
		
			//outline
			var ins:Graphics = healthBar.graphics;
			ins.lineStyle(0, 0x000000);
			ins.beginFill(foregroundColor);
			ins.lineTo(maxHealth,0);
			ins.lineTo(maxHealth,high);
			ins.lineTo(0,high);
			ins.lineTo(0,0);
			ins.endFill();
		}
		
		/**
		 * When the player takes damage the amount will be subtracted
		 * from the currenthealth(curHealth) if the player still has health and play is true. 
		 * After that the healthbar will by scaled using scale and devide it by 100.
		 * 
		 * scale will either be the amount of damage or the remaining health. scale will be 
		 * curHealth if the damage taken is more than the remaing health
		 * 
		 * @param	amount of health that is lost
		 */
		public function looseHealth(amount:Number) {
			var scale:Number = 0;
			if (curHealth > 0 && play == true) {
				if (amount > curHealth) {
					scale = curHealth;
					curHealth = 0;
				}else{
					curHealth -= amount;
					scale = curHealth;
				}
				healthBar.scaleX -= scale / 100;
			}
		}
		
		/**
		 * When the player uses a healthkit the amount will be added to 
		 * curHealth if it does not exceed maxHealth. when it does it will use the difference between
		 * curHealth an maxHealth to rescale the Healthbar
		 * 
		 * @param	amount of health thats needs to be added
		 */
		public function restoreHealth(amount:Number) {
			var scale:Number = 0;
			if (curHealth > 0 && curHealth < maxHealth && play == true) {
				if (reachedMaxHealth(amount)){
					scale = maxHealth - curHealth;
					curHealth = maxHealth;
				}else {
					curHealth += amount;
					scale = amount;
				}
				healthBar.scaleX += scale / 100;
			}
		}
		
		/**
		 * Check if maxHealth is reached or exceeded
		 * 
		 * @param amount of health thats need to be added
		 * @return true when max is reached or exceeded and false when not reached or exceeded
		 */
		private function reachedMaxHealth(amount:Number):Boolean {
			var reachedMax:Number = curHealth + amount;
			if (reachedMax >= maxHealth) {
				return true;
			}else {
				return false;
			}
		}
		

}