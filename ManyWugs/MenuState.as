package
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
	[Embed(source="data/Nitz.ttf", fontFamily="Nitz", embedAsCFF="false")] 	public var Nitz:String;
//	[Embed(source="data/NitzBold.ttf", fontFamily="NitzBold", embedAsCFF="false")] 	public var NitzBold:String;
		public function MenuState()
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"Wugs");
			t.font = "Nitz";
			t.size = 12;
			t.alignment = "center";
			add(t);
			t = new FlxText(FlxG.width/2-50,FlxG.height-20,100,"click to play");
			t.font = "Nitz";
			t.alignment = "center";
			t.size = 12;
			add(t);  

		}

		override public function update():void
		{
			if(FlxG.mouse.justPressed())
				FlxG.state = new PlayState();
		}
	}
}
