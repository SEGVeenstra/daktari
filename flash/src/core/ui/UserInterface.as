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
		/**
		 * constructor
		 */
		public function UserInterface() 
		{
			setupHealthBar();
			setupInventory();
			setupVitalitybar(20, healthbar.height + 21);
			
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
		}
		
		/**
		 * setting up vatalitybar
		 */
		private function setupVitalitybar(centerX:Number, centerY:Number):void {
			vitalitybar = new Vitalitybar(centerX, centerY);
			this.addChild(vitalitybar);
			vitalitybar.visible = vitalitybar.active;
		}
		
		/**
		 * pause userinterface
		 */
		public function pause():void {
					healthbar.pause();
					trace(healthbar.getState());
					inventory.pause();
					trace(inventory.getState());
		}
		
		/**
		 * resume interface
		 */
		public function resume():void {
				healthbar.resume();
				trace(healthbar.getState());
				inventory.resume();
				trace(inventory.getState());
		}
		
		/**
		 * reset HUD
		 */
		public function reset():void {
			healthbar.reset();
			trace(healthbar.getMaxHealth());
			inventory.reset();
			trace(inventory.showInventoryItems);
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
		
	}
}

