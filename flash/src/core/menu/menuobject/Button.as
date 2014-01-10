package core.menu.menuobject 
{
	import starling.display.Image;
	import starling.display.Shape;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	/**
	 * Creates a button to be used in a menu
	 * @author SEG.Veenstra
	 */
	public class Button extends MenuObject 
	{
		private var backgroundInactive:Image;
		private var backgroundActive:Image;
		private var textfield:TextField;
		
		public function Button(id:String, width:Number, height:Number, text:String, backgroundInactive:Texture = null, backgroundActive:Texture = null) 
		{
			super(id);
			if(backgroundActive)
				this.backgroundActive = new Image(backgroundActive);
			if(backgroundInactive)
				this.backgroundInactive = new Image(backgroundInactive);
			
			Draw(width,height,text);
		}
		
		private function Draw(width:Number, height:Number, text:String):void 
		{
			if (this.backgroundActive)
			{
				addChild(this.backgroundActive);
				this.backgroundActive.visible = active;
			}
			if (this.backgroundInactive)
			{
				addChild(this.backgroundInactive);
				this.backgroundInactive.visible = !active;
			}
			textfield = new TextField(width, height, text, 'Arial', 20, 0, true);
			addChild(textfield);
		}
		
		override public function get active():Boolean 
		{
			return super.active;
		}
		
		override public function set active(value:Boolean):void 
		{
			super.active = value;
			if (value)
			{
				textfield.color = 0x00ff00;
			}
			else
			{
				textfield.color = 0;
			}
			
			if(this.backgroundActive)
				this.backgroundActive.visible = value;
			if(this.backgroundInactive)
				this.backgroundInactive.visible = !value;
		}
		
	}

}