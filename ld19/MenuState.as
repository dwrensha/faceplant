package 
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{

		[Embed(source="assets/title.mp3")] private var SndTitle:Class;

		override public function create():void
		{

                     
                    var t:FlxText;
    
		    t = new FlxText(20,20,100,"space to continue");
		    t.alignment = "center";
		    add(t);
                    
                    FlxG.playMusic(SndTitle);

                    FlxG.mouse.hide();

                    return;

		}

		override public function update():void
		{

                    super.update();

                    if(FlxG.keys.justPressed("SPACE")){
                        FlxG.state = new PlayState();
//                        FlxG.state = new VictoryState();
                    }
                   
                    return;
		}
	}
}
