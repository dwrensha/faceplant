package 
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		[Embed(source="assets/verdant_tiles.png")] private var ImgVerdant:Class;


		protected var _objects:FlxGroup;
		protected var _student:Student;

		override public function create():void
		{

                     
                    var t:FlxText;
    
		    t = new FlxText(20,20,100,"YOU ARE NOW PLAYING");
		    t.alignment = "center";
		    add(t);
                    

                    _student  = new Student(100,100);
                    add(_student);

                    // scrolling?
		    FlxG.follow(_student,2.5);
		    FlxG.followAdjust(0.5,0.0);
		    FlxG.followBounds(0,0,640,640);

		    _objects = new FlxGroup();
                    _objects.add(_student);
                    
                    return;

		}


		override public function update():void
		{

                    super.update();

//			FlxU.collide(_objects,_objects);

                    if(FlxG.keys.justPressed("SPACE")){
                        FlxG.state = new VictoryState();
                    }
                    
                    return;
		}
	}
}