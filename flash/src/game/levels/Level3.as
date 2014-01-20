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
	import core.ui.uiobjects.Vitalitybar;
	import core.visualobject.VisualObject;
	import game.comics.ComicOutro3;
	import game.objects.characters.Adult;
	import game.objects.characters.Teenager;
	import game.objects.level3.BusDriverNPC;
	import starling.display.Image;
	import starling.display.MovieClip;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Level3 extends Level 
	{
		
		public function Level3() 
		{
			super(0, 0);
			SetEndingComic(ComicOutro3);
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
			
			
			SetBackground(new Image(Assets.GetAtlas('level_1').getTexture('background')));
			
			// Building platforms
			AddGameObject(new Platform('building_f1', 10, 45, 40, 1));
			AddGameObject(new Platform('building_f2', 10, 35, 40, 1));
			AddGameObject(new Platform('building_f3', 10, 25, 40, 1));
			AddGameObject(new Platform('building_f4', 10, 15, 40, 1));
			AddGameObject(new Platform('building_f5', 10, 5, 40, 1));
			
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'cat_walk')), 10, 45);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'cat_walk')), 10, 35);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'cat_walk')), 10, 25);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'cat_walk')), 10, 15);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'cat_walk')), 10, 5);
			
			// Visuals behind Player
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'wall')), 10, 46);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'wall')), 10, 36);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'wall')), 10, 26);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'wall')), 10, 16);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'wall')), 10, 6);
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'tree')), 90, 2);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'grass_hill')), 70, 40);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'bus')), 38, 43);
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'park_sign_back')), 87, 29);
			
			
			
			
			
			
			AddGameObject(delivery1);
			AddGameObject(delivery2);
			AddGameObject(delivery3);
			
			// Borders
			AddGameObject(new Platform('ground', 0, 55, 150, 5));
			AddGameObject(new Platform('top_border', 0, 0, 150, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 60));
			AddGameObject(new Platform('right_border', 149, 0, 1, 60));
			
			
			
			// Building doors
			var door1:Door = new Door('door_1', 23, 48);
			door1.openImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_open'));
			door1.closedImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_closed'));
			var door2:Door = new Door('door_2', 23, 38);
			door2.openImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_open'));
			door2.closedImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_closed'));
			var door3:Door = new Door('door_3', 23, 28);
			door3.openImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_open'));
			door3.closedImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_closed'));
			var door4:Door = new Door('door_4', 23, 18);
			door4.openImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_open'));
			door4.closedImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_closed'));
			var door5:Door = new Door('door_5', 23, 8);
			door5.openImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_open'));
			door5.closedImage = new Image(Assets.GetTextureFromAtlas('level_3', 'door_closed'));
			
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
			
			SetPlayer(new Adult('player', 2, 47, true));
			
			// Visuals infront of the player
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'park_sign_front')), 86, 25);
			
			// park
			// stairs
			AddGameObject(new Platform('stair_1', 77, 51, 12, 1, true));
			AddGameObject(new Platform('stair_2', 80, 48, 12, 1, true));
			AddGameObject(new Platform('stair_3', 83, 45, 12, 1, true));
			AddGameObject(new Platform('stair_4', 86, 42, 12, 1, true));
			AddGameObject(new Platform('park_floor', 84, 40, 65, 1, true));
			
			// tree
			AddGameObject(new Platform('branch_1', 104, 34, 5, 1, true));
			AddGameObject(new Platform('branch_2', 114, 30, 5, 1, true));
			AddGameObject(new Platform('branch_3', 106, 25, 5, 1, true));
			AddGameObject(new Platform('branch_4', 111, 20, 5, 1, true));
			AddGameObject(new Platform('branch_5', 100, 18, 5, 1));
			
			// bus
			
			// Birdsnest
			var nest:Enemy = new Enemy('nest', 100, 11, 5, 7, 5, 200);
			nest.SetAnimations(new MovieClip(Assets.GetAtlas('enemy').getTextures('bird-nest-idle-'), 2),
				new MovieClip(Assets.GetAtlas('enemy').getTextures('bird-nest-hit-'), 6),
				new MovieClip(Assets.GetAtlas('enemy').getTextures('bird-nest-friendly-'), 2));
			nest.requiredItem = birdSeed;
			nest.rewardItem = busKeys;
			AddGameObject(nest);
			
			AddGameObject(new Medication('med_1', 100, 50));
			
			// NPC
			var client1:Npc = new Npc('client_1', 14, 29, 3, 6, 100);
			client1.AddQuestItem(new QuestItem(delivery1, new Image(Assets.GetCollectableTexture('green_apple'))));
			client1.SetAnimations(new MovieClip(Assets.GetAtlas('npc').getTextures('client1_idle_'), 2), new MovieClip(Assets.GetAtlas('npc').getTextures('client1_finished_'), 2));
			var client2:Npc = new Npc('client_2', 34, 19, 3, 6, 100);
			client2.AddQuestItem(new QuestItem(delivery2, new Image(Assets.GetCollectableTexture('green_apple'))));
			client2.SetAnimations(new MovieClip(Assets.GetAtlas('npc').getTextures('client1_idle_'), 2), new MovieClip(Assets.GetAtlas('npc').getTextures('client1_finished_'), 2));
			var client3:Npc = new Npc('client_3', 44, 9, 3, 6, 0, money);
			client3.AddQuestItem(new QuestItem(delivery3, new Image(Assets.GetCollectableTexture('green_apple'))));
			client3.SetAnimations(new MovieClip(Assets.GetAtlas('npc').getTextures('client1_idle_'), 2), new MovieClip(Assets.GetAtlas('npc').getTextures('client1_finished_'), 2));
			
			var birdFeeder:Npc = new Npc('bird_feeder', 127, 34, 3, 6, 150, birdSeed);
			birdFeeder.AddQuestItem(new QuestItem(money, new Image(Assets.GetCollectableTexture('banana'))));
			birdFeeder.SetAnimations(new MovieClip(Assets.GetAtlas('npc').getTextures('client1_idle_'), 2), new MovieClip(Assets.GetAtlas('npc').getTextures('client1_finished_'), 2));
			
			var busDriver:BusDriverNPC = new BusDriverNPC('bus_driver', 46, 49, 1000);
			busDriver.AddQuestItem(new QuestItem(busKeys, new Image(Assets.GetCollectableTexture('kite'))));
			busDriver.SetAnimations(new MovieClip(Assets.GetAtlas('npc').getTextures('client1_idle_'), 2), new MovieClip(Assets.GetAtlas('npc').getTextures('client1_finished_'), 2));
			
			AddGameObject(client1);
			AddGameObject(client2);
			AddGameObject(client3);
			AddGameObject(birdFeeder);
			AddGameObject(busDriver);
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'ground')), 0, 55);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_3', 'ground')), 75, 55);
			
			debug = false;
		}
	}

}