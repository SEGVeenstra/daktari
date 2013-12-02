package core.gameobject 
{
	import core.key.Key;
	import flash.geom.Point;
	import Game;
	import core.level.Level;
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
		static const MODE_CLIMBING:int = 2;
		
		protected const MAX_RUN_SPEED:Number = 6;
		protected const MAX_JUMP_SPEED:Number = 12;
		protected const JUMP_HEIGHT:Number = 10;
		
		private var shape:Shape;
		protected var climbable:GameObject;
		
		protected var runSpd:Number = 0;
		protected var jumpSpd:Number = 0.1;
		protected var pressedJmp:Boolean = false;
		
		private var _startPosition:Point;
		
		public function Character(id:String, x:Number, y:Number) 
		{
			super(id, x, y);
			_startPosition = new Point(x, y);
			collider = new Rectangle(x, y, Level.GRIDSIZE * 3, Level.GRIDSIZE * 5);
			Draw();
			mode = MODE_AIRBOURNE;
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		/**
		 * Returns the start position of this Object
		 */
		public function get startPosition():Point
		{
			return _startPosition;
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
			if (!paused)
			{
				Control();
				UpdateCollisions();
				SetBlocks();
				if(mode != MODE_CLIMBING)
					CorrectAll();
				Move();
			}
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
				case MODE_CLIMBING:
					ControlClimb();
					break;
			}
		}
		
		/**
		 * Control the character when he is climbing
		 */
		private function ControlClimb():void 
		{
			if (!climbable)
			{
				mode = MODE_AIRBOURNE;
				return;
			}
			if (collider.bottom > climbable.collider.bottom && blockedBottom)
				collider.y = climbable.collider.bottom - collider.height;
			
			if (Key.isDown(Key.ARROW_UP))
			{
				collider.y -= MAX_RUN_SPEED / 2;
			}
			if (Key.isDown(Key.ARROW_DOWN) && (collider.bottom < climbable.collider.bottom))
			{
				collider.y += MAX_RUN_SPEED;
			}
			if (Key.isDown(Key.ARROW_LEFT) && !(Key.isDown(Key.ARROW_DOWN) || Key.isDown(Key.ARROW_UP)))
			{
				mode = MODE_AIRBOURNE;
				runSpd = -MAX_RUN_SPEED;
				return;
			}
			if (Key.isDown(Key.ARROW_RIGHT) && !(Key.isDown(Key.ARROW_DOWN) || Key.isDown(Key.ARROW_UP)))
			{
				mode = MODE_AIRBOURNE;
				runSpd = MAX_RUN_SPEED;
				return;
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
			if (blockedLeft || blockedRight)
			{
				runSpd = 0;
			}
			
			if (Key.isDown(Key.ARROW_LEFT) && !blockedLeft && !Key.isDown(Key.ARROW_RIGHT))
			{
				if (runSpd == 0)
					runSpd = -1.6;
				else if (runSpd > 0)
					runSpd *= 1 - MAX_RUN_SPEED / 60;
				else if(runSpd < -MAX_RUN_SPEED)
					runSpd *= 1 + MAX_RUN_SPEED / 60;
			}
			if (Key.isDown(Key.ARROW_RIGHT) && !blockedRight && !Key.isDown(Key.ARROW_LEFT))
			{
				if (runSpd == 0)
					runSpd = 1.6;
				else if (runSpd < 0)
					runSpd *= 1 - MAX_RUN_SPEED / 60;
				else if(runSpd > MAX_RUN_SPEED)
					runSpd *= 1 + MAX_RUN_SPEED / 60;
			}
			
			if (climbable && (Key.isDown(Key.ARROW_UP) || Key.isDown(Key.ARROW_DOWN)))
			{
				collider.x = (climbable.collider.left + (climbable.collider.width/2)) - collider.width/2;
				mode = MODE_CLIMBING;
				return;
			}
			if(!Key.isDown(Key.ARROW_LEFT) && !Key.isDown(Key.ARROW_RIGHT))
				runSpd *= 1 - MAX_RUN_SPEED / 60;
				
			collider.x += runSpd;
			
			if (jumpSpd == 0) jumpSpd = 1;
			
			var jumpRatio:int = 150;
			if (!Key.isDown(Key.CTRL_LEFT) || !pressedJmp)
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
			if (!blockedBottom)
			{
				mode = MODE_AIRBOURNE;
				jumpSpd = 1.6;
				return;
			}
			
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
			if (!Key.isDown(Key.ARROW_RIGHT) && !Key.isDown(Key.ARROW_LEFT))
				runSpd = 0;
			else if (Key.isDown(Key.ARROW_RIGHT) && Key.isDown(Key.ARROW_LEFT))
				runSpd = 0;
			if (Key.isDown(Key.CTRL_LEFT) && !blockedTop && !pressedJmp)
			{
				collider.y -= 1;
				mode = MODE_AIRBOURNE;
				pressedJmp = true;
				jumpSpd = MAX_JUMP_SPEED * -1;
				return;
			}
			else if (!Key.isDown(Key.CTRL_LEFT))
			{
				pressedJmp = false;
			}
			if (Key.isDown(Key.ARROW_UP))
			{
				if (climbable)
				{
					if (climbable.collider.top < collider.top)
					{
						collider.x = (climbable.collider.left + (climbable.collider.width/2)) - collider.width/2;
						mode = MODE_CLIMBING;
						return;
					}
				}
			}
			if (Key.isDown(Key.ARROW_DOWN))
			{
				if (climbable)
				{
					collider.x = (climbable.collider.left + (climbable.collider.width/2)) - collider.width/2;
					mode = MODE_CLIMBING;
					return;
				}
			}
		}
		
		 /**
		 * Set the block properties based on the collisions
		 */
		override protected function SetBlocks():void
		{
			blockedLeft = null;
			blockedBottom = null;
			blockedRight = null;
			blockedTop = null;
			climbable = null;
			
			for each(var o:GameObject in collisions)
			{
				if (o.active)
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
					else if (o is Climbable)
					{
						climbable = o;
					}
				}
			}
		}
		
	}

}