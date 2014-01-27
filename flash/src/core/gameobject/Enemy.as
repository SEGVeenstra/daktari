package core.gameobject 
{
	import core.gameobject.collectable.Item;
	import core.level.Level;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import starling.animation.DelayedCall;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import flash.utils.*;
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Enemy extends GameObject 
	{
		public var requiredItem:Item;
		public var damage:int;
		public var points:int;
		public var rewardItem:Item;
		
		protected var idleAnimation:MovieClip;
		protected var hitAnimation:MovieClip;
		protected var friendlyAnimation:MovieClip;
		
		public function Enemy(id:String, x:Number,y:Number, width:Number,height:Number, damage:int, points:int) 
		{
			super(id, x, y);
			this.damage = damage;
			this.points = points;
			solid = false;
			width *= Level.GRIDSIZE;
			height *= Level.GRIDSIZE;
			x *= Level.GRIDSIZE;
			y *= Level.GRIDSIZE;
			collider = new Rectangle(x,y, width , height);
			Draw(width, height);
		}
		
		private function Draw(width:Number, height:Number):void
		{
			debugShape = new Shape();
			debugShape.graphics.beginFill(0xFF0000, 0.6);
			debugShape.graphics.drawRect(0, 0, width, height);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
		
		override public function Interact():void 
		{
			if (requiredItem)
			{
				if (Game.gameScreen.userInterface.inventory.containsItem(requiredItem))
				{
					Game.gameScreen.userInterface.inventory.useInventoryItem(requiredItem);
					requiredItem = null;
					Game.soundmanager.playSound("giveitem" , 2);
					damage = 0;
					if (rewardItem) Game.gameScreen.userInterface.inventory.addToInventory(rewardItem);
					if (friendlyAnimation)
					{
						friendlyAnimation.visible = true;
						idleAnimation.visible = false;
					}
				}
			}
			if (damage != 0)
			{
				if (hitAnimation)
				{
					hitAnimation.visible = true;
					idleAnimation.visible = false;
					var myDelay:Timer = new Timer(1000);
					myDelay.addEventListener(TimerEvent.TIMER, StopHit);
					myDelay.start();
				}
			}
		}
		
		private function StopHit(event:TimerEvent):void
		{
			hitAnimation.visible = false;
			if (damage == 0)
				friendlyAnimation.visible = true;
			else
				idleAnimation.visible = true;
		}
		
		public function startAnimation():void {
			
		}
		
		/**
		 * Set the animations for this enemy
		 * @param	idle Is played when nothing special is happening
		 * @param	hit Is playey when the character hits this enemy
		 * @param	friendly Is played when this enemy is no longer mean to the player
		 */
		public function SetAnimations(idle:MovieClip, hit:MovieClip = null, friendly:MovieClip = null):void
		{
			idleAnimation = idle;
			addChild(idle);
			Starling.juggler.add(idle);
			if (damage > 0) idle.visible = true;
			
			if (hit)
			{
				hitAnimation = hit;
				addChild(hit);
				Starling.juggler.add(hit);
				hit.visible = false;
			}
			
			if (friendly)
			{
				friendlyAnimation = friendly;
				addChild(friendly);
				Starling.juggler.add(friendly);
				friendly.visible = damage == 0 ? true: false;
			}
		}
		
	}

}