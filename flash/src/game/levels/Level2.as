package game.levels 
{
	import core.asset.Assets;
	import core.gameobject.Climbable;
	import core.gameobject.collectable.Item;
	import core.gameobject.collectable.PowerUp;
	import core.gameobject.Door;
	import core.gameobject.Enemy;
	import core.gameobject.Npc;
	import core.gameobject.Platform;
	import core.level.Level;
	import core.quest.QuestItem;
	import game.objects.characters.Teenager;
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
			AddGameObject(new Platform('ground', 0, 55, 100, 5));
			AddGameObject(new Platform('top_border', 0, 0, 100, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 60));
			AddGameObject(new Platform('right_border', 99, 0, 1, 60));
			
			AddGameObject(new Platform('platform_1', 10, 50, 10, 1));
			var item1:Item = new Item('item_1', 13, 40);
			var item2:Item = new Item('item_2', 23, 50);
			AddGameObject(item1);
			AddGameObject(item2);
			
			var npc1:Npc = new Npc('npc_1', 20, 50, 3, 5, 100000);
			AddGameObject(npc1);
			npc1.AddQuestItem(new QuestItem(item1,new Image(Assets.GetCollectableTexture('bone'))));
			npc1.AddQuestItem(new QuestItem(item2,new Image(Assets.GetCollectableTexture('key'))));
			
			AddGameObject(new PowerUp('powerup_1', 30, 50, 250, 20));
			
			AddGameObject(new Enemy('enemy_1', 40, 50, 5, 5, 40, 0));
			(GetGameObjectByID('enemy_1') as Enemy).requiredItem = item1;
			
			AddGameObject(new Climbable('ladder_1', 20, 0, 3, 50));
			
			AddGameObject(new Door('door_1', 35, 48));
			AddGameObject(new Door('door_2', 55, 48));
			(GetGameObjectByID('door_1') as Door).SetExits(null, GetGameObjectByID('door_2') as Door, null, null);
			(GetGameObjectByID('door_2') as Door).SetExits(GetGameObjectByID('door_1') as Door, null, null, null);
		}
		
	}

}