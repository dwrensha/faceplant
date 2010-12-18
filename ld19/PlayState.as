package 
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{



		override public function create():void
		{

                     
                    var t:FlxText;
    
		    t = new FlxText(20,20,50,"YOU ARE NOW PLAYING");
		    t.alignment = "center";
		    add(t);
                    
                    return;

		}

		override public function update():void
		{

                    
                    return;
		}
	}
}