package game.objects.characters 
{
	import core.asset.Assets;
	import core.gameobject.Character;
	import core.key.Key;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.EnterFrameEvent;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Teenager extends Character 
	{
		private var aniWalk:MovieClip;
		private var aniIdle:MovieClip;
		private var aniDoor:MovieClip;
		private var aniJump:MovieClip;
		private var aniClimb:MovieClip;
		
		private var lastX:Number;
		private var lastY:Number;
		
		private var _currentAnimation:MovieClip;
		
		public function Teenager(id:String,x:Number,y:Number,isSick:Boolean = false) 
		{
			super(id, x, y,isSick);
			aniIdle = new MovieClip(Assets.GetAtlas('teenager').getTextures('idle_'),2);
			aniWalk = new MovieClip(Assets.GetAtlas('teenager').getTextures('walk_'),8);
			aniDoor = new MovieClip(Assets.GetAtlas('teenager').getTextures('door_'),8);
			aniJump = new MovieClip(Assets.GetAtlas('teenager').getTextures('jump_'),8);
			aniClimb = new MovieClip(Assets.GetAtlas('teenager').getTextures('climb_'),8);
			addChild(aniIdle);
			addChild(aniWalk);
			addChild(aniDoor);
			addChild(aniJump);
			addChild(aniClimb);
			Starling.juggler.add(aniIdle);
			Starling.juggler.add(aniWalk);
			Starling.juggler.add(aniDoor);
			Starling.juggler.add(aniJump);
			Starling.juggler.add(aniClimb);
			
			aniIdle.visible = false;
			aniWalk.visible = false;
			aniDoor.visible = false;
			aniJump.visible = false;
			aniClimb.visible = false;
			
			SetAnimation(aniIdle);
		}
		
		public function SetAnimation(animation:MovieClip, flip:Boolean = false):void
		{
			if (!_currentAnimation)
			{
				_currentAnimation = animation;
				_currentAnimation.visible = true;
			}
			else 
			{
				_currentAnimation.visible = false;
				_currentAnimation = animation;
				_currentAnimation.visible = true;
			}
			if (flip && animation.scaleX == 1)
			{
				animation.scaleX = -1;
				animation.x = animation.width;
			}
			else if (!flip && animation.scaleX == -1)
			{
				animation.scaleX = 1;
				animation.x = 0;
			}
			
		}
		
		override protected function OnEnterFrame(e:EnterFrameEvent):void 
		{
			lastX = x;
			lastY = y;
			super.OnEnterFrame(e);
			if (!paused)
			{
				switch (mode)
				{
					case MODE_GROUNDED:
						animateGround();
						break;
					case MODE_INDOOR:
						animateDoor();
						break;
					case MODE_AIRBOURNE:
						animateJump();
						break;
					case MODE_CLIMBING:
						animateClimb();
						break;
				}
				
			}
			
		}
		
		private function animateClimb():void 
		{
			SetAnimation(aniClimb, _currentAnimation.scaleX == 1 ? false :true);
			if (lastY != y)
				aniClimb.play();
			else
				aniClimb.stop();
		}
		
		private function animateJump():void 
		{
			if (lastX < x)
				SetAnimation(aniJump);
			else if (lastX == 0)
				SetAnimation(aniJump, _currentAnimation.scaleX == 1 ? false :true);
			else if(lastX > x)
				SetAnimation(aniJump, true);
		}
		
		private function animateDoor():void 
		{
			SetAnimation(aniDoor, _currentAnimation.scaleX == 1 ? false :true);
		}
		
		private function animateGround():void 
		{
			aniDoor.visible = false;
			if (lastX == x)
			{
				SetAnimation(aniIdle,_currentAnimation.scaleX == -1 ? true:false);
			}
			else if (lastX < x)
			{
				SetAnimation(aniWalk);
			}
			else if (lastX > x)
			{
				SetAnimation(aniWalk, true);
			}
		}
		
	}

}