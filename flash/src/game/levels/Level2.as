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
	import game.objects.items.powerups.Bread;
	import game.objects.items.powerups.Couscous;
	import game.objects.items.powerups.Fish;
	import game.objects.items.powerups.Juice;
	import game.objects.items.powerups.Marble;
	import game.objects.items.powerups.Meat;
	import game.objects.items.powerups.Milk;
	import game.objects.items.powerups.Pineapple;
	import starling.display.Image;
	import core.visualobject.VisualObject;
	import starling.display.MovieClip;
	
	/**
	 * ...
	 * @author P.Krips
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
			
			// Visuals
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'wall')), 15, 74);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'wall')), 15, 57);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'wall')), 15, 40);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'wall')), 15, 23);
			//AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'shelves_drinks')), 27, 78);
			
			AddGameObject(new Climbable('ladder_1', 117, 81, 3, 9));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'ladder_1')), 117, 74);
			AddGameObject(new Climbable('ladder_2', 117, 47, 3, 26));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'ladder_2')), 117, 40);
			AddGameObject(new Climbable('ladder_3', 117, 16, 3, 23));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'ladder_3')), 117, 16);
			
			
			
			var item1:Item = new Item('item_1', 120, 86,new Image(Assets.GetCollectableTexture('necklace')));
			var item2:Item = new Item('item_2', 120, 86,new Image(Assets.GetCollectableTexture('needle')));
			var item3:Item = new Item('item_3', 101, 64,new Image(Assets.GetCollectableTexture('broccoli')));
			var item4:Item = new Item('item_4', 76, 44,new Image(Assets.GetCollectableTexture('rice')));
			var item5:Item = new Item('item_5', 94, 81, new Image(Assets.GetCollectableTexture('water')));
			var item6:Item = new Item('item_6', 88, 30, new Image(Assets.GetCollectableTexture('chicken')));
			var item7:Item = new Item('item_7', 14, 12, new Image(Assets.GetCollectableTexture('toolbox')));
			AddGameObject(item1);
			AddGameObject(item2);
			AddGameObject(item3);
			AddGameObject(item4);
			AddGameObject(item5);
			AddGameObject(item6);
			AddGameObject(item7);
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('collectables', 'garbage')), 120, 86);
			
			SetPlayer(new Teenager('player', 6, 85));
			
			
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
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2_structure', 'super_market_structure')), 14, 16);
			
			
			AddGameObject(new Juice('juice_1', 32, 84));
			AddGameObject(new Juice('juice_2', 50, 78));
			AddGameObject(new Milk('milk_1', 64, 84));
			AddGameObject(new Marble('marble_5', 117, 80));
			
			AddGameObject(new Platform('platform_1', 15, 73, 106, 1));
			AddGameObject(new Platform('platform_fountain_1', 46, 71, 8, 1));
			AddGameObject(new Platform('platform_fountain_2', 47.5, 69, 5, 1));
			AddGameObject(new Platform('platform_fountain_3', 49, 67, 2, 1));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'fountain')), 46, 67);
			AddGameObject(new Apple('apple_5', 29, 64));
			AddGameObject(new Pineapple('pineapple_6', 63, 67));
			AddGameObject(new Marble('marble_1', 43, 58));
			AddGameObject(new Marble('marble_2', 40, 58));
			AddGameObject(new Marble('marble_3', 37, 58));
			AddGameObject(new Marble('marble_4', 63, 58));
			AddGameObject(new Apple('apple_7', 81, 67));
			AddGameObject(new Marble('marble_6', 117, 63));
			
			AddGameObject(new Platform('platform_2', 15, 56, 106, 1));
			AddGameObject(new Bread('bread_1', 29, 53));
			AddGameObject(new Bread('bread_2', 44, 47));
			AddGameObject(new Couscous('couscous_1', 90, 50));
			
			AddGameObject(new Platform('platform_3', 15, 39, 106, 1));
			AddGameObject(new Platform('platform_discount', 37, 29, 10, 4));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'DISCOUNT_sign')), 37, 29);
			AddGameObject(new Platform('platform_NEW', 28, 30, 3, 3));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'NEW_SIGN')), 28, 30);
			AddGameObject(new Platform('platform_crate', 17, 36, 4, 3));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'crate')), 17, 36);
			AddGameObject(new Fish('fish_1', 51, 30));
			AddGameObject(new Fish('fish_2', 38, 33));
			AddGameObject(new Meat('meat_1', 73, 36));
			AddGameObject(new Meat('meat_2', 100, 33));
			
			AddGameObject(new Platform('platform_4', 15, 22, 100, 1));
			AddGameObject(new Platform('SUPER', 39, 18, 20, 3));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'SUPER_sign')), 39, 18);
			AddGameObject(new Platform('MARKET', 71, 18, 20, 3));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'MARKET_sign')), 71, 18);
			
			AddGameObject(new Platform('platform_5', 15, 16, 106, 1));
			
			
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
			
			AddGameObject(new Gate('gate_red', 115, 83, 1, 7,new Image(Assets.GetAtlas('level_2').getTexture('gate_red_open')),new Image(Assets.GetAtlas('level_2').getTexture('gate_red_closed'))));
			AddGameObject(new Switch('switch_red_1', 112, 86,new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_red_open')),new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_red_closed'))));
			(GetGameObjectByID('switch_red_1') as Switch).target = GetGameObjectByID('gate_red') as Gate;
			(GetGameObjectByID('switch_red_1') as Switch).keyID = 'gate_key_red';
			AddGameObject(new Switch('switch_red_2', 117, 86,new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_red_open')),new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_red_closed'))));
			(GetGameObjectByID('switch_red_2') as Switch).target = GetGameObjectByID('gate_red') as Gate;
			(GetGameObjectByID('switch_red_2') as Switch).keyID = 'gate_key_red';
			AddGameObject(new Key('gate_key_red', 63, 12, new Image(Assets.GetCollectableTexture('key_red'))));
			
			AddGameObject(new Gate('gate_green', 115, 66, 1, 7, new Image(Assets.GetAtlas('level_2').getTexture('gate_green_open')), new Image(Assets.GetAtlas('level_2').getTexture('gate_green_closed'))));
			AddGameObject(new Switch('switch_green_1', 112, 69,new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_green_open')),new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_green_closed'))));
			(GetGameObjectByID('switch_green_1') as Switch).target = GetGameObjectByID('gate_green') as Gate;
			(GetGameObjectByID('switch_green_1') as Switch).keyID = 'gate_key_green';
			AddGameObject(new Switch('switch_green_2', 117, 69,new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_green_open')),new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_green_closed'))));
			(GetGameObjectByID('switch_green_2') as Switch).target = GetGameObjectByID('gate_green') as Gate;
			(GetGameObjectByID('switch_green_2') as Switch).keyID = 'gate_key_green';
			AddGameObject(new Key('gate_key_green', 40, 25, new Image(Assets.GetCollectableTexture('key_green'))));
			
			AddGameObject(new Gate('gate_blue', 115, 49, 1, 7, new Image(Assets.GetAtlas('level_2').getTexture('gate_blue_open')), new Image(Assets.GetAtlas('level_2').getTexture('gate_blue_closed'))));
			AddGameObject(new Switch('switch_blue_1', 112, 52,new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_blue_open')),new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_blue_closed'))));
			(GetGameObjectByID('switch_blue_1') as Switch).target = GetGameObjectByID('gate_blue') as Gate;
			(GetGameObjectByID('switch_blue_1') as Switch).keyID = 'gate_key_blue';
			AddGameObject(new Switch('switch_blue_2', 117, 52,new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_blue_open')),new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_blue_closed'))));
			(GetGameObjectByID('switch_blue_2') as Switch).target = GetGameObjectByID('gate_blue') as Gate;
			(GetGameObjectByID('switch_blue_2') as Switch).keyID = 'gate_key_blue';
			AddGameObject(new Key('gate_key_blue', 109, 77, new Image(Assets.GetCollectableTexture('key_blue'))));
			
			AddGameObject(new Gate('gate_brown', 115, 32, 1, 7, new Image(Assets.GetAtlas('level_2').getTexture('gate_open')), new Image(Assets.GetAtlas('level_2').getTexture('gate_closed'))));
			AddGameObject(new Switch('switch_brown_1', 112, 35,new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_brown_open')),new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_brown_closed'))));
			(GetGameObjectByID('switch_brown_1') as Switch).target = GetGameObjectByID('gate_brown') as Gate;
			(GetGameObjectByID('switch_brown_1') as Switch).keyID = 'gate_key_brown';
			AddGameObject(new Switch('switch_brown_2', 117, 35,new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_brown_open')),new Image(Assets.GetTextureFromAtlas('level_2', 'key_lock_brown_closed'))));
			(GetGameObjectByID('switch_brown_2') as Switch).target = GetGameObjectByID('gate_brown') as Gate;
			(GetGameObjectByID('switch_brown_2') as Switch).keyID = 'gate_key_brown';
			AddGameObject(new Key('gate_key_brown', 102, 50, new Image(Assets.GetCollectableTexture('key_brown'))));
			
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'fence_1')), 115, 74);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'fence_2')), 115, 40);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'fence_3')), 115, 16);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_2', 'fence_4')), 115, 6);
			
			
			var npc1:Npc = new Npc('npc_1', 68, 85, 3, 5, 1000);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('secondary_characters', 'woman_old')), 68, 85);
			npc1.AddQuestItem(new QuestItem(item1,new Image(Assets.GetCollectableTexture('necklace'))));
			AddGameObject(npc1);
			
			var npc2:Npc = new Npc('npc_2', 102, 50, 3, 6, 1000);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('secondary_characters', 'guy_without_tools')), 102, 50);
			npc2.AddQuestItem(new QuestItem(item7, new Image(Assets.GetCollectableTexture('toolbox'))));
			AddGameObject(npc2);
			
			var npc3:Npc = new Npc('npc_3', 109, 33, 3, 6, 1000);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('secondary_characters', 'guy_needs_card')), 109, 33);
			AddGameObject(npc3);
			//npc3.AddQuestItem(new QuestItem(item4,new Image(Assets.GetCollectableTexture('key'))));
			
			var kid_on_bike_1:MovableEnemy = new MovableEnemy('kid_on_bike_1', 27, 87, 4, 3, 10, 0, 60, 3);
			kid_on_bike_1.SetAnimations(new MovieClip(Assets.GetAtlas('secondary_characters').getTextures('kid_on_bike_01'), 2), new MovieClip(Assets.GetAtlas('secondary_characters').getTextures('kid_on_bike_02'), 2));
			AddGameObject(kid_on_bike_1)
			var kid_on_bike_2:MovableEnemy = new MovableEnemy('kid_on_bike_2', 75, 87, 4, 3, 10, 0, 107, 3);
			kid_on_bike_2.SetAnimations(new MovieClip(Assets.GetAtlas('secondary_characters').getTextures('kid_on_bike_03'), 2), new MovieClip(Assets.GetAtlas('secondary_characters').getTextures('kid_on_bike_04'), 2));
			AddGameObject(kid_on_bike_2)
			AddGameObject(new Enemy('teenager_gang', 87, 68, 12, 5, 10, 0));
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('secondary_characters', 'teenager_gang_01')), 87, 68);
			var guy_with_basket:MovableEnemy = new MovableEnemy('guy_with_basket', 44, 50, 3, 6, 10, 0, 86, 2);
			guy_with_basket.SetAnimations(new MovieClip(Assets.GetAtlas('secondary_characters').getTextures('guy_with_basket'), 2));
			AddGameObject(guy_with_basket);
			
			//debug = false;
		}
		
	}

 }