package core.ui.uiobjects
{
	
	import core.gameobject.collectable.Item;
	import starling.display.Sprite;
	import mx.utils.ObjectUtil;
	
	/**
	 * this class controls the players inventory
	 * @author Henderikus
	 */
	public class Inventory extends UiObject 
	{
		private var inventoryItems:Array;
		private var inventorySprite:Sprite;
		private var inventorySize:Number = 5;
		private var defaultX:Number = 600;
		private var defaultY:Number = -200;
		
		/**
		 * constructor
		 */
		public function Inventory() 
		{
			inventoryItems = new Array();
			inventorySprite = new Sprite();
			inventorySprite.x = defaultX;
			inventorySprite.y = defaultY;
			addChild(inventorySprite);
			
		}
		
		/**
		 * add item to inventory when inventory still has room
		 * @param	item
		 */
		public function addToInventory(item:Item):void {
			if (this.play) {
				if (inventoryItems.length < inventorySize) {
					if (item is Item) {
						inventoryItems.push(item);
						inventorySprite.addChild(item);
						if (inventoryItems.length > 3) {
							inventorySprite.x -= 65;
						}
						item.x = (inventoryItems.length - 1) * 65;
					}	
				}
				//showInventoryItems();
			}	
		}
		
		/**
		 * this method allows the player the use a certain 
		 * item in the inventory
		 * 
		 * @param	item
		 */
		public function useInventoryItem(item:Item):void {
			if (this.play) {
				var indexItem:Number = inventoryItems.indexOf(item);
				inventoryItems.splice(indexItem, 1);
				inventorySprite.removeChild(item);
				showInventoryItems();
				redrawInventory();
			}
		}
		
		/**
		 * function that traces the items in the inventoryItems array
		 */
		public function showInventoryItems():void {
			for each(var i:Item in inventoryItems) {
				trace(inventoryItems.indexOf(i) + " " + i.id);
			}
		}
		
		/**
		 * this function redraws the inventorySprite and it's items
		 */
		private function redrawInventory():void {
			var position:Number = 0;
			resetInventorySprite();
			for each(var i:Item in inventoryItems) {
				position += 1;
				inventorySprite.addChild(i);
				if (inventoryItems.length > 3 && inventorySprite.x == defaultX) {
					inventorySprite.x -= 65;
				}
				i.x = (position - 1) * 65;
			}
		}
		/**
		 * reset the players inventory by removing every item in the inventory
		 * and rebuilding the sprite
		 */
		public function reset():void {
			resetInventorySprite();
			var size:Number = inventoryItems.length;
			inventoryItems.splice(0, size);
		}
		
		/**
		 * removes the old inventorySprite and replaces it with a new inventory sprite 
		 */
		private function resetInventorySprite():void {
			removeChild(inventorySprite);
			inventorySprite = new Sprite();
			inventorySprite.x = defaultX;	
			inventorySprite.y = defaultY;
			addChild(inventorySprite);
		}
		
		/**
		 * check if item is in inventory
		 * @param	item
		 * @return
		 */
		public function containsItem(item:Item):Boolean {
			var check:Boolean = false;
			for each(var invItem:Item in inventoryItems) {
				if (ObjectUtil.compare(invItem, item) == 0){
					check = true;
				}
			}
			return check;
		}
	}

}