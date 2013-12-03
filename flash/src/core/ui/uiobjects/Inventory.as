package core.ui.uiobjects
{
	
	import starling.display.Graphics;
	import starling.display.Sprite;
	import starling.display.Shape;
	import core.gameobject.Collectable;
	
	/**
	 * ...
	 * @author Henderikus
	 */
	public class Inventory extends UiObject 
	{
		private var inventoryItems:Array;
		private var inventorySprite:Sprite;
		private var inventorySize:Number = 5;
		
		public function Inventory() 
		{
			inventoryItems = new Array();
			inventorySprite = new Sprite();
			inventorySprite.x = 600;
			inventorySprite.y = -200;
			addChild(inventorySprite);
			
		}

		public function addToInventory(item:Collectable):void {
			if (this.play == true) {
				if (inventoryItems.length < inventorySize) {
					if (item is Collectable) {
						inventoryItems.push(item);
						inventorySprite.addChild(item);
						if (inventoryItems.length > 3) {
							inventorySprite.x -= 65;
						}
						item.x = (inventoryItems.length - 1) * 65;
					}	
				}
			}	
		}
		
		
		public function useInventoryItem(item:Collectable):void {
			var newArray:String = "";
			var useItem:Collectable;
			var indexItem:Number = inventoryItems.indexOf(item);
			trace (indexItem);
			useItem = inventoryItems[indexItem];
			trace (useItem.id);
			inventoryItems = inventoryItems.splice(indexItem, 1);
			inventorySprite.removeChild(useItem);
			for (var i:Number; i < Array.length; i++) {
				var curItem:Collectable = inventoryItems[i];
				newArray += inventoryItems.indexOf(curItem) + " : " + curItem.id + " ";
			}
			//trace (inventoryItems);
		}
		
		public function removeFromInventory():void {
			
		}
	}

}