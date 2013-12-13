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
		
		[Embed(source = "/game/assets/level1/items_level_1.png")]
		public static const items_level_1_TEXTURE:Class;
		[Embed(source = "/game/assets/level1/items_level_1.xml", mimeType="application/octet-stream")]
		public static const items_level_1_XML:Class;
		
		[Embed(source = "/game/assets/level1/level_1.png")]
		public static const level_1_TEXTURE:Class;
		[Embed(source = "/game/assets/level1/level_1.xml", mimeType="application/octet-stream")]
		public static const level_1_XML:Class;
		
		
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
		
		public static function GetXML(name:String):XML
		{
			return XML(new Assets[name]);
		}
	}

}