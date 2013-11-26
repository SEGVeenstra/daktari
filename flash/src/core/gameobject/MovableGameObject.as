package core.gameobject 
{
	import core.screen.subscreen.Level;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class MovableGameObject extends GameObject 
	{
		protected var blockedLeft:GameObject;
		protected var blockedRight:GameObject;
		protected var blockedTop:GameObject;
		protected var blockedBottom:GameObject;
		
		public function MovableGameObject(id:String, x:Number, y:Number, width:Number, height:Number) 
		{
			super(id, x, y, width, height);
			CheckCollisions();
		}
		
		protected function CheckCollisions():void 
		{
			trace(Level.current.gameObjects.length);
		}
		
	}

}