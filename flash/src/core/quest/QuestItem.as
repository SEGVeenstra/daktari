package core.quest 
{
	import core.gameobject.collectable.Item;
	import starling.display.Image;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class QuestItem 
	{
		public var reference:Item;
		public var collected:Boolean = false;
		public var image:Image;
		
		public function QuestItem(reference:Item, image:Image) 
		{
			this.reference = reference;
			this.image = image;
		}
		
	}

}