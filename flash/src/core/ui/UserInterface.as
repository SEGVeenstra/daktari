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
		/**
		 * constructor
		 */
		public function UserInterface() 
		{
			setupHealthBar();
			setupInventory();
			
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
		
	}
}

