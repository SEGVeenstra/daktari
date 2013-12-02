package core.menu.menuobject 
{
	import starling.display.Shape;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	/**
	 * Creates a button to be used in a menu
	 * @author SEG.Veenstra
	 */
	public class Button extends MenuObject 
	{
		private var backgroundInactive:Texture;
		private var backgroundActive:Texture;
		private var textfield:TextField;
		
		public function Button(id:String, width:Number, height:Number, text:String, backgroundInactive:Texture = null, backgroundActive:Texture = null) 
		{
			super(id);
			this.backgroundActive = backgroundActive;
			this.backgroundInactive = backgroundInactive;
			textfield = new TextField(width, height, text, 'Arial', 20, 0, true);
			Draw(width,height);
		}
		
		private function Draw(width:Number, height:Number):void 
		{
			addChild(textfield);
		}
		
		override public function get active():Boolean 
		{
			return super.active;
		}
		
		override public function set active(value:Boolean):void 
		{
			super.active = value;
			if(value)
				textfield.color = 0x00ff00;
			else
				textfield.color = 0;
		}
		
	}

}