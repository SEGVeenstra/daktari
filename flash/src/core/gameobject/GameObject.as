package core.gameobject 
{
	import core.collision.Collider;
	import starling.display.Sprite;
	
	/**
	 * Is an object that can be placed into a level
	 * @author SEG.Veenstra
	 */
	public class GameObject extends Sprite 
	{
		public var collider:Collider;
		
		public function GameObject() 
		{
			
		}
		
		/**
		 * Checks if this collider collides with the given collider
		 * @param	col Collider to check collision with
		 * @return 	TRUE or FALSE depending on if this collider hits the other collider
		 */
		public function Collide(col:Collider):Boolean
		{
			return false;
		}
		
	}

}