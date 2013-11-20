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
		
	}

}