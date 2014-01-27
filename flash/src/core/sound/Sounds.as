package core.sound 
{
	import core.sound.SoundManager;
	import flash.media.Sound;
	import Game;
	/**
	 * ...
	 * @author Henderikus
	 */
	public class Sounds 
	{
		//background music
		[Embed(source="../../game/assets/sounds/Level 1 - Sweet Sunshine Final.mp3")]
		public static const MusicLevel1:Class;
		[Embed(source="../../game/assets/sounds/Level 2 - Walking Worries Away.mp3")]
		public static const MusicLevel2:Class;
		[Embed(source="../../game/assets/sounds/Level 3 - Hurry! - final.mp3")]
		public static const MusicLevel3:Class;
		[Embed(source="../../game/assets/sounds/Level 4 - music2 revised (4).mp3")]
		public static const MusicLevel4:Class;
		[Embed(source="../../game/assets/sounds/Level 5 - music.mp3")]
		public static const MusicLevel5:Class;
		
		//feedback sounds
		[Embed(source="../../game/assets/sounds/Bird sounds.mp3")]
		public static const Birds:Class;
		[Embed(source="../../game/assets/sounds/Fail Sound.mp3")]
		public static const Fail:Class;
		[Embed(source="../../game/assets/sounds/Get ART drugs.mp3")]
		public static const GetDrugs:Class;
		[Embed(source="../../game/assets/sounds/Get inventory item.mp3")]
		public static const GetInvItem:Class;
		[Embed(source="../../game/assets/sounds/get item.mp3")]
		public static const GetItem:Class;
		[Embed(source="../../game/assets/sounds/Get key.mp3")]
		public static const GetKey:Class;
		[Embed(source="../../game/assets/sounds/Getting hurt.mp3")]
		public static const GetHurt:Class;
		[Embed(source="../../game/assets/sounds/Give inventory item.mp3")]
		public static const GiveItem:Class;
		[Embed(source="../../game/assets/sounds/jump short.mp3")]
		public static const Jump:Class;
		[Embed(source="../../game/assets/sounds/Take ART drugs.mp3")]
		public static const TakeDrugs:Class;
		[Embed(source="../../game/assets/sounds/Unlock door.mp3")]
		public static const UnlockDoor:Class;
		[Embed(source="../../game/assets/sounds/Victory Music.mp3")]
		public static const Victory:Class;
		
		public function Sounds() 
		{
			
		}
		
		static public function addAllSounds():void {
			//background music
			Game.soundmanager.addSound("musiclevel1", new MusicLevel1() as Sound);
			Game.soundmanager.addSound("musiclevel2", new MusicLevel2() as Sound);
			Game.soundmanager.addSound("musiclevel3", new MusicLevel3() as Sound);
			Game.soundmanager.addSound("musiclevel4", new MusicLevel4() as Sound);
			Game.soundmanager.addSound("musiclevel5", new MusicLevel5() as Sound);
			
			//feedback sounds
			Game.soundmanager.addSound("birds", new Birds() as Sound);
			Game.soundmanager.addSound("fail", new Fail() as Sound);
			Game.soundmanager.addSound("getdrugs", new GetDrugs() as Sound);
			Game.soundmanager.addSound("getinvitem", new GetInvItem() as Sound);
			Game.soundmanager.addSound("getitem", new GetItem() as Sound);
			Game.soundmanager.addSound("getkey", new GetKey() as Sound);
			Game.soundmanager.addSound("gethurt", new GetHurt() as Sound);
			Game.soundmanager.addSound("giveitem", new GiveItem() as Sound);
			Game.soundmanager.addSound("jump", new Jump() as Sound);
			Game.soundmanager.addSound("takedrugs", new TakeDrugs() as Sound);
			Game.soundmanager.addSound("unlockdoor", new UnlockDoor() as Sound);
			Game.soundmanager.addSound("victory", new Victory() as Sound);
		}
		
	}

}