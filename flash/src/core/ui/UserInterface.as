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
		
		public function UserInterface() 
		{
			uiObjects = new Vector.<UiObject>();
			builtUserInterface();
			
		}
		
		/**
		 * setting up all element of the HUD
		 */
		private function builtUserInterface():void {
			var healthbar:Healthbar = new Healthbar();
			uiObjects.push(healthbar);
			addChild(healthbar);
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
					var healthbar:Healthbar = iuObject as Healthbar;
					healthbar.restoreHealth(healthbar.getMaxHealth());
					trace(healthbar.getMaxHealth());
				}
			}
		}
		
	}
}

