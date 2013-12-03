package game.levels 
{
	import core.gameobject.Character;
	import core.gameobject.Climbable;
	import core.gameobject.Collectable;
	import core.gameobject.Platform;
	import core.level.Level;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Level1 extends Level 
	{
		
		public function Level1() 
		{
			super();
			trace('Testlevel geladen');
		}
		
		/**
		 * Build the level
		 */
		override protected function Build():void
		{
			AddGameObject(new Platform('barrier_left', 0, 0, 1, 600));
			AddGameObject(new Platform('barrier_right', 800 - 1, 0, 1, 600));
			AddGameObject(new Platform('barrier_top', 0, 0, 800, 1));
			AddGameObject(new Platform("ground", 0, 550, 800, 50));
			AddGameObject(new Platform("platform1", 150, 400, 300, 16));
			AddGameObject(new Platform("platform2", 500, 500, 300, 16));
			AddGameObject(new Climbable("ladder1", 250, 400, 16, 150));
			AddGameObject(new Climbable("ladder2", 400, 200, 16, 200));
			AddGameObject(new Platform('testplatform', 150, 200, 500, 16));
			SetPlayer(new Character('player', 10, 10));
			AddGameObject(new Collectable('item1', 200, 100));
		}
	}

}