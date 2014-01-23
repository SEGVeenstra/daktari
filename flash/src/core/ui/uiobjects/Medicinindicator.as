package core.ui.uiobjects 
{
	import core.gameobject.collectable.Item;
	import core.asset.Assets;
	import starling.text.TextField;
	import starling.display.Image;
	/**
	 * ...
	 * @author Henderikus
	 */
	public class Medicinindicator extends UiObject 
	{
		private var image:Image; 
		private var indicator:TextField;
		private var _active:Boolean;
		
		private var _medicationCount:int;
		
		public function Medicinindicator() 
		{
			image = new Image(Assets.GetAtlas('collectables').getTexture('medicines'));
			indicator = new TextField(70, 40, '0','arial', 20, 0, true);
			draw();
		}
		
		private function draw():void {
			addChild(image);
			image.height = image.height - 5;
			image.width = image.width - 5;
			addChild(indicator);
			indicator.x = 25;
		}
		
		public function addMedication(amount:int = 1):Boolean {
			trace(_medicationCount);
			if (active) 
			{
				_medicationCount += amount;
				indicator.text = _medicationCount + '';
				
				return true;
			}
			else
				return false;
		}
		
		public function removeMedication(amount:int = 1):Boolean {
			if (active && (_medicationCount - amount ) >= 0)
			{
				_medicationCount -= amount;
				indicator.text = _medicationCount + '';
				return true;
			}
			else
				return false;
		}
		
		public function set active(setting:Boolean):void {
			_active = setting;
		}
		
		public function get active():Boolean {
			return _active;
		}
		
		public function reset():void {
			_medicationCount = 0;
			indicator.text = _medicationCount + '';
		}
		
	}

}