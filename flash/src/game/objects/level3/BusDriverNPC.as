package game.objects.level3 
{
	import core.gameobject.collectable.Item;
	import core.gameobject.Npc;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class BusDriverNPC extends Npc 
	{
		
		public function BusDriverNPC(id:String, x:Number, y:Number, points:int = 0, reward:Item = null ) 
		{
			super(id, x, y, 3, 6, points, reward);
		}
		
		override public function Interact():void 
		{
			if (GetReferencedItems(false).length == 0)
				Game.gameScreen.Finished();
		}
	}

}