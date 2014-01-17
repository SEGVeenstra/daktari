package core.gameobject 
{
	import core.gameobject.collectable.Collectable;
	import core.gameobject.collectable.Item;
	import core.gameobject.collectable.Medication;
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
		protected const MAX_JUMP_HEIGHT:Number = 150;
		protected const MAX_HEALTH:int = 100;
		protected const MAX_VITALITY:int = 100;
		protected const ILLNESS_INTENSITIE:Number = 0.05;
		
		protected var climbable:GameObject;
		protected var door:Door;
		
		private var _runSpd:Number = 0;
		private var _jumpSpd:Number = 0.1;
		private var _currentJump:Number = 150;
		protected var pressedJmp:Boolean = false;
		protected var pressedMedication:Boolean = false;
		protected var switchedDoors:Boolean = false;
		
		private var _health:int = 100;
		private var _points:int = 0;
		private var _vitality:Number = 100;
		
		public var isSick:Boolean;
		
		public function Character(id:String, x:Number, y:Number, isSick:Boolean = false) 
		{
			super(id, x, y);
			this.isSick = isSick;
			collider = new Rectangle(x * Level.GRIDSIZE, y * Level.GRIDSIZE, Level.GRIDSIZE * 3, Level.GRIDSIZE * 5);
			Draw();
			mode = MODE_AIRBOURNE;
			addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		/**
		 * Returns the running speed
		 */
		public function get runSpd():Number
		{
			return _runSpd * vitalityRatio;
		}
		
		/**
		 * Set the running speed
		 */
		public function set runSpd(speed:Number):void
		{
			_runSpd = speed;
		}
		
		public function set jumpSpd(speed:Number):void
		{
			_jumpSpd = speed;
		}
		
		public function get jumpSpd():Number
		{
			return _jumpSpd;
		}
		
		public function get currentJump():Number
		{
			return _currentJump;
		}
		
		public function set currentJump(jump:Number):void
		{
			_currentJump = jump;
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
			{
				_health = 0;
				Game.gameScreen.userInterface.healthbar.looseHealth(Game.gameScreen.userInterface.healthbar.getCurrentHealth());
				Game.gameScreen.GameOver();
			}
			else
			{
				Game.gameScreen.userInterface.healthbar.looseHealth(damage);
				_health -= damage;
			}
		}
		
		/**
		 * Restores health to the character
		 * @param	health
		 */
		public function RestoreHealth(health:int):void
		{
			if (this.health + health >= MAX_HEALTH)
			{
				var rest:int = Game.gameScreen.userInterface.healthbar.getMaxHealth() - Game.gameScreen.userInterface.healthbar.getCurrentHealth();
				Game.gameScreen.userInterface.healthbar.reset();
				_health = MAX_HEALTH;
			}
			else
			{
				Game.gameScreen.userInterface.healthbar.restoreHealth(health);
				_health += health;
			}
		}
		
		/**
		 * Returns the current amount of points
		 */
		public function get points():int
		{
			return _points;
		}
		
		/**
		 * And an amount of points
		 * @param	points
		 */
		protected function AddPoints(points:int):void
		{
			_points += points;
			Game.gameScreen.userInterface.highscore.addScore(points);
		}
		
		/**
		 * Returns the ratio for the vitality
		 */
		protected function get vitalityRatio():Number
		{
			var perc:int = _vitality / MAX_VITALITY * 100;
			if (perc > 30)
				return 1;
			else if (perc > 15)
				return 0.8;
			else if (perc > 5)
				return 0.6;
			else
				return 0.4;
		}
		
		private function Draw():void
		{
			debugShape = new Shape();
			debugShape.graphics.beginFill(0x00FF00, 0.6);
			debugShape.graphics.drawRect(0, 0, Level.GRIDSIZE * 3, Level.GRIDSIZE * 5);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
		
		private function OnAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
			addEventListener(EnterFrameEvent.ENTER_FRAME, OnEnterFrame);
		}
		
		protected function OnEnterFrame(e:EnterFrameEvent):void 
		{
			if (!paused)
			{
				HandleIllnes();
				Control();
				UpdateCollisions();
				SetBlocks();
				if(mode != MODE_CLIMBING)
					CorrectAll();
				Move();
			}
		}
		
		/**
		 * Handles the decease
		 */
		private function HandleIllnes():void 
		{
			if (isSick)
			{
				if (_vitality < 1)
				{
					Game.gameScreen.GameOver(false);
					return;
				}
				_vitality -= ILLNESS_INTENSITIE;
				var v:int = _vitality;
				if (int(Game.gameScreen.userInterface.vitalitybar.curVitality) != v)
				{
					Game.gameScreen.userInterface.vitalitybar.setVitality(v);
				}
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
			if (Key.isDown(Key.SPACEBAR))
			{
				pressedJmp = true;
				door.open = false;
				mode = MODE_GROUNDED;
				return;
			}
			if (!switchedDoors)
			{
				if (Key.isDown(Key.ARROW_DOWN) && door.exitDown)
				{
					switchedDoors = true;
					door.open = false;
					door.exitDown.open = true;
					collider.x = (door.exitDown.collider.left + (door.exitDown.collider.width / 2) - collider.width / 2);
					collider.y = (door.exitDown.collider.bottom - collider.height);
				}
				if (Key.isDown(Key.ARROW_UP) && door.exitUp)
				{
					switchedDoors = true;
					door.open = false;
					door.exitUp.open = true;
					collider.x = (door.exitUp.collider.left + (door.exitUp.collider.width / 2) - collider.width / 2);
					collider.y = (door.exitUp.collider.bottom - collider.height);
				}
				if (Key.isDown(Key.ARROW_LEFT) && door.exitLeft)
				{
					switchedDoors = true;
					door.open = false;
					door.exitLeft.open = true;
					collider.x = (door.exitLeft.collider.left + (door.exitLeft.collider.width / 2) - collider.width / 2);
					collider.y = (door.exitLeft.collider.bottom - collider.height);
				}
				if (Key.isDown(Key.ARROW_RIGHT) && door.exitRight)
				{
					switchedDoors = true;
					door.open = false;
					door.exitRight.open = true;
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
			if(blockedBottom)
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
					runSpd = runSpd * 0.8;
				else if(runSpd > (-MAX_RUN_SPEED * vitalityRatio))
					runSpd = runSpd * 1.1;
			}
			if (Key.isDown(Key.ARROW_RIGHT) && !blockedRight && !Key.isDown(Key.ARROW_LEFT))
			{
				if (runSpd == 0)
					runSpd = 1.6;
				else if (runSpd < 0)
					runSpd = runSpd * 0.8;
				else if(runSpd < (MAX_RUN_SPEED * vitalityRatio))
					runSpd = runSpd * 1.1;
			}
			
			if (climbable && (Key.isDown(Key.ARROW_UP) || Key.isDown(Key.ARROW_DOWN)))
			{
				collider.x = (climbable.collider.left + (climbable.collider.width/2)) - collider.width/2;
				mode = MODE_CLIMBING;
				return;
			}
			if(!Key.isDown(Key.ARROW_LEFT) && !Key.isDown(Key.ARROW_RIGHT))
				runSpd *= 0.9;
				
			collider.x += runSpd;
			
			if (jumpSpd == 0) jumpSpd = 1;
			if (!Key.isDown(Key.SPACEBAR) || !pressedJmp)
			{
				pressedJmp = false;
				currentJump = 40;
			}

			if (jumpSpd < 0)
			{
				if(!blockedTop)
					jumpSpd *= 1 - MAX_JUMP_SPEED / currentJump;
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
			if (Key.isDown(Key.ENTER) && !pressedMedication)
			{
				pressedMedication = true;
				if (Game.gameScreen.userInterface.medicinindicator.removeMedication())
					_vitality = MAX_VITALITY;
			}
			if (!Key.isDown(Key.ENTER) && pressedMedication)
				pressedMedication = false;
			
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
			if (Key.isDown(Key.SPACEBAR) && !blockedTop && !pressedJmp)
			{
				collider.y -= 1;
				mode = MODE_AIRBOURNE;
				pressedJmp = true;
				currentJump = MAX_JUMP_HEIGHT * vitalityRatio;
				jumpSpd = -MAX_JUMP_SPEED;
				return;
			}
			else if (!Key.isDown(Key.SPACEBAR))
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
					door.open = true;
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
					//mode = MODE_INDOOR;
					//switchedDoors = true;
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
				o.Interact();
				if (o.active)
				{
					if (o is Finish)
					{
						Game.gameScreen.GameOver(true);
						return;
					}
					
					else if (o.solid)
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
					else if (o is Platform)
					{
						var intersect:Rectangle = collider.intersection(o.collider);
						if ( jumpSpd > 0 && collider.bottom > o.collider.top && collider.bottom < o.collider.bottom && !(mode == MODE_CLIMBING))
						{
							blockedBottom = o;
							mode = MODE_GROUNDED;
						}
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
					else if (o is Enemy)
					{
						interactWithEnemy(o as Enemy);
					}
					else if (o is Npc)
					{
						interactWithNpc(o as Npc);
					}
				}
			}
		}
		
		private function interactWithNpc(npc:Npc):void 
		{
			if (npc.GetReferencedItems(false).length > 0)
			{
				for each(var i:Item in npc.GetReferencedItems(false))
				{
					if (Game.gameScreen.userInterface.inventory.containsItem(i))
					{
						Game.gameScreen.userInterface.inventory.useInventoryItem(i);
						npc.Collect(i);
					}
				}
				if (npc.GetReferencedItems(false).length == 0)
				{
					AddPoints(npc.points);
				}
			}
		}
		
		/**
		 * Interact with enemie objects
		 * @param	enemy
		 */
		private function interactWithEnemy(enemy:Enemy):void 
		{
			if (enemy.requiredItem)
			{
				if (Game.gameScreen.userInterface.inventory.containsItem(enemy.requiredItem))
				{
					Game.gameScreen.userInterface.inventory.useInventoryItem(enemy.requiredItem);
					enemy.requiredItem = null;
				}
				else 
				{
					if (mode != MODE_INDOOR && enemy.damage > 0)
					{
						TakeHit(enemy.damage);
						enemy.startAnimation();
						collider.y -= 1;
						
						pressedJmp = true;
						currentJump = MAX_JUMP_HEIGHT * vitalityRatio;
						jumpSpd = MAX_JUMP_SPEED * -1;
						runSpd = runSpd > 0 ? -MAX_RUN_SPEED*2 : MAX_RUN_SPEED*2;
						mode = MODE_AIRBOURNE;
						blockedBottom = null;
						return;
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
			if (door.locked)
			{
				if (door.requiredKey)
				{
					if (Game.gameScreen.userInterface.inventory.containsItem(door.requiredKey))
					{
						Game.gameScreen.userInterface.inventory.useInventoryItem(door.requiredKey);
						door.Unlock(door.requiredKey);
					}
				}
			}
			else if (door.collider.containsPoint(new Point(collider.x + collider.width / 2, collider.y)))
			{
				this.door = door;
			}
		}
		
		/**
		 * Make the character collect an Item
		 * @param	o
		 */
		private function CollectItem(o:Collectable):void 
		{
			if (o is Medication)
			{
				var m:Medication = o as Medication;
				Game.gameScreen.level.RemoveGameObject(o);
				Game.gameScreen.userInterface.medicinindicator.addMedication();
			}
			else if (o is PowerUp)
			{
				var p:PowerUp = o as PowerUp;
				Game.gameScreen.level.RemoveGameObject(o);
				AddPoints(p.points);
				RestoreHealth(p.health);
				
			}
			else if (o is Item)
			{
				var i:Item = o as Item;
				Game.gameScreen.level.RemoveGameObject(o);
				Game.gameScreen.userInterface.inventory.addToInventory(i);
			}
			
		}
		
	}

}