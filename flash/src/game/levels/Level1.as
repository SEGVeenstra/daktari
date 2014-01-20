package game.levels 
{
	import core.asset.Assets;
	import core.gameobject.Character;
	import core.gameobject.Climbable;
	import core.gameobject.collectable.Collectable;
	import core.gameobject.collectable.Item;
	import core.gameobject.collectable.Key;
	import core.gameobject.GameObject;
	import core.gameobject.Gate;
	import core.gameobject.Obstacle;
	import core.gameobject.Switch;
	import core.gameobject.TutorialObject;
	import core.quest.QuestItem;
	import core.visualobject.VisualObject;
	import game.comics.ComicOutro1;
	import game.objects.*;
	import core.gameobject.collectable.PowerUp;
	import core.gameobject.Door;
	import core.gameobject.Enemy;
	import core.gameobject.Finish;
	import core.gameobject.Npc;
	import core.gameobject.Platform;
	import core.level.Level;
	import game.objects.characters.Teenager;
	import game.objects.items.powerups.Apple;
	import game.objects.level1.BlueDoor;
	import game.objects.level1.Bone;
	import game.objects.level1.Dog;
	import game.objects.level1.Ground;
	import game.objects.level1.KeyBuilding2;
	import game.objects.level1.Kite;
	import game.objects.level1.Ladder;
	import game.objects.level1.PlatformBuilding1;
	import game.objects.level1.tutorial.TutorialClimb;
	import game.objects.level1.tutorial.TutorialDoor;
	import game.objects.level1.tutorial.TutorialDoorExit;
	import game.objects.level1.tutorial.TutorialDoorLocked;
	import game.objects.level1.tutorial.TutorialEnemy;
	import game.objects.level1.tutorial.TutorialJump;
	import game.objects.level1.tutorial.TutorialMove;
	import game.objects.level1.tutorial.TutorialNPC;
	import game.objects.level1.visual.Railing;
	import game.objects.level1.WallBuilding1;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Level1 extends Level 
	{
		
		//Character
		private var character:Character = new Teenager('player', 1, 48);
		//Grounds
		private var ground:Ground = new Ground('ground', 0, 55);
		//Bounds
		private var barierLeft:Platform = new Platform('barrier_left', 0, 0, 1, 60 );
		private var barierRight:Platform = new Platform('barrier_right',   100 - 1, 0, 1, 60 );
		private var barierTop:Platform = new Platform('barrier_top', 0, 0,   100, 1);
		// Building 1
			// Platforms
		private var building1Roof:Platform = new PlatformBuilding1('building1_roof',   8, 25);
		private var building1Floor2:Platform = new PlatformBuilding1('building1_floor2',   8, 35);
		private var building1Floor1:Platform = new PlatformBuilding1('building1_floor1',   8, 45 );
			// Doors
		private var building1Door1:BlueDoor = new BlueDoor('building1_door1',   12 ,  48);
		private var building1Door2:BlueDoor = new BlueDoor('building1_door2(LOCKED)',   12 ,  38, true);
		private var building1Door3:BlueDoor = new BlueDoor('building1_door3',   12 ,   28);
			// Climbables
		private var building1Ladder1:Climbable = new Ladder('building1_ladder1',   29,   35);
		
		// Building 2
			// Platforms
		private var building2Roof:Platform = new Platform('building2_roof',   40, 15 , 26 , 1);
		private var building2Floor3:Platform = new Platform('building2_floor3',   40, 25 , 26 , 1);
		private var building2Floor2:Platform = new Platform('building2_floor2',   40, 35 , 26 , 1);
		private var building2Floor1:Platform = new Platform('building2_floor1',   40, 45 , 26 , 1);
			// Doors
		private var building2Door1:Door = new Door('building2_door1(LOCKED)',   51 ,  48, true);
		private var building2Door2:Door = new Door('building2_door2',   51 ,  8);
		
		// Items
		private var key:KeyBuilding2 =  new KeyBuilding2('key1', 16, 40);
		private var bone:Bone = new Bone('bone', 16, 20);
		private var kite:Kite = new Kite('kite', 61, 20);
		private var testPowerUp1:PowerUp =  new Apple('fruit1', 41, 20);
		private var testPowerUp2:PowerUp =  new Apple('fruit2', 46, 20);
		private var testPowerUp3:PowerUp =  new Apple('fruit3', 51, 20);
		private var testPowerUp4:PowerUp =  new Apple('fruit4', 56, 20);
		
		
		// Finish
		private var finish:Finish = new Finish('finish', 95, 54, 5, 1);
		
		// Enemies
		private var dog:Enemy = new Dog('dog', 91, 51, 4, 4, 20, 100);
		
		// NPCs
		private var girl:Npc = new Npc('girl', 37, 51, 3, 4, 1000);
		
		// Visuals
		private var wall1Building1:VisualObject = new WallBuilding1();
		private var wall2Building1:VisualObject = new WallBuilding1();
		private var wall3Building1:VisualObject = new WallBuilding1();
		
		// Tutorial
		private var tutorialMove:TutorialMove = new TutorialMove('tutorial_move', 1, 54);
		private var tutorialDoorUse:TutorialDoor = new TutorialDoor('tutorial_door', 12, 54);
		private var tutorialDoorLocked:TutorialDoorLocked = new TutorialDoorLocked('tutorial_door_locked', 12, 44);
		private var tutorialDoorExit:TutorialDoorExit = new TutorialDoorExit('tutorial_door_exit', 12, 34);
		private var tutorialJump:TutorialJump = new TutorialJump('tutorial_jump', 17, 34);
		private var tutorialClimb:TutorialClimb = new TutorialClimb('tutorial_climb', 28, 34);
		private var tutorialNPC:TutorialNPC = new TutorialNPC('tutorial_npc',33, 54);
		private var tutorialEnemy:TutorialEnemy = new TutorialEnemy('tutorial_enemy',86, 54);
		
		public function Level1() 
		{
			super(100,60);
			trace('Level 1 geladen');
			SetEndingComic(ComicOutro1);
		}
		
		/**
		 * Build the level
		 */
		override protected function Build():void
		{
			SetBackground(new Image(Assets.GetAtlas('level_1').getTexture('background')));
			BuildBackground();
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'wall_b2')),41,46);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'wall_b2')),41,36);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'wall_b2')),41,26);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'wall_b2')),41,16);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'wall_b2_small')), 48, 6);
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'platform_b2')),40,45);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'platform_b2')),40,35);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'platform_b2')),40,25);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'platform_b2')),40,15);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_1', 'platform_b2_small')),48,5);
			
			// Level
			AddGameObject(ground);
			AddGameObject(barierLeft);
			AddGameObject(barierRight);
			AddGameObject(barierTop);
			// Building 1
			
			AddGameObject(building1Door1);
			building1Door1.SetExits(null,null,building1Door3,null);
			AddGameObject(building1Door2);
			AddGameObject(building1Door3);
			building1Door3.SetExits(null, null, null, building1Door1);
			AddGameObject(building1Ladder1);
			
			// Building 2
			AddGameObject(building2Roof);
			AddGameObject(building2Floor3);
			AddGameObject(building2Floor2);
			AddGameObject(building2Floor1);
			AddGameObject(building2Door1);
			AddGameObject(new Platform('platform_b2_top', 48, 5, 10, 1));
			building2Door1.SetExits(null, null, building2Door2, null);
			building2Door1.openImage = new Image(Assets.GetTextureFromAtlas('level_1', 'door_b2_open'));
			building2Door1.closedImage = new Image(Assets.GetTextureFromAtlas('level_1', 'door_b2_closed'));
			building2Door1.requiredKey = key;
			AddGameObject(building2Door2);
			building2Door2.openImage = new Image(Assets.GetTextureFromAtlas('level_1', 'door_b2_open'));
			building2Door2.closedImage = new Image(Assets.GetTextureFromAtlas('level_1', 'door_b2_closed'));
			building2Door2.SetExits(null, null, null, building2Door1);

			
			AddGameObject(key);
			AddGameObject(bone);
			AddGameObject(testPowerUp1);
			AddGameObject(testPowerUp2);
			AddGameObject(testPowerUp3);
			AddGameObject(testPowerUp4);
			AddGameObject(new Apple('apple_1', 41, 30));
			AddGameObject(new Apple('apple_2', 46, 30));
			AddGameObject(new Apple('apple_3', 51, 30));
			AddGameObject(new Apple('apple_4', 56, 30));
			AddGameObject(new Apple('apple_5', 61, 30));
			
			AddGameObject(new Apple('apple_6', 41, 10));
			AddGameObject(new Apple('apple_7', 36, 5));
			AddGameObject(new Apple('apple_8', 31, 10));
			AddGameObject(new Apple('apple_9', 28, 15));
			AddGameObject(new Apple('apple_10', 26, 20));
			
			AddGameObject(finish);
			
			AddGameObject(dog);
			dog.requiredItem = bone;
			
			AddGameObject(girl);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('npc', 'girl')),37,51);
			girl.AddQuestItem(new QuestItem(kite, new Image(Assets.GetCollectableTexture('kite'))));

			AddGameObject(kite);
			
			SetPlayer(character);
			
			AddVisualObject(new VisualObject(Assets.GetAtlas('level_1').getTexture('railing')),9,31);
			AddVisualObject(new VisualObject(Assets.GetAtlas('level_1').getTexture('railing')),13,31);
			AddVisualObject(new VisualObject(Assets.GetAtlas('level_1').getTexture('railing')),17,31);
			AddVisualObject(new VisualObject(Assets.GetAtlas('level_1').getTexture('railing')),21,31);
			AddVisualObject(new VisualObject(Assets.GetAtlas('level_1').getTexture('railing')),25,31);
			AddVisualObject(new VisualObject(Assets.GetAtlas('level_1').getTexture('railing')),29,31);
			
			AddGameObject(building1Roof);
			AddGameObject(building1Floor2);
			AddGameObject(building1Floor1);
			
			AddGameObject(tutorialMove);
			AddGameObject(tutorialDoorUse);
			AddGameObject(tutorialDoorExit);
			AddGameObject(tutorialJump);
			AddGameObject(tutorialClimb);
			AddGameObject(tutorialDoorLocked);
			AddGameObject(tutorialNPC);
			AddGameObject(tutorialEnemy);
			
			debug = false;
		}
		
		/**
		 * Build the background from the level
		 */
		private function BuildBackground():void 
		{
			AddVisualObject(wall1Building1 , 9,46);
			AddVisualObject(wall2Building1 , 9,36);
			AddVisualObject(wall3Building1 , 9,26);
		}
		
		/**
		 * Build the foreground of the level
		 */
		private function BuildForeground():void
		{
			
		}
	}

}