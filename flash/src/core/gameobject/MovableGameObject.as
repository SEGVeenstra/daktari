package core.gameobject 
{
	import core.screen.subscreen.Level;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class MovableGameObject extends GameObject 
	{
		static const MODE_GROUNDED:int = 0;
		static const MODE_AIRBOURNE:int = 1;
		
		protected var blockedLeft:GameObject;
		protected var blockedRight:GameObject;
		protected var blockedTop:GameObject;
		protected var blockedBottom:GameObject;
		
		protected var collisions:Vector.<GameObject> = new Vector.<GameObject>();
		
		protected var mode:int;
		
		public function MovableGameObject(id:String, x:Number, y:Number) 
		{
			super(id, x, y);
		}
		
		/**
		 * Update the collisions for this object the collisions
		 * @return returns the new Vector with colliding GameObjects
		 */
		protected function UpdateCollisions():Vector.<GameObject> 
		{
			collisions = new Vector.<GameObject>();
			for each(var o:GameObject in Level.current.gameObjects)
			{
				if (Collide(o))
					collisions.push(o);
			}
			return collisions;
		}
		
		/**
		 * Set the block properties based on the collisions
		 */
		protected function SetBlocks():void
		{
			blockedLeft = null;
			blockedBottom = null;
			blockedRight = null;
			blockedTop = null;
			
			for each(var o:GameObject in collisions)
			{
				if (o.solid)
				{
					var intersect:Rectangle = collider.intersection(o.collider);
					if (intersect.height > intersect.width)
					{
						if (intersect.x + (intersect.width / 2) < collider.x + (collider.width / 2))
							blockedLeft = o;
						else
							blockedRight = o;
					}
					else
						if (intersect.y + (intersect.height / 2) < collider.y + (collider.height / 2))
							blockedTop = o;
						else
							blockedBottom = o;
				}
			}
		}
		
		/**
		 * Correct the colliders location based on the blockades
		 */
		protected function CorrectAll():void
		{
			CorrectBottom();
			CorrectLeft();
			CorrectTop();
			CorrectRight();
		}
		
		/**
		 * Correct placement on the x-axis based on the blockedLeft GameObject if exists
		 */
		protected function CorrectLeft():void
		{
			if (blockedLeft)
			{
				var overlap:Rectangle = collider.intersection(blockedLeft.collider);
				collider.x += (overlap.right - collider.left);
			}
		}
		
		/**
		 * Correct placement on the y-axis based on the blockedTop GameObject if exists
		 */
		protected function CorrectTop():void
		{
			if (blockedTop)
			{
				var overlap:Rectangle = collider.intersection(blockedTop.collider);
				collider.y += overlap.bottom - collider.top;
			}
		}
		
		/**
		 * Correct placement on the y-axis based on the blockedBottom GameObject if exists
		 */
		protected function CorrectBottom():void
		{
			if (blockedBottom)
			{
				var overlap:Rectangle = collider.intersection(blockedBottom.collider);
				collider.y += (overlap.top - collider.bottom)+1;
			}
		}
		
		/**
		 * Correct placement on the x-axis based on the blockedRight GameObject if exists
		 */
		protected function CorrectRight():void
		{
			if (blockedRight)
			{
				var overlap:Rectangle = collider.intersection(blockedRight.collider);
				collider.x += overlap.left - collider.right;
			}
		}
	}

}