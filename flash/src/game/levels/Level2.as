package game.levels 
{
	import core.asset.Assets;
	import core.gameobject.Climbable;
	import core.gameobject.collectable.Item;
	import core.gameobject.collectable.Key;
	import core.gameobject.collectable.PowerUp;
	import core.gameobject.Door;
	import core.gameobject.Enemy;
	import core.gameobject.Gate;
	import core.gameobject.Npc;
	import core.gameobject.Platform;
	import core.gameobject.Switch;
	import core.gameobject.MovableEnemy;
	import core.level.Level;
	import core.quest.QuestItem;
	import game.objects.characters.Teenager;
	import game.objects.items.powerups.Apple;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author SEG.Veenstra
	 */
	public class Level2 extends Level 
	{
		
		
		public function Level2() 
		{
			super(100, 60);
		}
		
		override protected function Build():void 
		{
			SetBackground(new Image(Assets.GetAtlas('level_1').getTexture('background')));
			SetPlayer(new Teenager('player', 2, 30));
			AddGameObject(new Platform('ground', 0, 90, 125, 5));
			AddGameObject(new Platform('top_border', 0, 0, 125, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 90));
			AddGameObject(new Platform('right_border', 124, 0, 1, 90));
			AddGameObject(new Apple('apple_1', 32, 84));
			AddGameObject(new Apple('apple_2', 50, 78));
			AddGameObject(new Apple('apple_3', 64, 84));
			AddGameObject(new Apple('apple_4', 94, 81));
			
			AddGameObject(new Platform('platform_1', 15, 73, 100, 1));
			AddGameObject(new Platform('platform_fountain_1', 46, 71, 8, 1));
			AddGameObject(new Platform('platform_fountain_2', 47.5, 69, 5, 1));
			AddGameObject(new Platform('platform_fountain_3', 49, 67, 2, 1));
			AddGameObject(new Apple('apple_5', 29, 64));
			AddGameObject(new Apple('apple_6', 63, 67));
			AddGameObject(new Apple('marble_1', 43, 58));
			AddGameObject(new Apple('marble_2', 40, 58));
			AddGameObject(new Apple('marble_3', 37, 58));
			AddGameObject(new Apple('marble_4', 63, 58));
			AddGameObject(new Apple('apple_7', 81, 67));
			AddGameObject(new Apple('apple_8', 101, 64));
			
			AddGameObject(new Platform('platform_2', 15, 56, 100, 1));
			AddGameObject(new Apple('apple_9', 29, 53));
			AddGameObject(new Apple('apple_10', 44, 47));
			AddGameObject(new Apple('apple_11', 76, 44));
			AddGameObject(new Apple('apple_12', 90, 50));
			
			AddGameObject(new Platform('platform_3', 15, 39, 100, 1));
			AddGameObject(new Platform('platform_discount', 37, 29, 10, 4));
			AddGameObject(new Platform('platform_NEW', 28, 33, 3, 3));
			AddGameObject(new Apple('apple_13', 51, 30));
			AddGameObject(new Apple('apple_14', 38, 33));
			AddGameObject(new Apple('apple_15', 73, 36));
			AddGameObject(new Apple('apple_16', 88, 30));
			AddGameObject(new Apple('apple_17', 100, 33));
			
			AddGameObject(new Platform('platform_4', 15, 22, 100, 1));
			AddGameObject(new Platform('SUPER', 39, 18, 20, 3));
			AddGameObject(new Platform('MARKET', 71, 18, 20, 3));
			
			AddGameObject(new Platform('platform_5', 15, 16, 100, 1));
			AddGameObject(new Apple('apple_18', 100, 33));
			
			
			var item1:Item = new Item('item_1', 109, 76);
			var item2:Item = new Item('item_2', 40, 25);
			var item3:Item = new Item('item_3', 15, 12);
			var item4:Item = new Item('item_4', 63, 12);
			AddGameObject(item1);
			AddGameObject(item2);
			AddGameObject(item3);
			AddGameObject(item4);
			
			var npc1:Npc = new Npc('npc_1', 68, 85, 3, 5, 100000);
			AddGameObject(npc1);
			npc1.AddQuestItem(new QuestItem(item1,new Image(Assets.GetCollectableTexture('bone'))));
			npc1.AddQuestItem(new QuestItem(item2, new Image(Assets.GetCollectableTexture('key'))));
			
			var npc2:Npc = new Npc('npc_2', 102, 50, 3, 6, 100000);
			AddGameObject(npc2);
			npc2.AddQuestItem(new QuestItem(item3,new Image(Assets.GetCollectableTexture('kite'))));
			
			var npc3:Npc = new Npc('npc_3', 112, 33, 3, 6, 100000);
			AddGameObject(npc3);
			npc3.AddQuestItem(new QuestItem(item4,new Image(Assets.GetCollectableTexture('key'))));
			
			AddGameObject(new PowerUp('powerup_1', 1, 87, 250, 20));
			
			AddGameObject(new MovableEnemy('enemy_1', 27, 87, 4, 3, 0, 0, 37, 2));
			(GetGameObjectByID('enemy_1') as Enemy).requiredItem = item1;
			AddGameObject(new Enemy('enemy_2', 75, 87, 4, 3, 0, 0));
			(GetGameObjectByID('enemy_2') as Enemy).requiredItem = item2;
			AddGameObject(new Enemy('enemy_3', 87, 68, 12, 5, 0, 0));
			(GetGameObjectByID('enemy_3') as Enemy).requiredItem = item2;
			AddGameObject(new Enemy('enemy_4', 44, 50, 3, 6, 0, 0));
			(GetGameObjectByID('enemy_4') as Enemy).requiredItem = item2;
			
			AddGameObject(new Climbable('ladder_1', 115, 16, 3, 74));
			
			AddGameObject(new Door('door_1', 19, 83));
			AddGameObject(new Door('door_2', 19, 66));
			AddGameObject(new Door('door_3', 19, 49));
			AddGameObject(new Door('door_4', 63, 49));
			AddGameObject(new Door('door_5', 63, 32));
			(GetGameObjectByID('door_1') as Door).SetExits(null, null, GetGameObjectByID('door_2') as Door, null);
			(GetGameObjectByID('door_2') as Door).SetExits(null, null, GetGameObjectByID('door_3') as Door, GetGameObjectByID('door_1') as Door);
			(GetGameObjectByID('door_3') as Door).SetExits(null, null, null, GetGameObjectByID('door_2') as Door);
			(GetGameObjectByID('door_4') as Door).SetExits(null, null, GetGameObjectByID('door_5') as Door, null);
			(GetGameObjectByID('door_5') as Door).SetExits(null, null, null, GetGameObjectByID('door_4') as Door);
			
			// GATE & SWITCH TESTING! (Stephan)
			AddGameObject(new Gate('gate', 100, 83, 1, 7,new Image(Assets.GetAtlas('level_1').getTexture('door_b1_open')),new Image(Assets.GetAtlas('level_1').getTexture('door_b1_closed'))));
			AddGameObject(new Switch('switch', 95, 80,new Image(Assets.GetCollectableTexture('green_apple')),new Image(Assets.GetCollectableTexture('red_apple'))));
			(GetGameObjectByID('switch') as Switch).target = GetGameObjectByID('gate') as Gate;
			(GetGameObjectByID('switch') as Switch).keyID = 'gate_key';
			AddGameObject(new Key('gate_key', 90, 78,new Image(Assets.GetCollectableTexture('key'))));
		}
		
	}

}