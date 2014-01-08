package core.gameobject 
{
	import core.gameobject.collectable.Item;
	import core.level.Level;
	import feathers.controls.ImageLoader;
	import starling.display.Image;
	import starling.display.Shape;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Switch extends GameObject 
	{
		
		protected var offImage:Image;
		protected var onImage:Image;
		
		public var keyID:String;
		public var target:Gate;
		
		private var _isOn:Boolean;
		
		public function Switch(id:String, x:Number,y:Number, onImage:Image, offImage:Image, isOn:Boolean = false) 
		{
			super(id, x, y);
			collider.width = 2 * Level.GRIDSIZE;
			collider.height = 2 * Level.GRIDSIZE;
			collider.x = this.x;
			collider.y = this.y;
			Draw();
			this.offImage = offImage;
			this.onImage = onImage;
			addChild(offImage);
			addChild(onImage);
			offImage.visible = !isOn;
			onImage.visible = isOn;
			_isOn = isOn;
		}
		
		public function get isOn():Boolean
		{
			return _isOn;
		}
		
		private function Draw():void 
		{
			debugShape = new Shape();
			debugShape.graphics.beginFill(0x22ff22,0.6);
			debugShape.graphics.drawRect(0, 0, 2 * Level.GRIDSIZE, 2 * Level.GRIDSIZE);
			debugShape.graphics.endFill();
			addChild(debugShape);
		}
		
		override public function Interact():void
		{
			trace(keyID);
			if (target.isLocked && keyID && !_isOn)
			{
				var i:Item = Game.gameScreen.userInterface.inventory.GetItemWithID(keyID);
				if (i)
				{
					Game.gameScreen.userInterface.inventory.useInventoryItem(i);
					target.Unlock();
					_isOn = true;
					onImage.visible = true;
					offImage.visible = false;
				}
			}
		}
	}

}