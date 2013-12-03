package core.ui.uiobjects
{
	
	import starling.display.Graphics;
	import starling.display.Sprite;
	import starling.display.Shape;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import core.gameobject.Collectable;
	/**
	 * ...
	 * @author Henderikus
	 */
	public class Inventory extends UiObject 
	{
		private var inventoryItems:Vector.<Collectable>;
		private var inventorySprite:Sprite;
		
		public function Inventory() 
		{
			inventoryItems = new Vector.<Collectable>;
			inventorySprite = new Sprite();
			inventorySprite.x = 600;
			inventorySprite.y = -200;
			addChild(inventorySprite);
			
		}

		public function addToInventory(e:TouchEvent):void {
			var touch:Touch = e.getTouch(stage);
			if (touch) {
				if (touch.phase == TouchPhase.ENDED) {
					var item:Collectable = e.currentTarget as Collectable;
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
					var item:Collectable = e.currentTarget as Collectable;
					//trace("Use Item: " + item.naam); 
					for each(var invItem:Collectable in inventoryItems) {
						var inv:Collectable = invItem;
						//if (item.naam == invItem.naam) {
							//trace (invItem.naam);	
						//}
					}
				}
			}
		}
		
	}

}