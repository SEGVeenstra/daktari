package game.levels 
{
	import core.gameobject.Character;
	import core.gameobject.Climbable;
	import core.gameobject.collectable.Collectable;
	import core.gameobject.collectable.Key;
	import core.gameobject.collectable.PowerUp;
	import core.gameobject.Door;
	import core.gameobject.Platform;
	import core.level.Level;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Level1 extends Level 
	{
		//Character
		private var character:Character = new Character('player', 1, 30);
		//Grounds
		private var ground:Platform = new Platform('ground', 0, 55 , 100 , 5 );
		//Bounds
		private var barierLeft:Platform = new Platform('barrier_left', 0, 0, 1, 60 );
		private var barierRight:Platform = new Platform('barrier_right',   100 - 1, 0, 1, 60 );
		private var barierTop:Platform = new Platform('barrier_top', 0, 0,   100, 1);
		// Building 1
			// Platforms
		private var building1Roof:Platform = new Platform('building1_roof',   8, 25 , 26 , 1);
		private var building1Floor2:Platform = new Platform('building1_floor2',   3, 35  , 31 , 1);
		private var building1Floor1:Platform = new Platform('building1_floor1',   8, 45  , 26 , 1);
			// Doors
		private var building1Door1:Door = new Door('building1_door1',   12 ,  48);
		private var building1Door2:Door = new Door('building1_door2',   12 ,  38);
		private var building1Door3:Door = new Door('building1_door3',   12 ,   28);
			// Climbables
		private var building1Ladder1:Climbable = new Climbable('building1_ladder1',   29,   35,   3,   10);
		
		// Building 2
			// Platforms
		private var building2Roof:Platform = new Platform('building2_roof',   40, 15 , 26 , 1);
		private var building2Floor3:Platform = new Platform('building2_floor3',   40, 25 , 26 , 1);
		private var building2Floor2:Platform = new Platform('building2_floor2',   40, 35 , 26 , 1);
		private var building2Floor1:Platform = new Platform('building2_floor1',   40, 45 , 26 , 1);
			// Doors
		private var building2Door1:Door = new Door('building2_door1',   51 ,  48);
		private var building2Door2:Door = new Door('building2_door2',   51 ,  8);
		
		// Items
		private var testItem:Key =  new Key('key1', 16, 20);
		private var testPowerUp:PowerUp =  new PowerUp('fruit', 21, 20, 100, 5);
		
		public function Level1() 
		{
			super();
			trace('Level 1 geladen');
		}
		
		/**
		 * Build the level
		 */
		override protected function Build():void
		{
			SetPlayer(character);
			// Level
			AddGameObject(ground);
			AddGameObject(barierLeft);
			AddGameObject(barierRight);
			AddGameObject(barierTop);
			// Building 1
			AddGameObject(building1Roof);
			AddGameObject(building1Floor2);
			AddGameObject(building1Floor1);
			AddGameObject(building1Door1);
			building1Door1.SetExits(null,null,building1Door3,null);
			AddGameObject(building1Door2);
			building1Door2.active = false;
			AddGameObject(building1Door3);
			building1Door3.SetExits(null, null, null, building1Door1);
			AddGameObject(building1Ladder1);
			
			// Building 2
			AddGameObject(building2Roof);
			AddGameObject(building2Floor3);
			AddGameObject(building2Floor2);
			AddGameObject(building2Floor1);
			AddGameObject(building2Door1);
			building2Door1.SetExits(null, null, building2Door2, null);
			AddGameObject(building2Door2);
			building2Door2.SetExits(null, null, null, building2Door1);

			
			AddGameObject(testItem);
			AddGameObject(testPowerUp);
		}
	}

}