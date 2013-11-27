package core.gameobject 
{
	import core.collision.Collider;
	import core.key.Key;
	import core.screen.subscreen.Level;
	import flash.geom.Rectangle;
	import starling.display.Shape;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	/**
	 * Creates a moveable character that can be controlled by the player
	 * @author SEG.Veenstra
	 */
	public class Character extends MovableGameObject 
	{
		protected const MAX_RUN_SPEED:Number = 6;
		protected const MAX_JUMP_SPEED:Number = 12;
		protected const JUMP_HEIGHT:Number = 10;
		
		private var shape:Shape;
		protected var climbable:GameObject;
		
		protected var runSpd:Number = 0;
		protected var jumpSpd:Number = 0.1;
		protected var pressedJmp:Boolean = false;
		
		public function Character(id:String, x:Number, y:Number) 
		{
			super(id, x, y);
			collider = new Rectangle(x, y, Level.GRIDSIZE * 3, Level.GRIDSIZE * 5);
			Draw();
			mode = MODE_AIRBOURNE;
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function Draw():void
		{
			shape = new Shape();
			shape.graphics.beginFill(0x00FF00, 0.6);
			shape.graphics.drawRect(0, 0, Level.GRIDSIZE * 3, Level.GRIDSIZE * 5);
			shape.graphics.endFill();
			
			addChild(shape);
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			addEventListener(EnterFrameEvent.ENTER_FRAME, OnEnterFrame);
		}
		
		private function OnEnterFrame(e:EnterFrameEvent):void 
		{
			Control();
			UpdateCollisions();
			SetBlocks();
			CorrectAll();
			Move();
		}
		
		/**
		 * Moves this object based on it's collider
		 */
		private function Move():void 
		{
			x = collider.x;
			y = collider.y;
		}
		
		/**
		 * Control this object
		 */
		private function Control():void 
		{
			switch (mode)
			{
				case MODE_GROUNDED:
					ControlGround();
					break;
				case MODE_AIRBOURNE:
					ControlAir();
					break;
			}
		}
		
		/**
		 * Control this object in the air
		 */
		private function ControlAir():void 
		{
			// If it touches the ground switch mode to grounded
			if (blockedBottom)
			{
				mode = MODE_GROUNDED;
				jumpSpd = 0;
				return;
			}
			if (blockedLeft && blockedRight)
				runSpd = 0;
			
			if (Key.isDown(Key.ARROW_LEFT) && !blockedLeft)
			{
				if (runSpd > 0)
					runSpd *= 1 - MAX_RUN_SPEED / 60;
				else if(runSpd < -MAX_RUN_SPEED)
					runSpd *= 1 + MAX_RUN_SPEED / 60;
			}
			else if (Key.isDown(Key.ARROW_RIGHT) && !blockedRight)
			{
				if (runSpd < 0)
					runSpd *= 1 - MAX_RUN_SPEED / 60;
				else if(runSpd > MAX_RUN_SPEED)
					runSpd *= 1 + MAX_RUN_SPEED / 60;
			}
			else
				runSpd *= 1 - MAX_RUN_SPEED / 60;
				
			collider.x += runSpd;
			
			if (jumpSpd == 0) jumpSpd = 1;
			
			var jumpRatio:int = 150;
			if (!Key.isDown(Key.SPACEBAR) || !pressedJmp)
			{
				jumpRatio = 40;
				pressedJmp = false;
			}

			if (jumpSpd < 0)
			{
				if(!blockedTop)
					jumpSpd *= 1 - MAX_JUMP_SPEED / jumpRatio;
				else
					jumpSpd = -0.5;
					
				if(jumpSpd > -MAX_JUMP_SPEED/5)
					jumpSpd *= -1;
			}
			else if (jumpSpd < MAX_JUMP_SPEED)
			{
				jumpSpd *= 1 + MAX_JUMP_SPEED/60;
			}
			if(!blockedBottom)
				collider.y += jumpSpd;
		}
		
		/**
		 * Control this object on the ground
		 */
		private function ControlGround():void 
		{
			
			if (Key.isDown(Key.ARROW_LEFT) && !blockedLeft)
			{
				runSpd = -MAX_RUN_SPEED;
				collider.x += runSpd;
			}
			if (Key.isDown(Key.ARROW_RIGHT) && !blockedRight)
			{
				runSpd = MAX_RUN_SPEED;
				collider.x += runSpd;
			}
			if (Key.isDown(Key.SPACEBAR) && !blockedTop && !pressedJmp)
			{
				mode = MODE_AIRBOURNE;
				pressedJmp = true;
				jumpSpd = MAX_JUMP_SPEED * -1;
				return;
			}
			
			runSpd = 0;
		}
		
	}

}