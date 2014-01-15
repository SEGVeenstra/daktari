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
		private var medication:Array;
		private var image:Image; 
		private var indicator:TextField;
		private var _active:Boolean;
		private var text:String;
		public function Medicinindicator() 
		{
			medication = new Array();
			image = new Image(Assets.GetAtlas('collectables').getTexture('medicines'));
			indicator = new TextField(70, 40, text,'arial', 20, 0, true);
			draw();
		}
		
		private function draw():void {
			addChild(image);
			image.height = image.height - 5;
			image.width = image.width - 5;
			addChild(indicator);
			indicator.x = 25;
			updateIndicator();
		}
		
		private function updateIndicator():void {
			text ="x " + medication.length.toString();
			indicator.text = text;
		}
		
		public function addMedication(item:Item):void {
			medication.push(item);
			updateIndicator();
		}
		
		public function useMedication():void {
			
		}
		
		public function set active(setting:Boolean):void {
			_active = setting;
		}
		
		public function get active():Boolean {
			return _active;
		}
		
		
	}

}