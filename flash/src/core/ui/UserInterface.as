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
		public var inv:Inventory;
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
			addChild(healthbar);
		}
		
		/**
		 * setting up the inventory
		 */
		private function setupInventory():void {
			inv = new Inventory();
			addChild(inv);
			
			
		}
		
		/**
		 * pause userinterface
		 */
		public function pause():void {
					healthbar.pause();
					trace(healthbar.getState());
					inv.pause();
					trace(inv.getState());
		}
		
		/**
		 * resume interface
		 */
		public function resume():void {
				healthbar.resume();
				trace(healthbar.getState());
				inv.resume();
				trace(inv.getState());
		}
		
		/**
		 * reset HUD
		 */
		public function reset():void {
			healthbar.reset();
			trace(healthbar.getMaxHealth());
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

