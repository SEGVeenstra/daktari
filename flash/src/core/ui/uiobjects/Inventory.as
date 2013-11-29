package core.ui.uiobjects
{
	import starling.display.Graphics;
	import starling.display.Sprite;
	import starling.display.Shape;
	/**
	 * ...
	 * @author Henderikus
	 */
	public class Inventory extends UiObject 
	{
		private var inventory:Vector.<Object>;
		
		public function Inventory() 
		{
			inventory = new Vector.<Object>;
			setupInventoryBox();
		}
		
		private function setupInventoryBox():void {
			var high:Number = 30;
			var box:Shape = new Shape();
			this.addChild(box);
			box.x = 600;
			
			var inv:Graphics = box.graphics;
			inv.lineStyle(1, 0x000000);
			inv.beginFill(0xFFFFFF);
			inv.lineTo(200,0);
			inv.lineTo(200,high);
			inv.lineTo(0,high);
			inv.lineTo(0,0);
			inv.endFill();
		}
		
	}

}