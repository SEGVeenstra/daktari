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
		public const inventorySize:Number = 5;

	
		
		/**
		 * constructor
		 */
		public function Inventory() 
		{
			inventoryItems = new Array(inventorySize);
		}
		
		/**
		 * add item to inventory when inventory still has room
		 * @param	item
		 */
		public function addToInventory(item:Item):Boolean {
			var added:Boolean = false;
			var indexItem:Number;
			if (this.play) {
				for (var i:Number = 0; i <= inventoryItems.length; i++ ) {
					var invItem:Item = inventoryItems[i];
					if (invItem == null && added == false) {
							inventoryItems[i] = item;
							addChild(item);
							item.x = i * 65;
							item.y = 0;	
							added = true;
					}	
				}
			}
			return added;
		}
		
		/**
		 * this method allows the player the use a certain 
		 * item in the inventory
		 * 
		 * @param	item
		 */
		public function useInventoryItem(item:Item):void{
			var added:Boolean = false;
			if (this.play) {
				var indexItem:Number = inventoryItems.indexOf(item);
				inventoryItems[indexItem] = null;
				removeChild(item);
			}
		}
		
		/**
		 * reset the players inventory by removing every item in the inventory
		 * and rebuilding the sprite
		 */
		public function reset():void {
			var size:Number = inventoryItems.length;
			inventoryItems.splice(0, size);
			removeChildren();
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