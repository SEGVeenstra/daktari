package core.ui 
{
	import starling.display.Sprite;
	import core.ui.uiobjects.*;
	
	/**
	 * Contains the information about the player in a level
	 * @author Henderikus Harms
	 */
	public class UserInterface extends Sprite
	{
		
		public var healthbar:Healthbar;
		public var inventory:Inventory;
		public var vitalitybar:Vitalitybar;
		public var highscore:HighScore;
		public var medicinindicator:Medicinindicator;
		
		/**
		 * constructor
		 */
		public function UserInterface() 
		{
			setupHealthBar();
			setupInventory();
			setupVitalitybar();
			setupHighScore();
			setupMedicinindicator();
		}

		/**
		 * setting up the healthbar of the HUD
		 */
		private function setupHealthBar():void {
			healthbar = new Healthbar();
			this.addChild(healthbar);
		}
		
		/**
		 * setting up the inventory
		 */
		private function setupInventory():void {
			inventory = new Inventory();
			this.addChild(inventory);
			inventory.x = 800 - inventory.inventorySize * 65;
		}
		
		/**
		 * setting up vatalitybar
		 */
		private function setupVitalitybar():void {
			vitalitybar = new Vitalitybar();
			this.addChild(vitalitybar);
			vitalitybar.y = healthbar.height + 21;
			vitalitybar.x = 20;
			vitalitybar.visible = vitalitybar.active;
		}
		
		/**
		 * setting up medecin indicator
		 */
		private function setupMedicinindicator():void {
			medicinindicator = new Medicinindicator();
			this.addChild(medicinindicator);
			medicinindicator.y = healthbar.height;
			medicinindicator.x = vitalitybar.x + 30;
			medicinindicator.visible = medicinindicator.active;
		}
		/**
		 * set up highscore
		 */
		private function setupHighScore():void {
			highscore = new HighScore();
			this.addChild(highscore);
			highscore.x = healthbar.width + 100;
			highscore.y = 0;
			
			
		}
		/**
		 * pause userinterface
		 */
		public function pause():void {
					healthbar.pause();
					trace(healthbar.getState());
					inventory.pause();
					trace(inventory.getState());
					vitalitybar.pause();
					trace(vitalitybar.getState());
					highscore.pause();
					trace(highscore.getState());
					
		}
		
		/**
		 * resume interface
		 */
		public function resume():void {
				healthbar.resume();
				trace(healthbar.getState());
				inventory.resume();
				trace(inventory.getState());
				vitalitybar.resume();
				trace(vitalitybar.getState());
				highscore.resume();
				trace(highscore.getState());
		}
		
		/**
		 * reset HUD
		 */
		public function reset():void {
			healthbar.reset();
			trace(healthbar.getMaxHealth());
			inventory.reset();
			vitalitybar.reset();
			trace(vitalitybar.curVitality);
			highscore.reset();
			medicinindicator.reset();
		}
		
		/**
		 * select the healthbar from uiObjects 
		 * @return healthbar
		 */
		public function getHealthbar():Healthbar {
			return healthbar;
		}
		
		/**
		 * regulate visibilty of vatilitybar
		 */
		public function activateVitalitybar(active:Boolean):void {
			vitalitybar.active = active;
			vitalitybar.visible = active;
		}
		
		/**
		 * regulate visibilty of the medicinindicator
		 * @param	active
		 */
		public function activateMedicationindicator(active:Boolean):void {
			medicinindicator.active = active;
			medicinindicator.visible = active;
		}
		
	}
}

