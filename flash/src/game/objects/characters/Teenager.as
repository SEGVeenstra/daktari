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
		
		private var lastX:Number;
		
		public function Teenager(id:String,x:Number,y:Number) 
		{
			super(id, x, y);
			aniIdle = new MovieClip(Assets.GetAtlas('teenager').getTextures('idle_'),2);
			aniWalk = new MovieClip(Assets.GetAtlas('teenager').getTextures('walk_'),8);
			addChild(aniIdle);
			addChild(aniWalk);
			Starling.juggler.add(aniIdle);
			Starling.juggler.add(aniWalk);
			
			aniIdle.visible = true;
			aniWalk.visible = false;
			lastX = x;
		}
		
		override protected function OnEnterFrame(e:EnterFrameEvent):void 
		{
			lastX = x;
			super.OnEnterFrame(e);
			if (!paused)
			{
				if (lastX == x)
				{
					aniIdle.visible = true;
					aniWalk.visible = false;
				}
				else if (lastX < x)
				{
					trace('walk');
					aniIdle.visible = false;
					aniWalk.visible = true;
					aniIdle.scaleX = 1;
					aniWalk.scaleX = 1;
					aniWalk.x = 0;
					aniIdle.x = 0;
				}
				else if (lastX > x)
				{
					aniIdle.visible = false;
					aniWalk.visible = true;
					aniWalk.scaleX = -1;
					aniIdle.scaleX = -1;
					aniWalk.x = aniWalk.width;
					aniIdle.x = aniIdle.width;
				}
			}
			
		}
		
	}

}