package core.gameobject 
{
	import core.gameobject.collectable.Collectable;
	import core.gameobject.collectable.Item;
	import core.gameobject.collectable.PowerUp;
	import core.key.Key;
	import core.level.Level;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import Game;
	import starling.display.Shape;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	/**
	 * Creates a moveable character that can be controlled by the player
	 * @author SEG.Veenstra
	 */
	public class Character extends MovableGameObject 
	{
		static public const MODE_CLIMBING:int = 2;
		static public const MODE_INDOOR:int = 3;
		
		protected const MAX_RUN_SPEED:Number = 5;
		protected const MAX_JUMP_SPEED:Number = 12;
		protected const JUMP_HEIGHT:Number = 10;
		protected const MAX_HEALTH:int = 100;
		protected const MAX_VITALITY:int = 120;
		
		protected var climbable:GameObject;
		protected var door:Door;
		
		protected var runSpd:Number = 0;
		protected var jumpSpd:Number = 0.1;
		protected var pressedJmp:Boolean = false;
		protected var switchedDoors:Boolean = false;
		
		private var _health:int = 100;
		private var _points:int = 0;
		private var _vitality:int = 120;
		
		public function Character(id:String, x:Number, y:Number) 
		{
			super(id, x, y);
			collider = new Rectangle(x * Level.GRIDSIZE, y * Level.GRIDSIZE, Level.GRIDSIZE * 3, Level.GRIDSIZE * 5);
			Draw();
			mode = MODE_AIRBOURNE;
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		/**
		 * returns the current health
		 */
		public function get health():int
		{
			return _health;
		}
		
		/**
		 * Apply damage to the Character
		 * @param	damage
		 */
		public function TakeHit(damage:int):void
		{
			if (health - damage <= 0)
				_health = 0;
			else
				_health -= damage;
		}
		
		/**
		 * Restores health to the character
		 * @param	health
		 */
		public function RestoreHealth(health:int):void
		{
			if (this.health + health >= MAX_HEALTH)
				_health = MAX_HEALTH;
			else
				_health += health;
		}
		
		/**
		 * Returns the current amount of points
		 */
		protected function get points():int
		{
			return _points;
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
				case MODE_INDOOR:
					ControlIndoor();
					break;
			}
		}
		
		private function ControlIndoor():void 
		{
			if (Key.isDown(Key.CTRL_LEFT))
			{
				pressedJmp = true;
				mode = MODE_GROUNDED;
				return;
			}
			if (!switchedDoors)
			{
				if (Key.isDown(Key.ARROW_DOWN) && door.exitDown)
				{
					switchedDoors = true;
					collider.x = (door.exitDown.collider.left + (door.exitDown.collider.width / 2) - collider.width / 2);
					collider.y = (door.exitDown.collider.bottom - collider.height);
				}
				if (Key.isDown(Key.ARROW_UP) && door.exitUp)
				{
					switchedDoors = true;
					collider.x = (door.exitUp.collider.left + (door.exitUp.collider.width / 2) - collider.width / 2);
					collider.y = (door.exitUp.collider.bottom - collider.height);
				}
				if (Key.isDown(Key.ARROW_LEFT) && door.exitLeft)
				{
					switchedDoors = true;
					collider.x = (door.exitLeft.collider.left + (door.exitLeft.collider.width / 2) - collider.width / 2);
					collider.y = (door.exitLeft.collider.bottom - collider.height);
				}
				if (Key.isDown(Key.ARROW_RIGHT) && door.exitRight)
				{
					switchedDoors = true;
					collider.x = (door.exitRight.collider.left + (door.exitRight.collider.width / 2) - collider.width / 2);
					collider.y = (door.exitRight.collider.bottom - collider.height);
				}
			}
			if (!Key.isDown(Key.ARROW_UP) && !Key.isDown(Key.ARROW_LEFT) && !Key.isDown(Key.ARROW_RIGHT) && !Key.isDown(Key.ARROW_DOWN))
				switchedDoors = false;
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
				else if (door)
				{
					collider.x = (door.collider.left + (door.collider.width / 2) - collider.width / 2);
					mode = MODE_INDOOR;
					switchedDoors = true;
					return;
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
				else if (door)
				{
					collider.x = (door.collider.left + (door.collider.width / 2) - collider.width / 2);
					mode = MODE_INDOOR;
					switchedDoors = true;
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
			door = null;
			
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
					else if (o is Door)
					{
						interactWithDoor(o as Door);
					}
					else if (o is Collectable)
					{
						CollectItem(o as Collectable);
					}
				}
			}
		}
		
		/**
		 * Interect with a door object that collided with the character
		 * @param	door
		 */
		private function interactWithDoor(door:Door):void 
		{
			if (door.collider.containsPoint(new Point(collider.x+collider.width/2,collider.y)))
				this.door = door;
		}
		
		private function CollectItem(o:Collectable):void 
		{
			if (o is PowerUp)
			{
				var p:PowerUp = o as PowerUp;
				Game.gameScreen.level.RemoveGameObject(o);
				trace('points +' + p.points, 'health +' + p.health);
			}
			else if (o is Item)
			{
				var i:Item = o as Item;
				Game.gameScreen.level.RemoveGameObject(o);
				trace('Added item:' + i.id + ' to inventory!');
			}
			
		}
		
	}

}