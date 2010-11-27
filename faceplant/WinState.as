package
{
	import org.flixel.*;
	
	public class WinState extends FlxState
	{
		override public function create():void
		{
			bgColor = 0x00000000;
			var t:FlxText;
			t = new FlxText(0,30,FlxG.width / 2,"Happy Birthday!");
			t.size = 16;
			t.alignment = "center";
			add(t);
			t = new FlxText(10,460,50,"click to continue");
			t.alignment = "center";
			add(t);
			
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			super.update();
			
			if(FlxG.mouse.justPressed())
			{
				FlxG.mouse.hide();
				//FlxG.state = new PlayState();
				
			}
		}
	}
}
// ActionScript file