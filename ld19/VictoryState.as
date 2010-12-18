package 
{
	import org.flixel.*;

	public class VictoryState extends FlxState
	{

		[Embed(source="assets/victory.mp3")] private var SndVictory:Class;

		override public function create():void
		{

                     
                    var t:FlxText;
    
		    t = new FlxText(100,20,200,"YOU ARE VICTORIOUS");
		    t.alignment = "center";
		    add(t);
                    
                    FlxG.playMusic(SndVictory);

                    return;

		}

		override public function update():void
		{

                    super.update();

                    if(FlxG.keys.justPressed("SPACE")){
                        FlxG.state = new PlayState();
                    }
                   
                    return;
		}
	}
}
