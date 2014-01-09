package core.gameobject 
{
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import core.level.Level;
	
	/**
	 * ...
	 * @author Henderikus
	 */
	public class MovableEnemy extends Enemy 
	{
		public var start:int;
		public var destination:int;
		public var speed:int;
		private var reached:Boolean = false;
		
		public function MovableEnemy(id:String, x:Number,y:Number, width:Number,height:Number, damage:int, points:int, destination:int, speed:int) 
		{
			super(id, x, y, width, height, damage, points);
			this.start = this.x;
			this.speed = speed;
			this.destination = destination * Level.GRIDSIZE;
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			
		}
		
		private function OnAddedToStage(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			addEventListener(EnterFrameEvent.ENTER_FRAME, EnterFrame);
		}
		
		private function EnterFrame(e:EnterFrameEvent):void {
			moveEnemy();
		}
		
		private function moveEnemy():void {
			if(!reached){	
					collider.x += speed;
					this.x += speed;
					if (this.x >= destination) {
						reached = true;
					}	
			}else{
				collider.x -= speed;
				this.x -= speed;
				if (this.x <= start) {
					reached = false;
				}
			}
			
		}
	
	}

}