package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		
		[Embed(source = 'data/man.png')] private var ImgMan:Class;
		[Embed(source = 'data/cake.png')] private var ImgCake:Class;

		
		public var posx:int = 20;
		public var posy:int = 20;
		public var man:FlxSprite;
		public var cake:FlxSprite;
		
		public var cakex:int = 270;
		public var cakey:int = 150;
		
		override public function create():void
		{	
		
			bgColor = 0xFFFFFFFF;
			
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"Oh! I know!");
			t.size = 16;
			t.alignment = "center";
			add(t);

		
			man = new FlxSprite(posx,posy);
		    man.loadGraphic(ImgMan, false, false, 16, 16);
			
			cake = new FlxSprite(cakex,cakey);
			cake.loadGraphic(ImgCake, false, false, 16,16);
			
			this.add(man);
			this.add(cake);		
				
		}

		
		override public function update():void
		{
			if(FlxG.keys.justPressed("DOWN") || FlxG.keys.pressed("DOWN"))
			{
				posy = posy + 1;
			}
			if(FlxG.keys.justPressed("UP")|| FlxG.keys.pressed("UP"))
			{
				posy = posy - 1;
			}
			if(FlxG.keys.justPressed("RIGHT")|| FlxG.keys.pressed("RIGHT"))
			{
				posx = posx + 1;
			}
			if(FlxG.keys.justPressed("LEFT")|| FlxG.keys.pressed("LEFT"))
			{
				posx = posx - 1;
			}
			man.x = posx;
			man.y = posy;

			super.update();	
			
			if(Math.abs(posx - cakex) < 10 && Math.abs(posy - cakey) < 10)
			{
				FlxG.state = new WinState();	
			
			}
		}
	
	}
			
}

