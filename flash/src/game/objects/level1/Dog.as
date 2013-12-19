package game.objects.level1 
{
	import core.asset.Assets;
	import core.gameobject.Enemy;
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.core.Starling;
	
	/**
	 * http://www.youtube.com/watch?v=Qhq4COk_QyU
	 * @author Henderikus
	 */
	public class Dog extends Enemy 
	{
		private var art:MovieClip;
		public function Dog(id:String, x:Number,y:Number, width:Number,height:Number, damage:int, points:int) 
		{
			super(id, x, y, width, height, damage, points);	
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);	
			createDogArt();
		}
		
		private function createDogArt():void {
			art = new MovieClip(Assets.GetAtlas('dog').getTextures('dog_'), 10);
			starling.core.Starling.juggler.add(art);
			addChild(art);
		}
		
	}

}