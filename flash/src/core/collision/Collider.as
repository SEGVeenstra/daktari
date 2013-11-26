package core.collision 
{
	/**
	 * A Collider represents the area that detects the collision between GameObjects
	 * @author SEG.Veenstra
	 */
	public class Collider 
	{
		public const ALIGN_TOP:Number = 1;
		public const ALIGN_MIDDLE:Number = 0.5;
		public const ALIGN_BOTTOM:Number = 0;
		public const ALIGN_LEFT:Number = 1;
		public const ALIGN_CENTER:Number = 0.5;
		public const ALIGN_RIGHT:Number = 0;
		
		public var x:Number;
		public var y:Number;
		public var width:Number;
		public var height:Number;
		public var alignV:Number;
		public var alignH:Number;
		
		public function Collider(x:Number = 0, y:Number = 0, width:Number = 10, height:Number = 10, alignV:Number = ALIGN_TOP, alignH:Number = ALIGN_LEFT) 
		{
			this.x = x;
			this.y = y;
			this.width = width;
			this.height = height;
			this.alignV = alignV;
			this.alignH = alignH;
		}
		
		/**
		 * Compares this Collider with a given Collider and checks if they collide with each other
		 * @param	col
		 * @return	Boolean TRUE if the colliders overlap else FALSE
		 */
		public function Collide(col:Collider):Boolean
		{
			if (GetTop() > col.GetBottom() || GetBottom() < col.GetTop())
				return false;
			if (GetLeft() > col.GetRight() || GetRight() < col.GetLeft())
				return false;
			return true;
		}
		
		/**
		 * Returns the position of the TOP of the collider
		 * @return Number The TOP of the collider
		 */
		public function GetTop():Number
		{
			return (y - height) + (height * alignV);
		}
		
		/**
		 * Returns the position of the BOTTOM of the collider
		 * @return Number The BOTTOM of the collider
		 */
		public function GetBottom():Number
		{
			return GetTop() + height;
		}
		
		/**
		 * Returns the position of the LEFT sde of the collider
		 * @return Number The LEFT side of the collider
		 */
		public function GetLeft():Number
		{
			return (x - width) + (width * alignH);
		}
		
		/**
		 * Returns the position of the RIGHT side of the collider
		 * @return Number The RIGHT side of the collider
		 */
		public function GetRight():Number
		{
			return GetLeft() + width;
		}
	}

}