package game.levels 
{
	import core.asset.Assets;
	import core.gameobject.Climbable;
	import core.gameobject.collectable.Item;
	import core.gameobject.collectable.Medication;
	import core.gameobject.Enemy;
	import core.gameobject.Finish;
	import core.gameobject.Npc;
	import core.gameobject.Platform;
	import core.level.Level;
	import core.quest.QuestItem;
	import core.visualobject.VisualObject;
	import game.comics.ComicOutro4;
	import game.objects.characters.Adult;
	import starling.display.Image;
	
	/**
	 * ...
	 * @author Stephan E.G. Veenstra
	 */
	public class Level4 extends Level 
	{
		
		public function Level4() 
		{
			super(0, 0);
			SetEndingComic(ComicOutro4);
		}

		override protected function Build():void 
		{
			Game.gameScreen.userInterface.activateDisease(true);
			SetBackground(new Image(Assets.GetAtlas('level_1').getTexture('background')));
			
			// Visual Back
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'ground')),0,40);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'rain_pipe')),2,20);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'vertical_beam')),30,10);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'vertical_beam')),57,10);
			
			SetPlayer(new Adult('player', 6, 35, true));
			
			// Borders
			AddGameObject(new Platform('ground_left', 0, 40, 30, 5));
			AddGameObject(new Platform('ground_mid', 30, 44, 26, 1));
			AddGameObject(new Platform('ground_right', 56, 40, 44, 5));
			AddGameObject(new Platform('top_border', 0, 0, 100, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 45));
			AddGameObject(new Platform('right_border', 99, 0, 1, 45));
			
			AddGameObject(new Finish('finish', 90, 39, 4, 1));
			
			// platforms
			
			AddGameObject(new Platform('pharmacy_roof', 0, 20, 15, 1));
			AddGameObject(new Platform('construction_floor_1', 30, 30, 28, 1));
			AddGameObject(new Platform('construction_floor_2', 30, 20, 28, 1));
			AddGameObject(new Platform('construction_floor_3', 30, 10, 31, 1));
			
			AddGameObject(new Platform('construction_blockade', 40, 10, 1, 10));
			
			AddGameObject(new Platform('construction_sign_left', 28, 37, 1, 3));
			AddGameObject(new Platform('construction_sign_right', 58, 37, 1, 3));
			
			AddGameObject(new Platform('crane_beam', 17, 21, 11, 1, true));
			
			
			// climbables
			AddGameObject(new Climbable('rain_pipe', 3, 20, 1, 20));
			AddGameObject(new Climbable('construction_ladder_left', 34, 20, 3, 10));
			AddGameObject(new Climbable('construction_ladder_right', 44, 10, 3, 10));
			AddGameObject(new Climbable('construction_chain', 59, 15, 1, 11));
			
			// Items
			var book:Item = new Item('book', 31, 5, new Image(Assets.GetCollectableTexture('bone')));
			AddGameObject(book);
			AddGameObject(new Medication('med_1', 20, 35));
			
			// Enemy
			AddGameObject(new Enemy('pit', 30, 41, 26, 3, 100, 0));
			
			// NPC
			var kid:Npc = new Npc('bookless_kid', 68, 35, 3, 5, 500);
			kid.AddQuestItem(new QuestItem(book, new Image(Assets.GetCollectableTexture('bone'))));
			AddGameObject(kid);
			
			
			//debug = false;
		}
	}

}