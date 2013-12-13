package core.gameobject 
{
	import core.gameobject.collectable.Item;
	import core.level.Level;
	import flash.geom.Rectangle;
	import starling.display.Shape;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Npc extends GameObject 
	{
		public var points:int;
		
		private var _questItems:Vector.<Item> = new Vector.<Item>();
		
		public function Npc(id:String, x:Number,y:Number, width:Number,height:Number, points:int) 
		{
			super(id, x, y);
			this.points = points;
			solid = false;
			width *= Level.GRIDSIZE;
			height *= Level.GRIDSIZE;
			x *= Level.GRIDSIZE;
			y *= Level.GRIDSIZE;
			collider = new Rectangle(x,y, width , height);
			Draw(width,height);
		}
		
		public function get questItems():Vector.<Item>
		{
			return _questItems;
		}
		
		public function AddQuestItem(item:Item):void
		{
			if (_questItems.indexOf(item) == -1)
			{
				_questItems.push(item);
			}
		}
		
		public function RemoveQuestItem(item:Item):void
		{
			var index:int = questItems.indexOf(item);
			if (index != -1)
			{
				_questItems.splice(index, 1);
			}
		}
		
		private function Draw(width:Number, height:Number):void
		{
			debugShape = new Shape();
			debugShape.graphics.beginFill(0x92E5FF, 0.6);
			debugShape.graphics.drawRect(0, 0, width, height);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
		
	}

}