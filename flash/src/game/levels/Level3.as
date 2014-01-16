package game.levels 
{
	import core.asset.Assets;
	import core.gameobject.Climbable;
	import core.gameobject.collectable.Item;
	import core.gameobject.collectable.Medication;
	import core.gameobject.Door;
	import core.gameobject.Enemy;
	import core.gameobject.Finish;
	import core.gameobject.Npc;
	import core.gameobject.Platform;
	import core.level.Level;
	import core.quest.QuestItem;
	import game.objects.characters.Teenager;
	import game.objects.level3.BusDriverNPC;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Level3 extends Level 
	{
		
		public function Level3() 
		{
			super(0, 0);
		}
		
		override protected function Build():void 
		{
			Game.gameScreen.userInterface.activateDisease(true);
			
			// items
			var money:Item = new Item('money', 0, 0, new Image(Assets.GetCollectableTexture('banana')));
			var birdSeed:Item = new Item('bird_seed', 100, 20, new Image(Assets.GetCollectableTexture('bone')));
			
			var delivery1:Item = new Item('delivery_1', 2, 47, new Image(Assets.GetCollectableTexture('green_apple')));
			var delivery2:Item = new Item('delivery_2', 2, 47, new Image(Assets.GetCollectableTexture('green_apple')));
			var delivery3:Item = new Item('delivery_3', 2, 47, new Image(Assets.GetCollectableTexture('green_apple')));
			
			var busKeys:Item = new Item('bus_keys', 0, 0,new Image(Assets.GetCollectableTexture('kite')));
			
			// Borders
			SetBackground(new Image(Assets.GetAtlas('level_1').getTexture('background')));
			SetPlayer(new Teenager('player', 2, 47, true));
			
			AddGameObject(delivery1);
			AddGameObject(delivery2);
			AddGameObject(delivery3);
			
			AddGameObject(new Platform('ground', 0, 55, 150, 5));
			AddGameObject(new Platform('top_border', 0, 0, 150, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 60));
			AddGameObject(new Platform('right_border', 149, 0, 1, 60));
			
			// Building platforms
			AddGameObject(new Platform('building_f1', 10, 45, 40, 1));
			AddGameObject(new Platform('building_f2', 10, 35, 40, 1));
			AddGameObject(new Platform('building_f3', 10, 25, 40, 1));
			AddGameObject(new Platform('building_f4', 10, 15, 40, 1));
			AddGameObject(new Platform('building_f5', 10, 5, 40, 1));
			
			// Building doors
			var door1:Door = new Door('door_1', 23, 48);
			var door2:Door = new Door('door_2', 23, 38);
			var door3:Door = new Door('door_3', 23, 28);
			var door4:Door = new Door('door_4', 23, 18);
			var door5:Door = new Door('door_5', 23, 8);
			
			door1.SetExits(null, null, door2, null);
			door2.SetExits(null, null, door3, door1);
			door3.SetExits(null, null, door4, door2);
			door4.SetExits(null, null, door5, door3);
			door5.SetExits(null, null, null, door4);
			
			AddGameObject(door1);
			AddGameObject(door2);
			AddGameObject(door3);
			AddGameObject(door4);
			AddGameObject(door5);
			
			// park
			// stairs
			AddGameObject(new Platform('stair_1', 75, 51, 10, 1, true));
			AddGameObject(new Platform('stair_2', 78, 48, 10, 1, true));
			AddGameObject(new Platform('stair_3', 81, 45, 10, 1, true));
			AddGameObject(new Platform('stair_4', 84, 42, 10, 1, true));
			AddGameObject(new Platform('park_floor', 74, 39, 75, 1, true));
			
			// tree
			AddGameObject(new Platform('branch_1', 105, 34, 5, 1, true));
			AddGameObject(new Platform('branch_2', 114, 30, 5, 1, true));
			AddGameObject(new Platform('branch_3', 107, 25, 5, 1, true));
			AddGameObject(new Platform('branch_4', 112, 20, 5, 1, true));
			AddGameObject(new Platform('branch_5', 100, 19, 5, 1));
			
			// bus
			
			// Birdsnest
			var nest:Enemy = new Enemy('nest', 100, 13, 5, 6, 0, 200);
			nest.requiredItem = birdSeed;
			nest.rewardItem = busKeys;
			AddGameObject(nest);
			
			AddGameObject(new Medication('med_1', 100, 50));
			
			// NPC
			var client1:Npc = new Npc('client_1', 14, 29, 3, 6, 100);
			client1.AddQuestItem(new QuestItem(delivery1, new Image(Assets.GetCollectableTexture('green_apple'))));
			var client2:Npc = new Npc('client_2', 34, 19, 3, 6, 100);
			client2.AddQuestItem(new QuestItem(delivery2, new Image(Assets.GetCollectableTexture('green_apple'))));
			var client3:Npc = new Npc('client_3', 44, 9, 3, 6, 0, money);
			client3.AddQuestItem(new QuestItem(delivery3, new Image(Assets.GetCollectableTexture('green_apple'))));
						
			var birdFeeder:Npc = new Npc('bird_feeder', 127, 33, 3, 6, 150, birdSeed);
			birdFeeder.AddQuestItem(new QuestItem(money, new Image(Assets.GetCollectableTexture('banana'))));
			
			var busDriver:BusDriverNPC = new BusDriverNPC('bus_driver', 46, 49, 1000);
			busDriver.AddQuestItem(new QuestItem(busKeys, new Image(Assets.GetCollectableTexture('kite'))));
			
			AddGameObject(client1);
			AddGameObject(client2);
			AddGameObject(client3);
			AddGameObject(birdFeeder);
			AddGameObject(busDriver);
			
			AddGameObject(new Finish('finish', 54, 51, 2, 4, false));
			
			debug = true;
		}
	}

}