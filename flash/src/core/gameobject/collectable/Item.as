package core.gameobject.collectable 
{
	/**
	 * Items can be collected by the player and are stored in the Inventory
	 * @author SEG.Veenstra
	 */
	public class Item extends Collectable 
	{
		
		public function Item(id:String,x:Number,y:Number) 
		{
			super(id, x, y);
		}
		
	}

}