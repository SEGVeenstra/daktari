package core.ui.uiobjects
{
	
	import starling.display.Graphics;
	import starling.display.Sprite;
	import starling.display.Shape;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import test.testobjects.TestItem;
	/**
	 * ...
	 * @author Henderikus
	 */
	public class Inventory extends UiObject 
	{
		private var inventoryItems:Vector.<TestItem>;
		private var inventorySprite:Sprite;
		
		public function Inventory() 
		{
			inventoryItems = new Vector.<TestItem>;
			inventorySprite = new Sprite();
			inventorySprite.x = 600;
			inventorySprite.y = -200;
			addChild(inventorySprite);
			
		}

		public function addToInventory(e:TouchEvent):void {
			var touch:Touch = e.getTouch(stage);
			if (touch) {
				if (touch.phase == TouchPhase.ENDED) {
					var item:TestItem = e.currentTarget as TestItem;
					inventoryItems.push(item);
					inventorySprite.addChild(item);
					if (inventoryItems.length > 3) {
						inventorySprite.x -= 65;
					}
					item.x = (inventoryItems.length - 1) * 65;
					item.removeEventListener(TouchEvent.TOUCH, addToInventory);
					item.addEventListener(TouchEvent.TOUCH, useInventoryItem);
				}
			}
			
		}
		
		public function useInventoryItem(e:TouchEvent):void {
			var touch:Touch = e.getTouch(stage);
			if (touch) {
				if (touch.phase == TouchPhase.ENDED) {
					var item:TestItem = e.currentTarget as TestItem;
					//trace("Use Item: " + item.naam); 
					for each(var invItem:TestItem in inventoryItems) {
						var inv:TestItem = invItem;
						if (item.naam == invItem.naam) {
							trace (invItem.naam);	
						}
					}
				}
			}
		}
		
	}

}