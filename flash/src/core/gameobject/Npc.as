package core.gameobject 
{
	import core.asset.Assets;
	import core.gameobject.collectable.Item;
	import core.level.Level;
	import core.quest.QuestItem;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Shape;
	import starling.events.EnterFrameEvent;
	/**
	 * An NPC requires Items from the player, after collecting these Items the player recieves a reward.
	 * @author SEG.Veenstra
	 */
	public class Npc extends GameObject 
	{
		public const REFRESH_RATE:int = 120;
		
		public var points:int;
		private var timer:int = 0;
		private var _questItems:Vector.<QuestItem> = new Vector.<QuestItem>();
		private var currentQuestItem:QuestItem;
		
		protected var bubble:Image = new Image(Assets.GetAtlas('npc').getTexture('bubble'));
		protected var check:Image = new Image(Assets.GetAtlas('npc').getTexture('finished'));
		
		
		public function Npc(id:String, x:Number,y:Number, width:Number,height:Number, points:int) 
		{
			super(id, x, y);
			this.points = points;
			solid = false;
			width *= Level.GRIDSIZE;
			height *= Level.GRIDSIZE;
			x *= Level.GRIDSIZE;
			y *= Level.GRIDSIZE;
			collider = new Rectangle(x,y, width , height);
			Draw(width, height);
			addEventListener(EnterFrameEvent.ENTER_FRAME, OnEnterFrame);
			addChild(bubble);
			bubble.y = -bubble.height;
			bubble.x = ((collider.width - bubble.width) / 2);
			addChild(check);
			check.y = bubble.y + Level.GRIDSIZE/2;
			check.x = bubble.x + Level.GRIDSIZE / 2;
			check.visible = false;
			
		}
		
		private function OnEnterFrame(e:EnterFrameEvent):void 
		{
			if (active && !paused)
			{
				
				if (questItems.length > 0 && !currentQuestItem)
				{
					currentQuestItem = questItems[0];
					currentQuestItem.image.visible = true;
				}
				if (questItems.length > 1 && currentQuestItem)
				{
					timer++;
					if (timer > REFRESH_RATE)
					{
						timer = 0;
						ShowNextQuestItem();
						trace('refresh!');
					}
				}
				if(questItems == null || questItems.length == 0)
				{
					bubble.visible = false;
				}
			}
		}
		
		private function ShowNextQuestItem():void
		{
			var curIndex:int = questItems.indexOf(currentQuestItem);
			var newIndex:int = curIndex == questItems.length - 1 ? 0 : curIndex + 1;

			// Turn of current item
			currentQuestItem.image.visible = false;
			// Set new current item
			currentQuestItem = questItems[newIndex];
			// turn new item on
			currentQuestItem.image.visible = true;
			// Check if this item has been collected
			if (currentQuestItem.collected)
			{
				setChildIndex(check, getChildIndex(currentQuestItem.image) + 1);
				check.visible = true;
			}
			else
				check.visible = false;
		}
		
		/**
		 * Returns the list with all the questItems for this NPC
		 */
		public function get questItems():Vector.<QuestItem>
		{
			return _questItems;
		}
		
		/**
		 * Get a list with all the referenced items
		 * @param	showAllreadyCollected
		 * @return
		 */
		public function GetReferencedItems(showAllreadyCollected:Boolean = true):Vector.<Item>
		{
			var result:Vector.<Item> = new Vector.<Item>();
			if (questItems.length > 0)
			{
				for each(var q:QuestItem in questItems)
				{
					if (q.collected && !showAllreadyCollected)
						continue;
					else
						result.push(q.reference);
				}
			}
			return result;
		}
		
		/**
		 * Adds a questitem to the questitems list
		 * @param	questItem
		 */
		public function AddQuestItem(questItem:QuestItem):void
		{
			if (_questItems.indexOf(questItem) == -1)
			{
				_questItems.push(questItem);
				questItem.image.x = bubble.x + Level.GRIDSIZE/2;
				questItem.image.y = bubble.y + Level.GRIDSIZE / 2;
				questItem.image.visible = false;
				addChild(questItem.image);
			}
		}
		
		/**
		 * Remove a questitem by its reference (Item) in the level
		 * @param	item
		 */
		public function RemoveQuestItemByReference(item:Item):void
		{
			var index:int = questItems.indexOf(GetQuestItemByReference(item));
			if (index != -1)
			{
				_questItems.splice(index, 1);
			}
		}
		
		/**
		 * Collect an item 
		 * @param	item
		 */
		public function Collect(item:Item):void
		{
			GetQuestItemByReference(item).collected = true;
			if (currentQuestItem == GetQuestItemByReference(item))
			{
				setChildIndex(check, getChildIndex(currentQuestItem.image) +1);
				check.visible = true;
			}
		}
		
		/**
		 * Get a desired questitem by its reference
		 * @param	item
		 * @return
		 */
		public function GetQuestItemByReference(item:Item):QuestItem
		{
			for each(var q:QuestItem in questItems)
			{
				if (q.reference == item)
					return q;
			}
			return null;
		}
		
		/**
		 * Draw a debug shape
		 * @param	width
		 * @param	height
		 */
		private function Draw(width:Number, height:Number):void
		{
			debugShape = new Shape();
			debugShape.graphics.beginFill(0x92E5FF, 0.6);
			debugShape.graphics.drawRect(0, 0, width, height);
			debugShape.graphics.endFill();
			
			addChild(debugShape);
		}
		
	}

}