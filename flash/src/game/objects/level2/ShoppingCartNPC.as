package game.objects.level2
{
	import core.gameobject.collectable.Item;
	import core.gameobject.Npc;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class ShoppingCartNPC extends Npc 
	{
		
		public function ShoppingCartNPC(id:String, x:Number, y:Number, points:int = 0, reward:Item = null ) 
		{
			super(id, x, y, 5, 4, points, reward);
		}
		
		override public function Interact():void 
		{
			if (GetReferencedItems(false).length == 0)
				Game.gameScreen.Finished();
		}
	}

}