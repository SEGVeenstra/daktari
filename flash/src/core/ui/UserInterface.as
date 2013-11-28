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
		
		private var uiObjects:Vector.<UiObject>; // list of all ui elements
		
		/**
		 * constructor
		 */
		public function UserInterface() 
		{
			uiObjects = new Vector.<UiObject>();
			setupHealthBar();
			setupInventory();
			
		}
		
		/**
		 * setting up the healthbar of the HUD
		 */
		private function setupHealthBar():void {
			var healthbar:Healthbar = new Healthbar();
			uiObjects.push(healthbar);
			addChild(healthbar);
		}
		
		/**
		 * setting up the inventory
		 */
		private function setupInventory():void {
			var inv:Inventory = new Inventory();
			uiObjects.push(inv);
			addChild(inv);
			
			
		}
		
		/**
		 * pause userinterface
		 */
		public function pause():void {
				for each(var uiObject:UiObject in uiObjects) {
					uiObject.pause();
					trace(uiObject.getState());
				}	
		}
		
		/**
		 * resume interface
		 */
		public function resume():void {
			for each(var uiObject:UiObject in uiObjects) {
				uiObject.resume();
				trace(uiObject.getState());
			}
		}
		
		/**
		 * reset HUD
		 */
		public function reset():void {
			for each(var uiObject:UiObject in uiObjects) {
				if (uiObject is Healthbar) {
					var healthbar:Healthbar = uiObject as Healthbar;
					healthbar.restoreHealth(healthbar.getMaxHealth());
					trace(healthbar.getMaxHealth());
				}
			}
		}
		
		/**
		 * select the healthbar from uiObjects 
		 * @return healthbar
		 */
		public function getHealthbar():Healthbar {
			var healthbar:Healthbar;
			for each(var uiObject:UiObject in uiObjects) {
				if (uiObject is Healthbar) {
					healthbar = uiObject as Healthbar;
				}
			} 
			return healthbar;
		}
		
	}
}

