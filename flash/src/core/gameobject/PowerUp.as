package core.gameobject 
{
	/**
	 * A power up can be collected by the player and takes effect immidetly
	 * @author SEG.Veenstra
	 */
	public class PowerUp extends Collectable 
	{
		
		private var points:int;
		
		public function PowerUp(id:String, x:Number, y:Number, points:int) 
		{
			super(id, x, y);
			this.points = points;
		}
		
	}

}