package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.Enemy;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.core.Starling;
	
	/**
	 * http://www.youtube.com/watch?v=Qhq4COk_QyU
	 * @author Henderikus
	 */
	public class Dog extends Enemy 
	{
		private var def:MovieClip;
		private var art:MovieClip;
		public function Dog(id:String, x:Number,y:Number, width:Number,height:Number, damage:int, points:int) 
		{
			super(id, x, y, width, height, damage, points);	
			def = new MovieClip(Assets.GetAtlas('dog').getTextures('dog_2'));
			addChild(def);
		}
		
		override public function startAnimation():void {
			removeChild(def);
			art = new MovieClip(Assets.GetAtlas('dog').getTextures('dog_'), 10);
			Starling.juggler.add(art);
			addChild(art);
		}
		
		override public function stopAnimation():void {
			Starling.juggler.remove(art);
			removeChild(art);
			addChild(def);
		}
		
		
	}

}