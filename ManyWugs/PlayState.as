package
{
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{

	[Embed(source = "data/tiletest.png")] private var Tiles:Class;
	[Embed(source = 'data/map.txt', mimeType = "application/octet-stream")] private var Map:Class;
	[Embed(source="data/Nitz.ttf", fontFamily="Nitz", embedAsCFF="false")] 	public var Nitz:String;

	public var player:Player;
	public var playerLayer:FlxGroup;
	public var wugLayer:FlxGroup;
	public var wugCount:Number;
	public var mapLayer:FlxGroup;
	public var map:FlxTilemap;

	public var darkness:FlxSprite;


		public function PlayState():void
		{
			super();
			initMap();
	//		initPlayer();
		}

		override public function create():void
		{
			darkness = new FlxSprite(0,0);
			darkness.createGraphic(FlxG.width, FlxG.height, 0xff000000);
			darkness.scrollFactor.x = darkness.scrollFactor.y = 0;

			darkness.blend = "multiply";

			this.add(mapLayer);
			this.add(playerLayer);

			wugCount = 1 + FlxU.random()*8;
			initWugs(wugCount);
			this.add(wugLayer);

			this.add(darkness);

			var t:FlxText;
			t = new FlxText(0,0,100,"How many?");
			t.font = "Nitz";
			t.size = 12;
			add(t);

			var light:Light = new Light(FlxG.mouse.x, FlxG.mouse.y, darkness);
			add(light);

		}

		override public function update():void
		{
			super.update();
			map.collide(wugLayer);
			checkAnswer();
			
		}

		override public function render():void
		{
			super.render();

		}

		public function initMap():void
		{
			mapLayer = new FlxGroup();
			map = new FlxTilemap();
			map.startingIndex = 0;
			map.drawIndex = 0;
			map.loadMap(new Map, Tiles);
 			mapLayer.add(map);
		}

		public function initPlayer():void
		{
			playerLayer = new FlxGroup();
			player = new Player(20, 50);
			playerLayer.add(player);
		}

		public function initWugs(wugCount:Number):void
		{
		wugLayer = new FlxGroup();
		var i:int;
		for (i = 0; i < wugCount; i++)
			{
			var wug:Wug;
			wug = new Wug(FlxU.random()*20+16,FlxU.random()*20+16);
			wugLayer.add(wug);
			}
		}

		public function checkAnswer():void
		{
		
		
		}
	}
}