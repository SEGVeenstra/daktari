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
	import game.objects.items.powerups.Apple;
	import game.objects.items.powerups.Banana;
	import game.objects.items.powerups.Bread;
	import game.objects.items.powerups.Couscous;
	import game.objects.items.powerups.Pineapple;
	import starling.display.Image;
	import starling.display.MovieClip;
	
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
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'ground')), 0, 40);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'pharmacy')), 0, 20);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'rain_pipe')),2,20);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'vertical_beam')),30,10);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'vertical_beam')), 57, 10);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'horizontal_beam')), 30, 10);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'horizontal_beam')), 30, 20);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'horizontal_beam')), 30, 30);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'fence')), 38, 11);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'chain')), 58, 10);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'pole')), 28, 37);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'pole')), 58, 37);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'school')), 75, 25);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'ladder')), 34, 19);
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'ladder')), 44, 9);
			
			
			SetPlayer(new Adult('player', 6, 35, true));
			
			AddVisualObject(new VisualObject(Assets.GetTextureFromAtlas('level_4', 'crane')), 17, 4);
			
			
			// Borders
			AddGameObject(new Platform('ground_left', 0, 40, 30, 5));
			AddGameObject(new Platform('ground_mid', 30, 44, 26, 1));
			AddGameObject(new Platform('ground_right', 56, 40, 44, 5));
			AddGameObject(new Platform('top_border', 0, 0, 100, 1));
			AddGameObject(new Platform('left_border', 0, 0, 1, 45));
			AddGameObject(new Platform('right_border', 99, 0, 1, 45));
			
			AddGameObject(new Finish('finish', 88, 39, 4, 1));
			
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
			var book:Item = new Item('book', 31, 5, new Image(Assets.GetCollectableTexture('water')));
			AddGameObject(book);
			AddGameObject(new Medication('med_1', 20, 35));
			
			AddGameObject(new Bread('bread_1', 1, 16));
			AddGameObject(new Bread('bread_2', 5, 16));
			AddGameObject(new Bread('bread_3', 10, 16));
			
			AddGameObject(new Apple('apple_1', 20, 17));
			AddGameObject(new Pineapple('pineapple_1', 40, 26));
			AddGameObject(new Pineapple('pineapple_2', 44, 26));
			AddGameObject(new Pineapple('pineapple_3', 48, 26));
			AddGameObject(new Pineapple('pineapple_4', 52, 26));
			AddGameObject(new Banana('banana_1', 48, 16));
			AddGameObject(new Banana('banana_2', 52, 16));
			
			AddGameObject(new Couscous('couscous_1', 44, 6));
			AddGameObject(new Couscous('couscous_2', 48, 6));
			AddGameObject(new Couscous('couscous_3', 52, 6));
			
			// Enemy
			AddGameObject(new Enemy('pit', 30, 41, 26, 3, 100, 0));
			
			// NPC
			var kid:Npc = new Npc('bookless_kid', 68, 36, 3, 4, 500);
			kid.SetAnimations(new MovieClip(Assets.GetAtlas('npc').getTextures('girl')),new MovieClip(Assets.GetAtlas('npc').getTextures('girl')));
			kid.AddQuestItem(new QuestItem(book, new Image(Assets.GetCollectableTexture('water'))));
			AddGameObject(kid);
			
			this.backgroundmusic = "musiclevel4";
			
			
			
			debug = false;
		}
	}

}