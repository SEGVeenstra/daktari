package core.visualobject 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class VisualObject extends Sprite 
	{
		private var _art:Image;
		
		public function VisualObject(art:Texture) 
		{
			SetArt(new Image(art));
		}
		
		protected function SetArt(art:Image):void
		{
			_art = art;
			addChild(art);
		}
		
	}

}