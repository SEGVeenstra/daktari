package core.gameobject 
{
	import core.level.Level;
	import starling.display.Shape;
	import starling.events.EnterFrameEvent;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class TutorialObject extends GameObject 
	{
		
		public function TutorialObject(id:String, x:Number,y:Number,width:Number,height:Number) 
		{
			super(id, x, y);
			collider.x = x * Level.GRIDSIZE;
			collider.y = y * Level.GRIDSIZE;
			collider.width = width * Level.GRIDSIZE;
			collider.height = height * Level.GRIDSIZE;
			Draw(width,height);
			addEventListener(EnterFrameEvent.ENTER_FRAME, OnEnterFrame);
		}
		
		private function Draw(width:Number, height:Number):void
		{
			debugShape = new Shape();
			debugShape.graphics.beginFill(0x58FAF4, 0.6);
			debugShape.graphics.drawRect(0, 0, width * Level.GRIDSIZE, height* Level.GRIDSIZE);
			debugShape.graphics.endFill();
			addChild(debugShape);
		}
		
		private function OnEnterFrame(e:EnterFrameEvent):void 
		{
			if (active && !paused)
			{
				Check();
			}
		}
		
		/**
		 * Check for collision
		 */
		protected function Check():void 
		{
			
		}
	}

}