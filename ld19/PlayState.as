package 
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source="assets/verdant_tiles.png")] private var ImgVerdant:Class;


		override public function create():void
		{

                     
                    var t:FlxText;
    
		    t = new FlxText(20,20,100,"YOU ARE NOW PLAYING");
		    t.alignment = "center";
		    add(t);
                    

                    var s:Student;
                    s = new Student(100,100);
                    add(s);

                    return;

		}

		override public function update():void
		{

                    super.update();

                    if(FlxG.keys.justPressed("SPACE")){
                        FlxG.state = new VictoryState();
                    }
                    
                    return;
		}
	}
}