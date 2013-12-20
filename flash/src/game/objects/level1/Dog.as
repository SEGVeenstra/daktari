package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.Enemy;
	import starling.animation.DelayedCall;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.core.Starling;
	
	/**
	 * 
	 * @author Henderikus
	 */
	public class Dog extends Enemy 
	{
		private var aniIdle:MovieClip;
		private var ani:MovieClip;
		private var timer:DelayedCall;
		
		public function Dog(id:String, x:Number,y:Number, width:Number,height:Number, damage:int, points:int) 
		{
			super(id, x, y, width, height, damage, points);	
			aniIdle = new MovieClip(Assets.GetAtlas('dog').getTextures('dog_2'));
			ani = new MovieClip(Assets.GetAtlas('dog').getTextures('dog_'), 10);
			addChild(aniIdle);
			addChild(ani);
			Starling.juggler.add(aniIdle);
			Starling.juggler.add(ani);
			 
			aniIdle.visible = true;
			ani.visible = false;
		
		}
		
		override public function startAnimation():void {
			timer = new DelayedCall(stopAnimation, 1.0);
			aniIdle.visible = false;
			ani.visible = true;
			Starling.juggler.add(timer);
		}
		
		private function stopAnimation():void {
			ani.visible = false;
			aniIdle.visible = true;
			Starling.juggler.remove(timer);
		}
		
	}

}