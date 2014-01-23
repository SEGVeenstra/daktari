package core.asset 
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * This class can load assets
	 * @author SEG.Veenstra
	 */
	public class Assets 
	{
		private static var atlases:Dictionary = new Dictionary();
		
		[Embed(source = "/game/assets/collectables/collectables.png")]
		public static const collectables_TEXTURE:Class;
		[Embed(source = "/game/assets/collectables/collectables.xml", mimeType="application/octet-stream")]
		public static const collectables_XML:Class;
		
		[Embed(source = "/game/assets/level1/level_1.png")]
		public static const level_1_TEXTURE:Class;
		[Embed(source = "/game/assets/level1/level_1.xml", mimeType="application/octet-stream")]
		public static const level_1_XML:Class;
		
		[Embed(source = "/game/assets/level2/supermarket.png")]
		public static const level_2_TEXTURE:Class;
		[Embed(source = "/game/assets/level2/supermarket.xml", mimeType="application/octet-stream")]
		public static const level_2_XML:Class;
		
		[Embed(source = "/game/assets/level2/structure and background.png")]
		public static const level_2_structure_TEXTURE:Class;
		[Embed(source = "/game/assets/level2/structure and background.xml", mimeType="application/octet-stream")]
		public static const level_2_structure_XML:Class;
		
		[Embed(source = "/game/assets/level3/level_3.png")]
		public static const level_3_TEXTURE:Class;
		[Embed(source = "/game/assets/level3/level_3.xml", mimeType="application/octet-stream")]
		public static const level_3_XML:Class;
		
		[Embed(source = "/game/assets/npc/npc.png")]
		public static const npc_TEXTURE:Class;
		[Embed(source = "/game/assets/npc/npc.xml", mimeType="application/octet-stream")]
		public static const npc_XML:Class;
		
		[Embed(source = "/game/assets/level1/npc.png")]
		public static const npc1_TEXTURE:Class;
		[Embed(source = "/game/assets/level1/npc.xml", mimeType="application/octet-stream")]
		public static const npc1_XML:Class;
		
		[Embed(source = "/game/assets/tutorial/tutorial.png")]
		public static const tutorial_TEXTURE:Class;
		[Embed(source = "/game/assets/tutorial/tutorial.xml", mimeType="application/octet-stream")]
		public static const tutorial_XML:Class;
		
		[Embed(source = "/game/assets/level1/dog.png")]
		public static const dog_TEXTURE:Class;
		[Embed(source = "/game/assets/level1/dog.xml", mimeType="application/octet-stream")]
		public static const dog_XML:Class;
		
		[Embed(source = "/game/assets/characters/teenager.png")]
		public static const teenager_TEXTURE:Class;
		[Embed(source = "/game/assets/characters/teenager.xml", mimeType="application/octet-stream")]
		public static const teenager_XML:Class;
		
		[Embed(source = "/game/assets/characters/adult.png")]
		public static const adult_TEXTURE:Class;
		[Embed(source = "/game/assets/characters/adult.xml", mimeType="application/octet-stream")]
		public static const adult_XML:Class;
		
		[Embed(source = "/game/assets/characters/secondary_characters.png")]
		public static const secondary_characters_TEXTURE:Class;
		[Embed(source = "/game/assets/characters/secondary_characters.xml", mimeType="application/octet-stream")]
		public static const secondary_characters_XML:Class;
		
		// COMICS [start]
		// intro's
		[Embed(source = "/game/assets/comics/comic_intro_1.png")]
		public static const intro_1_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_intro_1.xml", mimeType="application/octet-stream")]
		public static const intro_1_XML:Class;
		
		[Embed(source = "/game/assets/comics/comic_intro_2.png")]
		public static const intro_2_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_intro_2.xml", mimeType="application/octet-stream")]
		public static const intro_2_XML:Class;
		
		[Embed(source = "/game/assets/comics/comic_intro_3.png")]
		public static const intro_3_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_intro_3.xml", mimeType="application/octet-stream")]
		public static const intro_3_XML:Class;
		
		[Embed(source = "/game/assets/comics/comic_intro_4.png")]
		public static const intro_4_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_intro_4.xml", mimeType="application/octet-stream")]
		public static const intro_4_XML:Class;
		
		[Embed(source = "/game/assets/comics/comic_intro_5.png")]
		public static const intro_5_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_intro_5.xml", mimeType="application/octet-stream")]
		public static const intro_5_XML:Class;
		
		// outro's
		[Embed(source = "/game/assets/comics/comic_outro_1.png")]
		public static const outro_1_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_outro_1.xml", mimeType="application/octet-stream")]
		public static const outro_1_XML:Class;
		
		[Embed(source = "/game/assets/comics/comic_outro_2_1.png")]
		public static const outro_2_1_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_outro_2_1.xml", mimeType="application/octet-stream")]
		public static const outro_2_1_XML:Class;
		
		[Embed(source = "/game/assets/comics/comic_outro_2_2.png")]
		public static const outro_2_2_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_outro_2_2.xml", mimeType="application/octet-stream")]
		public static const outro_2_2_XML:Class;
		
		[Embed(source = "/game/assets/comics/comic_outro_3.png")]
		public static const outro_3_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_outro_3.xml", mimeType="application/octet-stream")]
		public static const outro_3_XML:Class;
		
		[Embed(source = "/game/assets/comics/comic_outro_4.png")]
		public static const outro_4_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_outro_4.xml", mimeType="application/octet-stream")]
		public static const outro_4_XML:Class;
		
		[Embed(source = "/game/assets/comics/comic_outro_5.png")]
		public static const outro_5_TEXTURE:Class;
		[Embed(source = "/game/assets/comics/comic_outro_5.xml", mimeType="application/octet-stream")]
		public static const outro_5_XML:Class;
		
		// COMICS [end]
		
		[Embed(source = "/game/assets/menu/menu.png")]
		public static const menu_TEXTURE:Class;
		[Embed(source = "/game/assets/menu/menu.xml", mimeType="application/octet-stream")]
		public static const menu_XML:Class;
		
		[Embed(source = "/game/assets/enemy/enemy.png")]
		public static const enemy_TEXTURE:Class;
		[Embed(source = "/game/assets/enemy/enemy.xml", mimeType="application/octet-stream")]
		public static const enemy_XML:Class;
		
		public function Assets() 
		{
			
		}
		
		/**
		 * Get an texture atlas
		 * @param	atlasName
		 * @return
		 */
		public static function GetAtlas(name:String):TextureAtlas
		{
			if (atlases[name] == undefined)
			{
				var texture:Texture = GetTexture(name + '_TEXTURE');
				var xml:XML = GetXML(name + '_XML');
				atlases[name] = new TextureAtlas(texture, xml);
			}
			return atlases[name];
		}
		
		public static function GetTexture(name:String):Texture
		{
			var bitmap:Bitmap = new Assets[name]();
			return Texture.fromBitmap(bitmap);
		}
		
		public static function GetTextureFromAtlas(atlas:String, texture:String):Texture
		{
			return GetAtlas(atlas).getTexture(texture);
		}
		
		public static function GetXML(name:String):XML
		{
			return XML(new Assets[name]);
		}
		
		public static function GetCollectableTexture(name:String):Texture
		{
			return GetAtlas('collectables').getTexture(name);
		}
	}

}