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
	import core.visualobject.VisualObject;
	
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
			
			// visuals
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'wall')),15,23);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'wall')),15,40);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'wall')),15,57);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'wall')),15,74);
			
			SetPlayer(new Teenager('player', 2, 30));
			
			
			AddGameObject(new Platform('ground', 0, 90, 125, 5));
			AddGameObject(new Platform('border_top', 0, 0, 125, 1));
			AddGameObject(new Platform('border_left', 0, 0, 1, 90));
			AddGameObject(new Platform('border_right', 124, 0, 1, 90));
			AddGameObject(new Platform('wall_left', 14, 16, 1, 67));
			AddGameObject(new Platform('wall_right_1', 115, 74, 1, 9));
			AddGameObject(new Platform('wall_right_2', 115, 57, 1, 9));
			AddGameObject(new Platform('wall_right_3', 115, 40, 1, 9));
			AddGameObject(new Platform('wall_right_4', 115, 17, 1, 15));
			AddGameObject(new Platform('fence', 121, 6, 1, 77));
			
			AddGameObject(new Apple('apple_1', 32, 84));
			AddGameObject(new Apple('apple_2', 50, 78));
			AddGameObject(new Apple('apple_3', 64, 84));
			AddGameObject(new Apple('apple_4', 94, 81));
			AddGameObject(new Apple('marble_5', 117, 80));
			
			AddGameObject(new Platform('platform_1', 15, 73, 106, 1));
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
			AddGameObject(new Apple('marble_6', 117, 63));
			
			AddGameObject(new Platform('platform_2', 15, 56, 106, 1));
			AddGameObject(new Apple('apple_9', 29, 53));
			AddGameObject(new Apple('apple_10', 44, 47));
			AddGameObject(new Apple('apple_11', 76, 44));
			AddGameObject(new Apple('apple_12', 90, 50));
			
			AddGameObject(new Platform('platform_3', 15, 39, 106, 1));
			AddGameObject(new Platform('platform_discount', 37, 29, 10, 4));
			AddGameObject(new Platform('platform_NEW', 28, 30, 3, 3));
			AddGameObject(new Platform('platform_crate', 17, 36, 4, 3));
			AddGameObject(new Apple('apple_13', 51, 30));
			AddGameObject(new Apple('apple_14', 38, 33));
			AddGameObject(new Apple('apple_15', 73, 36));
			AddGameObject(new Apple('apple_16', 88, 30));
			AddGameObject(new Apple('apple_17', 100, 33));
			
			AddGameObject(new Platform('platform_4', 15, 22, 100, 1));
			AddGameObject(new Platform('SUPER', 39, 18, 20, 3));
			AddGameObject(new Platform('MARKET', 71, 18, 20, 3));
			
			AddGameObject(new Platform('platform_5', 15, 16, 106, 1));
			AddGameObject(new Apple('apple_18', 100, 33));
			
			
			var item1:Item = new Item('item_1', 120, 86);
			var item2:Item = new Item('item_2', 4, 25);
			var item3:Item = new Item('item_3', 14, 12);
			var item4:Item = new Item('item_4', 8, 12);
			AddGameObject(item1);
			AddGameObject(item2);
			AddGameObject(item3);
			AddGameObject(item4);
			
			var npc1:Npc = new Npc('npc_1', 68, 85, 3, 5, 100000);
			AddGameObject(npc1);
			npc1.AddQuestItem(new QuestItem(item1,new Image(Assets.GetCollectableTexture('bone'))));
			
			var npc2:Npc = new Npc('npc_2', 102, 50, 3, 6, 100000);
			AddGameObject(npc2);
			npc2.AddQuestItem(new QuestItem(item3,new Image(Assets.GetCollectableTexture('kite'))));
			
			var npc3:Npc = new Npc('npc_3', 108, 33, 3, 6, 100000);
			AddGameObject(npc3);
			npc3.AddQuestItem(new QuestItem(item4,new Image(Assets.GetCollectableTexture('key'))));
			
			AddGameObject(new MovableEnemy('enemy_1', 27, 87, 4, 3, 10, 0, 60, 3));
			//(GetGameObjectByID('enemy_1') as Enemy).requiredItem = item1;
			AddGameObject(new MovableEnemy('enemy_2', 75, 87, 4, 3, 0, 0, 107, 3));
			(GetGameObjectByID('enemy_2') as Enemy).requiredItem = item2;
			AddGameObject(new Enemy('enemy_3', 87, 68, 12, 5, 0, 0));
			(GetGameObjectByID('enemy_3') as Enemy).requiredItem = item2;
			AddGameObject(new MovableEnemy('enemy_4', 44, 50, 3, 6, 0, 0, 86, 2));
			(GetGameObjectByID('enemy_4') as Enemy).requiredItem = item2;
			
			AddGameObject(new Climbable('ladder_1', 117, 16, 3, 74));
			
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
			
			AddGameObject(new Gate('gate_red', 115, 83, 1, 7,new Image(Assets.GetAtlas('level_1').getTexture('door_b1_open')),new Image(Assets.GetAtlas('level_1').getTexture('door_b1_closed'))));
			AddGameObject(new Switch('switch_red_1', 112, 86,new Image(Assets.GetCollectableTexture('green_apple')),new Image(Assets.GetCollectableTexture('red_apple'))));
			(GetGameObjectByID('switch_red_1') as Switch).target = GetGameObjectByID('gate_red') as Gate;
			(GetGameObjectByID('switch_red_1') as Switch).keyID = 'gate_key_red';
			AddGameObject(new Switch('switch_red_2', 117, 86,new Image(Assets.GetCollectableTexture('green_apple')),new Image(Assets.GetCollectableTexture('red_apple'))));
			(GetGameObjectByID('switch_red_2') as Switch).target = GetGameObjectByID('gate_red') as Gate;
			(GetGameObjectByID('switch_red_2') as Switch).keyID = 'gate_key_red';
			AddGameObject(new Key('gate_key_red', 63, 12, new Image(Assets.GetCollectableTexture('key'))));
			
			AddGameObject(new Gate('gate_green', 115, 66, 1, 7, new Image(Assets.GetAtlas('level_1').getTexture('door_b1_open')), new Image(Assets.GetAtlas('level_1').getTexture('door_b1_closed'))));
			AddGameObject(new Switch('switch_green_1', 112, 69,new Image(Assets.GetCollectableTexture('green_apple')),new Image(Assets.GetCollectableTexture('red_apple'))));
			(GetGameObjectByID('switch_green_1') as Switch).target = GetGameObjectByID('gate_green') as Gate;
			(GetGameObjectByID('switch_green_1') as Switch).keyID = 'gate_key_green';
			AddGameObject(new Switch('switch_green_2', 117, 69,new Image(Assets.GetCollectableTexture('green_apple')),new Image(Assets.GetCollectableTexture('red_apple'))));
			(GetGameObjectByID('switch_green_2') as Switch).target = GetGameObjectByID('gate_green') as Gate;
			(GetGameObjectByID('switch_green_2') as Switch).keyID = 'gate_key_green';
			AddGameObject(new Key('gate_key_green', 40, 25, new Image(Assets.GetCollectableTexture('key'))));
			
			AddGameObject(new Gate('gate_blue', 115, 49, 1, 7, new Image(Assets.GetAtlas('level_1').getTexture('door_b1_open')), new Image(Assets.GetAtlas('level_1').getTexture('door_b1_closed'))));
			AddGameObject(new Switch('switch_blue_1', 112, 52,new Image(Assets.GetCollectableTexture('green_apple')),new Image(Assets.GetCollectableTexture('red_apple'))));
			(GetGameObjectByID('switch_blue_1') as Switch).target = GetGameObjectByID('gate_blue') as Gate;
			(GetGameObjectByID('switch_blue_1') as Switch).keyID = 'gate_key_blue';
			AddGameObject(new Switch('switch_blue_2', 117, 52,new Image(Assets.GetCollectableTexture('green_apple')),new Image(Assets.GetCollectableTexture('red_apple'))));
			(GetGameObjectByID('switch_blue_2') as Switch).target = GetGameObjectByID('gate_blue') as Gate;
			(GetGameObjectByID('switch_blue_2') as Switch).keyID = 'gate_key_blue';
			AddGameObject(new Key('gate_key_blue', 109, 77, new Image(Assets.GetCollectableTexture('key'))));
			
			AddGameObject(new Gate('gate_brown', 115, 32, 1, 7, new Image(Assets.GetAtlas('level_1').getTexture('door_b1_open')), new Image(Assets.GetAtlas('level_1').getTexture('door_b1_closed'))));
			AddGameObject(new Switch('switch_brown_1', 112, 35,new Image(Assets.GetCollectableTexture('green_apple')),new Image(Assets.GetCollectableTexture('red_apple'))));
			(GetGameObjectByID('switch_brown_1') as Switch).target = GetGameObjectByID('gate_brown') as Gate;
			(GetGameObjectByID('switch_brown_1') as Switch).keyID = 'gate_key_brown';
			AddGameObject(new Switch('switch_brown_2', 117, 35,new Image(Assets.GetCollectableTexture('green_apple')),new Image(Assets.GetCollectableTexture('red_apple'))));
			(GetGameObjectByID('switch_brown_2') as Switch).target = GetGameObjectByID('gate_brown') as Gate;
			(GetGameObjectByID('switch_brown_2') as Switch).keyID = 'gate_key_brown';
			AddGameObject(new Key('gate_key_brown', 109, 50, new Image(Assets.GetCollectableTexture('key'))));
			
		}
		
	}

 }